const pay = () => {
  Payjp.setPublicKey("pk_test_5bffe1085a4a387b083f39a4"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    

    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
  
    const card = {
      number: formData.get("record_place[number]"),
      cvc: formData.get("record_place[cvc]"),
      exp_month: formData.get("record_place[exp_month]"),
      exp_year: `20${formData.get("record_place[exp_year]")}`
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token);
    debugger
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });
  });
};
window.addEventListener("load", pay)