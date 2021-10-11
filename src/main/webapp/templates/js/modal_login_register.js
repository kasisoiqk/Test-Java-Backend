// Login - Register
const btnLogin = document.querySelector('.modal-tab__login');
const btnRegister = document.querySelector('.modal-tab__register');

btnLogin.onclick = function(event) {
	let modalInput = document.querySelector('.modal__input');
	let modalForm = document.querySelector('.modal__form');
	if (!modalInput.classList.contains('input-login')) {
		modalInput.classList.add('input-login');
	}
	modalInput.classList.remove('input-register');
	modalInput.style.width = '310px';
	modalForm.action = path + "/j_spring_security_check"
}

btnRegister.onclick = function(event) {
	let modalInput = document.querySelector('.modal__input');
	let modalForm = document.querySelector('.modal__form');
	if (!modalInput.classList.contains('input-register')) {
		modalInput.classList.add('input-register');
	}
	modalInput.classList.remove('input-login');
	modalInput.style.width = '620px';
	modalForm.action = path + "/join"
}

// Choose image
function chooseFile() {
	document.getElementById('file-input').click();
}

document.getElementById('file-input').onchange = function(event) {
	document.getElementById('image-change').setAttribute('src', URL.createObjectURL(event.target.files[0]))
}

// Do sign in
function doSignIn() {
	var data = $('form').serialize();
	$.post(path + '/j_spring_security_check', data);
}

// Do join
function doJoin() {
	var id = null;

	var data = {};
	var formData = $('.modal__form').serializeArray();
	$.each(formData, function(i, v) {
		data[v.name] = v.value;
	});
	console.log(data)
	$.ajax({
		url: path + '/api/join',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType: 'json',
		success: function(result) {
			console.log(result.id);
			id = result.id;

			var formData = new FormData(document.getElementById('post-form'));

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(this.responseText);
				}
			}

			xhttp.open('POST', path + '/api/upload/image', false);
			formData.append('type', 'create');
			formData.append('id', id);
			xhttp.send(formData);
			setTimeout(function() {
				window.location = path + '/home';
			}, 1000);
		},
		error: function(error) {
			console.log(error);
		}
	});


}