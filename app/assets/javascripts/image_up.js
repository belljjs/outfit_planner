// Show the image when the user choose a image file of the item to be added.
function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#new-item-show').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

$(document).ready(() => {
    // When a the image file is chosen or changed to the other file, run the function
    // readURL to show the image.
    $("#imgInp").change(function() {
      $("#image-frame").css('border','white')
      readURL(this);
    });

})