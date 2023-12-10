/*global $*/
$(document).on('turbolinks:load', function() {
  const $loginForm = $('#login-form');
  if ($loginForm.length) {
    $loginForm.on('ajax:error', function(event, data, status, xhr) {
      const $errorElement = $('#login-error-messages');
      if ($errorElement.length) {
        $errorElement.empty();
        if (data.errors) {
          data.errors.forEach(function(error) {
            const $errorItem = $('<div>').text(error);
            $errorElement.append($errorItem);
          });
        }
      }
    });
  }
});