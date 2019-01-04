var velocity = 0.5;

function update(){
  var pos = $(window).scrollTop();
  $('.parallax').each(function() {
    var $element = $(this);
    // subtract some from the height b/c of the padding
    var height = $element.height()-18;
    $(this).css('backgroundPosition', '50% ' + Math.round((height - pos) * velocity) +  'px');
  });
}

$(document).ready(function () {
  $('div#second').scroll(function() {
      didScroll = true;
  });
});
