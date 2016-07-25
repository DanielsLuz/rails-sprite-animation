function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if((new Date().getTime() - start) > milliseconds) {
            break;
        }
    }
}

var animate = function(element, frameWidth) {
    var cont = 0;
    var stopFrame = $(element).attr("stopFrame");
    var stopTime = $(element).attr("stopTime");
    var frameCount = $(element).attr("frameCount");
    var frameRate = $(element).attr("frameRate");
    var flag = $(element).attr("flag");
    
    var rollimage = function() {
        var margin_size = -1 * (cont*frameWidth);
        console.log(flag);
        if(flag == 1){
          style = margin_size+'px 0px'; //horizontal
        }
        else{
          style = '0px '+margin_size+'px'
        }
        console.log(style);
        $(element).css('background-position', style);
        cont++;
        
        if(stopFrame != false && cont == stopFrame){
            sleep(stopTime);
        }
        if(cont == frameCount){
            cont = 0;
        }
    }
    setInterval(rollimage, frameRate);
}

$(document).ready(function() {
    $("div[class^='animated']").each(function(i, div) {
        frameWidth = $(div).width();
        animate(div, frameWidth);
    });
})


// var animate = function(i, img) {
//   var frameCount = $(img).attr("frameCount");
//   var frameLength = $(img).attr("frameLength"); 
//   var frameSide = $(img).attr("frameSide");  
//   var margin = "margin-" + frameSide;

//   var cont = 0;
//   var rollImage = function() {
//     $(img).css(margin, -1 * (cont*frameLength));  
//     cont++;
//     if(cont == frameCount){
//       cont = 0;
//     }   
//   }
//   setInterval(rollImage, 80);
// }
// $(function(){
//   $("img[class^='animated']").each(animate); 
// })