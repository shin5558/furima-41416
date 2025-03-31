document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const price = parseInt(priceInput.value);

      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const fee = Math.floor(price * 0.1);
        const profit = price - fee;

        document.getElementById("add-tax-price").innerText = fee;
        document.getElementById("profit").innerText = profit;
      } else {
        document.getElementById("add-tax-price").innerText = '-';
        document.getElementById("profit").innerText = '-';
      }
    });
  }
});