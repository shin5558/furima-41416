document.addEventListener("turbo:load", () => {

  const elements = payjp.elements();

  const numberElement = elements.create('cardNumber');
  numberElement.mount('#number-form');

  const expiryElement = elements.create('cardExpiry');
  expiryElement.mount('#expiry-form');

  const cvcElement = elements.create('cardCvc');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert("カード情報が正しくありません");
      } else {
        const token = response.id;
        const tokenObj = document.createElement('input');
        tokenObj.setAttribute('type', 'hidden');
        tokenObj.setAttribute('name', 'token');
        tokenObj.setAttribute('value', token);
        form.appendChild(tokenObj);
        form.submit();
      }
    });
  });






});