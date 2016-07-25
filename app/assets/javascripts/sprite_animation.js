var animate = function(i, element) {
  var cont = 0;
  var frameWidth = $(element).width();
  var frameCount = $(element).attr("frameCount");
  var horizontal = $(element).attr("flag");

  var frameRate = $(element).attr("frameRate");
  var stopFrame = $(element).attr("stopFrame");
  var stopTime = $(element).attr("stopTime");

  var sleep = function (milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
      if((new Date().getTime() - start) > milliseconds) {
        break;
      }
    }
  }

  var rollImage = function() {
    var margin_size = -1 * (cont*frameWidth);
    if(horizontal){
      style = margin_size+'px 0px'; //horizontal
    }
    else{
      style = '0px '+margin_size+'px'
    }

    $(element).css('background-position', style);

    if(cont == stopFrame){
      sleep(stopTime);
    }

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
