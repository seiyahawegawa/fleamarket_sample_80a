$(document).on('turbolinks:load',()=> {
  console.log("ヤッター")
  const image = (index)=> {
    const html = 
      `< div data-index="${index}" class="sell-container__content__upload__items__box__label" >
          <input multiple="multiple" class="sell-container__content__upload__items__box__input" 
          id="item_images${index}" type="file" name="[item_images][image][${index}]">
          <div class="iamge__delete--button">
            <p>削除</p>
          </div>
        </div>`
    return html    
  }
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  $('.sell-container__content__upload__items__box__label').on('change','sell-container__content__upload__items__box__input',function(e){
    $('.image-input').append(image(fileIndex[0]));
    console.log("ヤッター");
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  })
  $('.image-input').on('click', '.iamge__delete--butto', function () {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.sell-container__content__upload__items__box__input').length == 0) $('.image-input').append(image(fileIndex[0]));
  });
});