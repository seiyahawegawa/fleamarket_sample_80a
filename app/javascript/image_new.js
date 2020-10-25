$(function() {

  function filefield(index) {
    const html = `
        <input class="image" data-index="${index}" id="item_item_images_attributes_${index}_image" type="file" name="item[item_images_attributes][${index}][image]" id="item_item_images_attributes_${index}_image" >
        `;
    return html;    
  };
  const buildImg = (index, url) => {
    const html = `
    <div class="image-content">
      <img data-index="${index}" src="${url}" width="100px" height="100px"class="image-box">
      <div class="image_delete-button" width="50px" height="50px" >
            <p class="delete">削除</p> 
      </div>
    </div>  
    `;
    return html;
  }
  const image= (index)=>{
    const html =`
    <ul id="output-box-secound">
      <div id="image-input-secound">
        <label class="sell-container__content__upload__items__box__label" for="item_item_images_attributes_${index}_image">
          <pre style= "display: inherit;">
            <i class="fas fa-camera fa-lg"></i>
          </pre>
        </label>
    </ul>    
    `;
    return html;
    
  }
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
      $("#output-box").prepend(buildImg(index, blobUrl));
      $(".image_group").append(file_field)
      $('.sell-container__content__upload__items__box__label').attr("for", `item_item_images_attributes_${index}_image`);
      $(".drop-and-drag").text("")
    } 
    else if (ImageContent==4){
      $('#image-input').hide()
      $('#output-box').append(image(index))
      console.log('ヤッター')
      $("#output-box").prepend(buildImg(index, blobUrl));
      $(".image_group").append(file_field)
      $('.sell-container__content__upload__items__box__label').attr("for", `item_item_images_attributes_${index}_image`);
      $(".drop-and-drag").text("")
      console.log("やったー")
    } else if (ImageContent<=8){
      $("#output-box-secound").prepend(buildImg(index, blobUrl));
      $(".image_group").append(file_field)
      $('.sell-container__content__upload__items__box__label').attr("for", `item_item_images_attributes_${index}_image`);
      $(".drop-and-drag").text("")
    } else if (ImageContent ==9){
      console.log('最高')
      $("#image-input-secound").hide()
      $("#output-box-secound").prepend(buildImg(index, blobUrl));
      $(".image_group").append(file_field)
      $('.sell-container__content__upload__items__box__label').attr("for", `item_item_images_attributes_${index}_image`);
    }
  })
  $(document).on('click', ".image_delete-button",function () {
    $(this).parent().remove();
    var ImageContent = $(".image-content").length 
    if (ImageContent==9){
      $("#image-input-secound").show()
    }else if (ImageContent==4){
      $("#image-input-secound").hide()
      $("#image-input").show()
      $("#output-box-secound").remove()
    }
  });
});