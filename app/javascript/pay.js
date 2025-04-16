
  const payjp =  Payjp(PAYJP_PUBLIC_KEY);
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
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
  
        console.log("フォーム送信前: tokenを挿入しました");
 
        form.submit(); // トークンを埋め込んで送信
      }
    });
  });

window.addEventListener("DOMContentLoaded", pay);