var Users = {}

Users.init = function () {
  Users.validations();
};

Users.validations =  function () {
  var user = $('#new_user').jcheck({ language: 'pt-br' });
  user.validates("user[username]", "user[email]", "user[password]", "user[password_confirmation]", {presence: true});

  var login = $('#login').jcheck({ language: 'pt-br' });
  login.validates("user[email]", "user[password]", {presence: true});

  var edit_user = $('#edit_user').jcheck({ language: 'pt-br' });
  edit_user.validates("user[username]", "user[email]", {presence: true});
};

$(document).ready( function  () { Users.init(); });