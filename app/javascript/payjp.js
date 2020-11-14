$(function(){
  $('#cardcreateform').on('submit', function(e) {
    e.preventDefault()
    Payjp.setPublicKey('pk_test_111e372b838357b123d827a8');
    var card = {
      number: document.getElementById("card-number").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value,
      cvc: document.getElementById("cvc").value
    };
    if (card.number == "" || card.cvc == "") {
      alert("入力漏れがあります");
    } else {
      Payjp.createToken(card, function(status, response) {
        if (status === 200 ) {
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          $('#cardcreateform').get(0).submit();
          alert("登録に成功しました");
        } else {
          alert("カード情報が正しくありません");
        }
      });
    }
  });
});