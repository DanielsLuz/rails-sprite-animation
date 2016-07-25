var animate = function(i, element) {
  var frameWidth = $(element).width();
  var frameCount = $(element).attr("frameCount");
  var horizontal = $(element).attr("flag");
  console.log(Boolean(horizontal))

  var frameRate = $(element).attr("frameRate");
  var stopFrame = $(element).attr("stopFrame");
  var stopTime = $(element).attr("stopTime");

  var handle;

  var cont = 0;
  var rollImage = function() {
    var margin_size = -1 * (cont*frameWidth);
 
    if(horizontal == 1){
      style = margin_size+'px 0px'; //horizontal
    } else {
      style = '0px '+margin_size+'px';
    }

    $(element).css('background-position', style);

    if(cont == stopFrame){
      clearInterval(handle);
      setTimeout(loop, stopTime)
    }

    cont++;
    if(cont == frameCount){
      cont = 0;
    }
  }

  var loop = function(){
    handle = setInterval(rollImage, frameRate);
  }

  loop();
}
$(function(){
  $("div[class^='animated']").each(animate);
})
