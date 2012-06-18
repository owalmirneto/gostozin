var Feedbacks = {}

Feedbacks.init = function () {
  Feedbacks.validations();
};

Feedbacks.validations =  function () {
  var modal = $('#new_feedback').jcheck({ language: 'pt-br' });
  modal.validates("feedback[name]", "feedback[email]", "feedback[message]", {presence: true});
};

$(document).ready( function  () { Feedbacks.init(); });