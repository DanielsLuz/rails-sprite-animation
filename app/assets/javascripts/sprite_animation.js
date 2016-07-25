var animate = function(i, element) {
  var frameLength = $(element).width();
  var frameCount = $(element).attr("frameCount");
  var horizontal = $(element).attr("flag");

  var template = $(element).attr("template");
  var frameRate = $(element).attr("frameRate");

  var cont = 0;
  var rollImage = function() {
    var margin_size = -1 * (cont*frameLength);
    position = template.replace("[length]", margin_size);

    $(element).css('background-position', position);

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
