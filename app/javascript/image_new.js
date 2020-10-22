$(function() {

  function filefield(index) {
    console.log(index)
    const html = `
        <input class="image" data-index="${index}" id="${index} "type="file" name="item[item_images_attributes][${index}][image]" id="item_item_images_attributes_${index}_image">
        <div class="iamge_delete-button"><br>
          <p>削除</p>
        </div>`;
    console.log(html)
    return html;    
  };
  const buildImg = (index, url) => {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //ここの記述で、インプットボタンを押した時にイベントが起きる
  $(document).on('change', ".image", function(e){
    // $(".image_group").append(image(fileIndex[0]));
    // console.log("ヤッター");
    // fileIndex.shift();
    // fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    var index = $(this).data("index")
    // console.log(index)
    index += 1;
    // console.log(index)
    const file_field = filefield(index);
    $(".image_group").append(file_field)
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      console.log(blobUrl)
  })
  $('.image_group').on('click', '.iamge_delete-button',function () {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.image').length == 0) $('.sell-container__content__upload__items__box__label ').append(image(fileIndex[0]));
  });

});