var Links = {}

Links.init = function () {
  Links.validations();
};

Links.validations =  function () {
  var modal = $('#modal_link').jcheck({ language: 'pt-br' });
  modal.validates("link[title]", "link[url]", {presence: true});

  var form = $('#form_link').jcheck({ language: 'pt-br' });
  form.validates("link[title]", "link[url]", {presence: true});
};

$(document).ready( function  () { Links.init(); });