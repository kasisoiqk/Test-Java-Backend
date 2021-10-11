package com.laptrinhjavaweb.api;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.util.EncrytedPasswordUtils;
import com.laptrinhjavaweb.util.SecurityUtils;

@RestController
@RequestMapping(value = "/api")
public class HomeAPI {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@RequestMapping(value = { "/join" }, method = RequestMethod.POST)
	public UserDTO userJoin(@RequestBody UserDTO userDTO) {
		
		UserEntity userEntity = new UserEntity();
		userEntity.setUsername(userDTO.getUsername());
		userEntity.setPassword(EncrytedPasswordUtils.encrytePassword(userDTO.getPassword()));
		userEntity.setName(userDTO.getName());
		userEntity.setEmail(userDTO.getEmail());
		userEntity.setAddress(userDTO.getAddress());
		userEntity.setPhone(userDTO.getPhone());
		
		RoleEntity roleEntity = roleRepository.findOneByCode("USER");
		List<RoleEntity> roles = new ArrayList<>();
		roles.add(roleEntity);
		userEntity.setRoles(roles);
		
		userEntity = userRepository.save(userEntity);
		
		userDTO.setId(userEntity.getId());
		
		return userDTO;
		
	}
	
	@RequestMapping(value = { "/upload/image" }, method = RequestMethod.POST)
	public String saveImageUser(HttpSession session, HttpServletRequest resquest,
			@RequestParam(name = "type", required = true) String type,
			@RequestParam(name = "id", required = true) Long id,
			@RequestParam(name = "file-input", required = true) CommonsMultipartFile file) throws IOException {
		
		System.out.println(id + " - " + type + " - " + file.getOriginalFilename());
		
		if(!file.getOriginalFilename().equals("")) {
			// Save image
			ServletContext context = session.getServletContext();  
		    String path = context.getRealPath("/templates/images/user/");  
		    String filename = file.getOriginalFilename();  
		  
		    System.out.println(path + filename);        
		  
		    byte[] bytes = file.getBytes();  
		    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
		         new File(path + File.separator + filename)));  
		    stream.write(bytes);  
		    stream.flush();  
		    stream.close();  

		    UserEntity userEntity = userRepository.findOne(id);
		    userEntity.setEmoij("/templates/images/user/" + filename);
		    userRepository.save(userEntity);
		}
		
		return "redirect:/home";
	}
	
	@RequestMapping(value = { "/users" }, method = RequestMethod.POST)
	public List<UserDTO> findAllUsers() {
		
		if(!SecurityUtils.isAuthentication()) {
			return null;
		}
		
		List<UserDTO> users = new ArrayList<>();
		List<UserEntity> userEntities = userRepository.findAll();
		for(UserEntity userEntity : userEntities) {
			UserDTO userDTO = new UserDTO();
			userDTO.setId(userEntity.getId());
			userDTO.setUsername(userEntity.getUsername());
			userDTO.setPassword(userEntity.getPassword());
			userDTO.setPhone(userEntity.getPhone());
			userDTO.setName(userEntity.getName());
			userDTO.setAddress(userEntity.getAddress());
			userDTO.setEmail(userEntity.getEmail());
			userDTO.setEmoij(userEntity.getEmoij());
			users.add(userDTO);
		}
		
		return users;
	}
	
	@RequestMapping(value = { "/update" }, method = RequestMethod.POST)
	public UserDTO userUpdate(@RequestBody UserDTO userDTO) {
		
		UserEntity userEntity = new UserEntity();
		userEntity.setId(userDTO.getId());
		userEntity.setUsername(userDTO.getUsername());
		userEntity.setPassword(EncrytedPasswordUtils.encrytePassword(userDTO.getPassword()));
		userEntity.setName(userDTO.getName());
		userEntity.setEmail(userDTO.getEmail());
		userEntity.setAddress(userDTO.getAddress());
		userEntity.setPhone(userDTO.getPhone());
		
		RoleEntity roleEntity = roleRepository.findOneByCode("USER");
		List<RoleEntity> roles = new ArrayList<>();
		roles.add(roleEntity);
		userEntity.setRoles(roles);
		
		userEntity = userRepository.save(userEntity);
		
		return userDTO;
		
	}
	
	@RequestMapping(value = { "/remove" }, method = RequestMethod.POST)
	public UserDTO userRemove(@RequestBody UserDTO userDTO) {
		
		UserEntity userEntity = new UserEntity();
		userEntity.setId(userDTO.getId());
		userEntity.setUsername(userDTO.getUsername());
		userEntity.setPassword(EncrytedPasswordUtils.encrytePassword(userDTO.getPassword()));
		userEntity.setName(userDTO.getName());
		userEntity.setEmail(userDTO.getEmail());
		userEntity.setAddress(userDTO.getAddress());
		userEntity.setPhone(userDTO.getPhone());
		
		RoleEntity roleEntity = roleRepository.findOneByCode("USER");
		List<RoleEntity> roles = new ArrayList<>();
		roles.add(roleEntity);
		userEntity.setRoles(roles);
		
		userRepository.delete(userEntity.getId());
		
		return userDTO;
		
	}
	
}
