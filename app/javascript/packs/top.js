document.addEventListener('turbolinks:load', () => {
  const loginForm = document.querySelector('#login-form');
  if (loginForm) {
    loginForm.addEventListener('ajax:error', (event) => {
      const [data, status, xhr] = event.detail;
      const errorElement = document.querySelector('#login-error-messages');
      if (errorElement) {
        errorElement.innerHTML = '';
        if (data.errors) {
          data.errors.forEach((error) => {
            const errorItem = document.createElement('div');
            errorItem.textContent = error;
            errorElement.appendChild(errorItem);
          });
        }
      }
    });
  }
  const registrationForm = document.querySelector('#registration-form');
  if (registrationForm) {
    registrationForm.addEventListener('ajax:error', (event) => {
      const [data, status, xhr] = event.detail;
      const errorElement = document.querySelector('#registration-error-messages');
      if (errorElement) {
        errorElement.innerHTML = '';
        if (data.errors) {
          data.errors.forEach((error) => {
            const errorItem = document.createElement('div');
            errorItem.textContent = error;
            errorElement.appendChild(errorItem);
          });
        }
      }
    });
  }
})

$(document).on('click', '.login-btn', function() {
  var Login_form = $(".main__login-form");
  var Signup_form = $(".main__signup-form");
  
  if (Login_form.hasClass('show')) {
    Login_form.fadeTo(200, 0, function() {
      Login_form.removeClass('show').addClass('hidden');
    });
  } else {
    Login_form.fadeTo(200, 0.95, function() {
      Login_form.removeClass('hidden').addClass('show');
    });
  }
  if (Signup_form.hasClass('show')) {
    Signup_form.fadeTo(200, 0, function() {
      Signup_form.removeClass('show').addClass('hidden');
    });
  }
});

$(document).on('click', '#login-close-btn', function() {
  var Login_form = $(".main__login-form");
  
  Login_form.fadeOut(200, function() {
    Login_form.removeClass('show').addClass('hidden');
  });
});

$(document).on('click', '.signup-btn', function() {
  var Login_form = $(".main__login-form");
  var Signup_form = $(".main__signup-form");
  
  if (Signup_form.hasClass('show')) {
    Signup_form.fadeTo(200, 0, function() {
      Signup_form.removeClass('show').addClass('hidden');
    });
  } else {
    Signup_form.fadeTo(200, 0.95, function() {
      Signup_form.removeClass('hidden').addClass('show');
    });
  }
  if (Login_form.hasClass('show')) {
    Login_form.fadeTo(200, 0, function() {
      Login_form.removeClass('show').addClass('hidden');
    });
  }
});

$(document).on('click', '#signup-close-btn', function() {
  var Signup_form = $(".main__signup-form");
    
  Signup_form.fadeOut(200, function() {
    Signup_form.removeClass('show').addClass('hidden');
  });
});
