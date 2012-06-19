var Feedbacks = {}

Feedbacks.init = function () {
  Feedbacks.validations();
};

Feedbacks.validations =  function () {
  var feedback = $('#new_feedback').jcheck({ language: 'pt-br' });
  feedback.validates("feedback[name]", "feedback[email]", "feedback[message]", {presence: true});
};

$(document).ready( function  () { Feedbacks.init(); });