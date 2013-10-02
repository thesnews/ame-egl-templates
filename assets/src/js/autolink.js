$.fn.autoLink = function() {
  this.contents()
    .filter(function() { return this.nodeType === 3})
    .each(function(i, node) {
      if (node.nodeValue.match(/https?:/)) {
        $(node).replaceWith(
          node.nodeValue.replace(/(https?:\/\/\S+)/g, "<a href=\"$1\">$1</a>")
        );
      } else if (node.nodeValue.match(/www\./)) {
        $(node).replaceWith(
          node.nodeValue.replace(/(www\.\S+)/g, "<a href=\"http://$1\">$1</a>")
        );
      }else if (node.nodeValue.match(/\.(com|org|net|edu)/)) {
        $(node).replaceWith(
          node.nodeValue.replace(/(\S+\.(com|org|net|edu))/g, "<a href=\"http://$1\">$1</a>")
        );
      }
    }
  );
  return this;
}

$(function(){
	var regEx = /(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)/;

    $(".classified-container ul li").filter(function() {
        return $(this).html().match(regEx);
    }).each(function() {
        $(this).html($(this).html().replace(regEx, "<a href=\"mailto:$1\">$1</a>"));
    });

	$('.classified-container ul li').autoLink();
});