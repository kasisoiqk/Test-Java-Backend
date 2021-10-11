<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home | Test Java Back-end</title>
    <link rel="shortcut icon" href="<c:url value='/templates/favicon.ico'/>" type="image/x-icon">
    <link href="<c:url value='https://fonts.googleapis.com/icon?family=Poppins:display=swap|Material+Icons+Outlined'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/templates/css/home.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/css/modal_login_register.css'/>">
    <link rel="stylesheet" href="<c:url value='/templates/css/base.css'/>">
</head>
<body>
    <div class="app">
    	<header class="app__header">
    		<div class="header__user">
                <a href="<c:url value='/logout'/>">Logout</a>
            </div>
            <div class="header__user">
                <img src="<c:url value='/templates/images/unknown-avatar.jpg'/>" alt="unknown-avatar">
                <span>Admin</span>
            </div>
        </header>
        <div class="sticky-table">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>ID</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Phone number</th>
                        <th>Address</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="table__body">
                    <!-- Js will render list users -->
                </tbody>
            </table>
        </div>
        <div class="app__btn">
            <label for="modal-detail" class="btn-add" onclick="showAdd()">
                <i class="fas fa-user-plus"></i>
                Add user
            </label>
        </div>
        

        <!-- Modal -->
        <input type="checkbox" id="modal-detail" hidden>
        <div class="hello"></div>
        <label class="modal" for="modal-detail" style="background-color: rgba(255, 255, 255, 0.35);">
            <!-- Detail: input-detail ; Add: input-add -->
            <label for="none" class="modal__input input-detail" style="width: 620px">
                <form action="" method="POST" class="modal__form" id="post-form">
                    <div class="modal-form__text hide-add">
                        <h2>Detail user!</h2>
                        <p>You can update or delete this user.</p>
                    </div>
                    <div class="modal-form__text hide-detail">
                        <h2>Add user!</h2>
                        <p>You can add new user.</p>
                    </div>
                    <input type="text" name="id" id="id" placeholder="Id" hidden>
                    <div class="modal-form__group-flex">
                        <div class="modal-form__group-block">
                            <div class="modal-form__group">
                                <i class="modal-form__icon fas fa-id-card"></i>
                                <input class="modal-form__input" type="text" name="username" id="username" placeholder="Username">
                            </div>
                            <div class="modal-form__group">
                                <span class="modal-form__icon material-icons-outlined">lock</span>
                                <input class="modal-form__input" type="password" name="password" id="password"
                                    placeholder="Password">
                            </div>
                            <div class="modal-form__group">
                                <i class="modal-form__icon fas fa-user"></i>
                                <input class="modal-form__input" type="text" name="name" id="name"
                                    placeholder="Name">
                            </div>
                        </div>
                        <div class="modal-form__group-block">
                            <div class="modal-form__group">
                                <i class="modal-form__icon fas fa-envelope"></i>
                                <input class="modal-form__input" type="text" name="email" id="email"
                                    placeholder="Email">
                            </div>
                            <div class="modal-form__group">
                                <i class="modal-form__icon fas fa-phone-square-alt"></i>
                                <input class="modal-form__input" type="text" name="phone" id="phone"
                                    placeholder="Phone number">
                            </div>
                            <div class="modal-form__group">
                                <i class="modal-form__icon fas fa-map-marker-alt"></i>
                                <input class="modal-form__input" type="text" name="address" id="address"
                                    placeholder="Address">
                            </div>
                        </div>
                        <div class="modal-form__group-block modal-form__group-block-avt">
                            <div class="modal-form__group-avt">
                                <div class="modal-form__avt">
                                    <img id="image-change" src="<c:url value='/templates/images/unknown-avatar.jpg'/>" alt="">
                                </div>
                                <input type="file" id="file-input" name="file-input" hidden>
                                <span class="modal-form__avt-btn" onclick="chooseFile()">Choose</span>
                                <div class="modal-form__avt-text">Only images smaller than 512px*512px can be saved. (jpg, jpeg, png, bmp)</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-form__group" style="background-color: transparent;">
                        <div class="modal-form__group modal-form__group-btn hide-add" style="flex: 2;">
                            <span class="modal-form__btn" onclick="updateUser()">UPDATE</span>
                        </div>
                        <div class="modal-form__group modal-form__group-btn hide-add" style="flex: 1;">
                            <span class="modal-form__btn" onclick="removeUser()">REMOVE</span>
                        </div>
                        <div class="modal-form__group modal-form__group-btn hide-detail">
                            <span class="modal-form__btn" onclick="doJoin(), loadTableUser()">ADD</span>
                        </div>
                    </div>
                </form>
            </label>
        </label>
    </div>

	<script>
		const path = '${pageContext.request.contextPath}';
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
    <script src="<c:url value='/templates/js/admin.js'/>"></script>
</body>
</html>