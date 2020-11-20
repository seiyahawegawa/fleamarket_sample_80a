$(function() {

  function filefield(index) {
    const html = `
        <input class="image hoge" data-index="${index}" id="item_item_images_attributes_${index}_image" type="file" name="item[item_images_attributes][${index}][image]" id="item_item_images_attributes_${index}_image" >
        `;
    return html;    
  };
  const buildImg = (index, url) => {
    const html = `
    <div class="image-content" data-index="${index}">
      <img src="${url}" width="100px" height="100px"class="image-box">
      <div class="image_delete-button" width="50px" height="50px" >
            <p class="delete">削除</p> 
      </div>
    </div>  
    `;
    return html;
  }
  $("#select_image").on("click", function() {
    const file_field2 = $(".hoge:last");
    file_field2.trigger("click")
  })

  //ここの記述で、インプットボタンを押した時にイベントが起きる
  $(document).on('change', ".image", function(e){
    var ImageContent = $(".image-content").length
    console.log(ImageContent)
    var index = $(this).data("index")
  
    index += 1;
    const file_field = filefield(index);
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (ImageContent<=3){
      $("#image-input").before(buildImg(ImageContent, blobUrl));
      $(".image_group").append(file_field)
      $('.sell-container__content__upload__items__box__label').attr("for", `item_item_images_attributes_${index}_image`);
      $(".drop-and-drag").text("")
    } 
    else if (ImageContent==4){
      $('#image-input').hide()
      $("#image-input").before(buildImg(ImageContent, blobUrl));
      $('.sell-container__content__upload__items__box__label').attr("for", `item_item_images_attributes_${index}_image`);
      $(".drop-and-drag").text("")
    } else {
      console.log('OK3')
      $("#output-box").append(buildImg(ImageContent, blobUrl));
    }
  })

  $(document).on('click', ".image_delete-button",function () {
    const Index = 1
    const file_field = filefield("1");
    $(this).parent().remove();
    const index = $(this).parent().data("index")
    $(`#item_item_images_attributes_${index}_image`).remove();
    var ImageContent = $(".image-content").length 
    if (ImageContent<=4){
      $("#image-input").show()
    }
    const targetIndex = $(this).parent().data('index')
    // console.log(targetIndex)
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // // // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
  });
});