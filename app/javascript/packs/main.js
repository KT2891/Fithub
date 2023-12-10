document.addEventListener('turbolinks:load', () => {
  const loginForm = document.querySelector('#login-form');
  if (loginForm) {
    loginForm.addEventListener('ajax:error', (event) => {
      const [data, status, xhr] = event.detail;
      console.log(data);
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
})