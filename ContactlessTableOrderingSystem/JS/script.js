/*UserAccountForm.jsp*/
/*----------------------------------------------------------------------*/
function userAccountFormValidation() {
    var fullname = document.getElementById("fullname");
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    var fullnameVal = fullname.value.trim();
    var usernameVal = username.value.trim();
    var passwordVal = password.value;
    var emailVal = email.value.trim();
    var canSubmit = true;

    if (fullnameVal === '' || fullnameVal === null) {
        setFail(fullname, 'Name cannot be empty');
        canSubmit = false;
    } else if (!fullnameLengthValid(fullnameVal)) {
        setFail(fullname, 'Name cannot be longer than 70 characters');
        canSubmit = false;
    } else {
        setPass(fullname);
        fullname.value = fullnameVal;
    }

    if (usernameVal === '' || usernameVal === null) {
        setFail(username, 'Username cannot be empty');
        canSubmit = false;
    } else if (!usernameLengthValid(usernameVal)) {
        setFail(username, 'Username cannot be longer than 45 characters');
        canSubmit = false;
    } else if (!usernameFormatValid(usernameVal)) {
        setFail(username, 'Username can only contain lowercase letters, numbers, dots and underscore');
        canSubmit = false;
    } else {
        setPass(username);
        username.value = usernameVal;
    }

    if (passwordVal === '' || passwordVal === null) {
        setFail(password, 'Password cannot be empty');
        canSubmit = false;
    } else if (!passwordLengthValid(passwordVal)) {
        setFail(password, 'Password cannot be longer than 45 characters');
        canSubmit = false;
    } else if (!passwordFormatValid(passwordVal)) {
        setFail(password, 'Password cannot contain spaces');
        canSubmit = false;
    } else {
        setPass(password);
    }

    if (emailVal === '' || emailVal === null) {
        setFail(email, 'Email cannot be empty');
        canSubmit = false;
    } else if (!emailLengthValid(emailVal)) {
        setFail(email, 'Email cannot be longer than 45 characters');
        canSubmit = false;
    } else if (!emailFormatValid(emailVal)) {
        setFail(email, 'Email is invalid');
        canSubmit = false;
    } else {
        setPass(email);
        email.value = emailVal.toLowerCase();
    }
    return canSubmit;
}

function fullnameLengthValid(fullname) {
    /* 
      Name max length: 70
    */
    var valid = true;
    if (fullname.length > 70) {
        valid = false;
    }
    return valid;
}

function usernameLengthValid(username) {
    /* 
      Username max length: 45
    */
    var valid = true;
    if (username.length > 45) {
        valid = false;
    }
    return valid;
}

function usernameFormatValid(username) {
    /* 
      Username can only have: 
      - Lowercase Letters (a-z) 
      - Numbers (0-9)
      - Dots (.)
      - Underscores (_)
    */
    var valid = false;
    const usernameFormat = /^[a-z0-9_\.]+$/;
    if (username.match(usernameFormat)) {
        valid = true;
    }
    return valid;
}

function passwordLengthValid(password) {
    /* 
      Password max length: 45
    */
    var valid = true;
    if (password.length > 45) {
        valid = false;
    }
    return valid;
}

function passwordFormatValid(password) {
    /* 
      Password can only have: 
      - Non-whitespace characters
    */
    var valid = false;
    const passwordFormat = /^\S*$/;
    if (password.match(passwordFormat)) {
        valid = true;
    }
    return valid;
}

function emailLengthValid(email) {
    /* 
      Email max length: 45
    */
    var valid = true;
    if (email.length > 45) {
        valid = false;
    }
    return valid;
}

function emailFormatValid(email) {
    var valid = false;
    const emailFormat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (email.match(emailFormat)) {
        valid = true;
    }
    return valid;
}

/*UserProfileForm.jsp*/
/*----------------------------------------------------------------------*/
function userProfileFormValidation() {
    var profile = document.getElementById("profile");
    var description = document.getElementById("description");
    var profileVal = profile.value.trim();
    var descriptionVal = description.value.trim();
    var canSubmit = true;
    if (profileVal === '' || profileVal === null) {
        setFail(profile, 'Profile cannot be empty');
        canSubmit = false;
    } else if (!profileLengthValid(profileVal)) {
        setFail(profile, 'Profile cannot be longer than 70 characters');
        canSubmit = false;
    } else {
        setPass(profile);
        profile.value = profileVal;
    }

    if (!descriptionLengthValid(descriptionVal)) {
        setFail(description, 'Description cannot be longer than 70 characters');
        canSubmit = false;
    } else {
        setPass(description);
        description.value = descriptionVal;
    }
    return canSubmit;
}

function profileLengthValid(profile) {
    /* 
      Profile max length: 70
    */
    var valid = true;
    if (profile.length > 70) {
        valid = false;
    }
    return valid;
}

function descriptionLengthValid(description) {
    /* 
      Description max length: 70
    */
    var valid = true;
    if (description.length > 70) {
        valid = false;
    }
    return valid;
}

/*LoginForm.jsp*/
/*----------------------------------------------------------------------*/
function loginValidation() {
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    var usernameVal = username.value.trim();
    var passwordVal = password.value;
    var canSubmit = true;

    if (usernameVal === '' || usernameVal === null) {
        setFail(username, 'Username cannot be empty');
        canSubmit = false;
    } else if (!usernameLengthValid(usernameVal)) {
        setFail(username, 'Username cannot be longer than 45 characters');
        canSubmit = false;
    } else if (!usernameFormatValid(usernameVal)) {
        setFail(username, 'Username can only contain lowercase letters, numbers, dots and underscore');
        canSubmit = false;
    } else {
        setPass(username);
        username.value = usernameVal;
    }

    if (passwordVal === '' || passwordVal === null) {
        setFail(password, 'Password cannot be empty');
        canSubmit = false;
    } else if (!passwordLengthValid(passwordVal)) {
        setFail(password, 'Password cannot be longer than 45 characters');
        canSubmit = false;
    } else if (!passwordFormatValid(passwordVal)) {
        setFail(password, 'Password cannot contain spaces');
        canSubmit = false;
    } else {
        setPass(password);
    }
    return canSubmit;
}

/*MenuItemForm.jsp*/
/*----------------------------------------------------------------------*/
function trimTemp(myString) { 
	return myString.replace(/^\s+|\s+$/g,''); 
}

/*Common functions for form controls manipulation*/
/*----------------------------------------------------------------------*/
function setFail(input, message) {
    var formCtrl = input.parentElement;
    var small = formCtrl.querySelector('small');
    formCtrl.className = 'form-group fail';
    small.innerText = message;
}

function setPass(input) {
    var formCtrl = input.parentElement;
    formCtrl.className = 'form-group pass';
}

function resetDefault() {
    var fullname = document.getElementById("fullname");
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    fullname.parentElement.className = 'form-group';
    username.parentElement.className = 'form-group';
    password.parentElement.className = 'form-group';
    email.parentElement.className = 'form-group';
}

function trimSearchInput() {
    var input = document.getElementById("searchInput");
    inputVal = input.value.trim();
    input.value = inputVal;
}

/*General*/
/*----------------------------------------------------------------------*/
function logout() {
    return confirm("Are you sure you want to logout?");
}

function confirmUserAccountAction(message) {
    return confirm(message);
}