var animate = function(i, img) {
  var frameCount = $(img).attr("frameCount");
  var frameLength = $(img).attr("frameLength"); 
  var frameSide = $(img).attr("frameSide");  
  var margin = "margin-" + frameSide;

  var cont = 0;
  var rollImage = function() {
    $(img).css(margin, -1 * (cont*frameLength));  
    cont++;
    if(cont == frameCount){
      cont = 0;
    }   
  }
  setInterval(rollImage, 80);
}
$(function(){
  $("img[class^='animated']").each(animate); 
})
