//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require nested_form_fields

$(document).on('ready turbolinks:load', function() {
  setTimeout( () => { $(".alert.autoclose").alert('close'); }, 5000);

  $('[name="question[question_type]"]').on('change', function() {
    const type = $(this).val();
    showSections(type);
  });

  function showSections(type) {
    $('#form-placeholder, #form-radio-options').hide();

    switch(type) {
      case 'string_input':
        $('#form-placeholder').show();
        break;
      case 'date':
        break;
      case 'radiobutton_choice':
        $('#form-radio-options').show();
        break;
      case 'radiobutton_choice_with_input':
        $('#form-placeholder, #form-radio-options').show();
        break
    }
  }

  const curType = $('[name="question[question_type]"]:checked').val();
  showSections(curType);
});
