$(document).ready(function() {
  let image_keys = {};
  $('.delete-image').change(function() {
    let checked = $(this).is(':checked');
    let id = $(this).attr('id');
    if (checked) {
      let image_key = $(this).siblings('input').val();
      image_keys[id] = image_key
      $(this).siblings('input').val('');
    } else {
      $(this).siblings('input').val(image_keys[id]);
    }
  });

  $('form').submit(function() {
    console.log('submitting');
    let btn = $(this).find("input[type='submit']");
    btn.attr('disabled','disabled');
  });
});
