var users = []

const modal = document.querySelector('.modal');
const modalInput = document.querySelector('.modal__input');


function loadTableUser() {
	// Get data form back-end
	$.ajax({
		url: path + '/api/users',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(users),
		dataType: 'json',
		success: function(result) {
			users = result;
			var tableUser = document.querySelector('.table__body');
			tableUser.innerHTML = '';

			users.forEach(function(value, index) {
				var tableRow = document.createElement('tr');
				tableRow.innerHTML = `
		        <tr>
		            <td>
		                <div class="table__user">
		                    <img src="${path + value.emoij}" alt="${value.username}">
		                    <span>${value.name}</span>
		                </div>
		            </td>
		            <td>${value.username}</td>
		            <td>${value.password}</td>
		            <td>${value.email}</td>
		            <td>${value.phone}</td>
		            <td>${value.address}</td>
		            <td><label for="modal-detail" onclick="showDetail(${value.id})">Detail</label></td>
		        </tr>
		        `;
				tableUser.append(tableRow);
			})
		},
		error: function(error) {
			console.log(error);
		}
	});
}

loadTableUser()

function showDetail(id) {
	// Set modal is detail user
	if (modalInput.classList.contains('input-add')) {
		modalInput.classList.remove('input-add');
	}
	if (!modalInput.classList.contains('input-detail')) {
		modalInput.classList.add('input-detail');
	}

	// Set action for form
	document.querySelector('.modal__form').action = '/update-user';

	// Render user detail to form
	var user = users.find(function(user, index, users) {
		return user.id === id;
	})

	document.getElementById('id').value = user.id
	username.value = user.username
	password.value = user.password
	document.getElementById('name').value = user.name
	email.value = user.email
	phone.value = user.phone
	address.value = user.address
	document.querySelector('#image-change').src = path + user.emoij
}

function showAdd() {
	// Set modal is add user
	if (modalInput.classList.contains('input-detail')) {
		modalInput.classList.remove('input-detail');
	}
	if (!modalInput.classList.contains('input-add')) {
		modalInput.classList.add('input-add');
	}

	// Set action for form
	document.querySelector('.modal__form').action = '/add-user';

	// Reset user detail
	id.value = ''
	password.value = ''
	username.value = ''
	document.getElementById('name').value = ''
	email.value = ''
	phone.value = ''
	address.value = ''
	document.querySelector('#image-change').src = path + '/templates/images/unknown-avatar.jpg'
}

function updateUser() {
	var data = {};
	var formData = $('.modal__form').serializeArray();
	$.each(formData, function(i, v) {
		data[v.name] = v.value;
	});
	$.ajax({
		url: path + '/api/update',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType: 'json',
		success: function(result) {
			console.log(result);

			var formData = new FormData(document.getElementById('post-form'));

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(this.responseText);
				}
			}

			xhttp.open('POST', path + '/api/upload/image', false);
			formData.append('type', 'update');
			formData.append('id', result.id);
			xhttp.send(formData);
			loadTableUser();
		},
		error: function(error) {
			console.log(error);
		}
	});
}

function removeUser() {
	var data = {};
	var formData = $('.modal__form').serializeArray();
	$.each(formData, function(i, v) {
		data[v.name] = v.value;
	});
	$.ajax({
		url: path + '/api/remove',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType: 'json',
		success: function(result) {
			console.log(result);
			loadTableUser();
		},
		error: function(error) {
			console.log(error);
		}
	});
}

// Choose image
function chooseFile() {
	document.getElementById('file-input').click();
}

document.getElementById('file-input').onchange = function(event) {
	document.getElementById('image-change').setAttribute('src', URL.createObjectURL(event.target.files[0]))
}
