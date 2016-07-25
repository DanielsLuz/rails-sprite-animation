var animate = function(i, element) {
  var frameLength = $(element).width();
  var frameCount = $(element).attr("frameCount");
  var horizontal = $(element).attr("flag");

  var frameRate = $(element).attr("frameRate");

  var cont = 0;
  var rollImage = function() {
    var margin_size = -1 * (cont*frameLength);
 
    if(horizontal == 1){
      style = margin_size+'px 0px'; //horizontal
    } else {
      style = '0px '+margin_size+'px';
    }

    $(element).css('background-position', style);

    cont++;
    if(cont == frameCount){
      cont = 0;
    }
  }

  setInterval(rollImage, frameRate);
}
$(function(){
  $("div[class^='animated']").each(animate);
})
