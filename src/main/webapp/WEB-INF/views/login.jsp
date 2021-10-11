<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Test Java Back-end</title>
<link rel="shortcut icon" href="<c:url value='/templates/favicon.ico'/>"
	type="image/x-icon">
<link
	href="<c:url value='https://fonts.googleapis.com/icon?family=Poppins:display=swap|Material+Icons+Outlined'/>"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/templates/css/modal_login_register.css'/>">
<link rel="stylesheet" href="<c:url value='/templates/css/base.css'/>">
</head>

<body>
	<div class="app">
		<div class="modal">
			<!-- Login: input-login ; Register: input-register -->
			<div class="modal__input input-login">
				<div class="modal__tab">
					<a href="<c:url value='#'/>" class="modal-tab__login">Login</a> <a
						href="<c:url value='#'/>" class="modal-tab__register">Register</a>
				</div>
				<form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST"
					class="modal__form" id="post-form">
					<div class="modal-form__text hide-register">
						<h2>Sign In Here</h2>
						<p>Log into your account in just a few simple steps.</p>
					</div>
					<div class="modal-form__text hide-login">
						<h2>Register Now!</h2>
						<p>Join with me & set up a free account.</p>
					</div>
					<div class="modal-form__group-flex">
						<div class="modal-form__group-block">
							<div class="modal-form__group">
								<i class="modal-form__icon fas fa-id-card"></i> <input
									class="modal-form__input" type="text" name="username" id="username"
									placeholder="Username">
							</div>
							<div class="modal-form__group">
								<span class="modal-form__icon material-icons-outlined">lock</span>
								<input class="modal-form__input" type="password" name="password"
									id="password" placeholder="Password">
							</div>
							<div class="modal-form__group hide-login">
								<i class="modal-form__icon fas fa-user"></i> <input
									class="modal-form__input" type="text" name="name"
									id="name" placeholder="Name">
							</div>
						</div>
						<div class="modal-form__group-block hide-login">
							<div class="modal-form__group hide-login">
								<i class="modal-form__icon fas fa-envelope"></i> <input
									class="modal-form__input" type="text" name="email" id="email"
									placeholder="Email">
							</div>
							<div class="modal-form__group hide-login">
								<i class="modal-form__icon fas fa-phone-square-alt"></i> <input
									class="modal-form__input" type="text" name="phone" id="phone"
									placeholder="Phone number">
							</div>
							<div class="modal-form__group hide-login">
								<i class="modal-form__icon fas fa-map-marker-alt"></i> <input
									class="modal-form__input" type="text" name="address"
									id="address" placeholder="Address">
							</div>
						</div>
						<div
							class="modal-form__group-block modal-form__group-block-avt hide-login">
							<div class="modal-form__group-avt">
								<div class="modal-form__avt">
									<img id="image-change"
										src="<c:url value='/templates/images/unknown-avatar.jpg'/>"
										alt="">
								</div>
								<input type="file" name="file-input" id="file-input" hidden> <span
									class="modal-form__avt-btn" onclick="chooseFile()">Chọn
									ảnh</span>
								<div class="modal-form__avt-text">Only images smaller than
									512px*512px can be saved. (jpg, jpeg, png, bmp)</div>
							</div>
						</div>
					</div>
					<div class="modal-form__group modal-form__group-btn hide-register">
						<button class="modal-form__btn">SIGN IN</button>
					</div>
					<div class="modal-form__group modal-form__group-btn hide-login">
						<span class="modal-form__btn" onclick="doJoin()">Join</span>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		const path = '${pageContext.request.contextPath}';
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script src="<c:url value='/templates/js/modal_login_register.js'/>"></script>
</body>

</html>