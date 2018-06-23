function slide_next_back() {
    if (run_next_mode)
        slide_next();
    else
        slide_back();
}
function slide_back() {
    run_next_mode = false;
    index--;
    if (index < 0)
        index = maxindex;
    slide_change();
}
function slide_next() {
    run_next_mode = true;
    index++;
    if (index > maxindex)
        index = 0;
    slide_change();
}

function slide_change() {
    var list_news = document.getElementById("list_news");

    sLink = '/Tools/News.aspx?page=' + index + '&menu_id=' + menu_id;
    AjaxRequest.get(
        {
            'url': sLink
		, 'onSuccess': function (req) {
		    if (req.responseXML.getElementsByTagName('Item').length > 0) {
		        var sHtml = '';
		        for (var i = 0; i < req.responseXML.getElementsByTagName('Item').length; i++) {
		            with (req.responseXML.getElementsByTagName('Item').item(i)) {
		                var name = getNodeValue(getElementsByTagName('Name'));
		                var url = getNodeValue(getElementsByTagName('URL'));

		                sHtml += '<li>';
		                sHtml += '<h2><a href="' + url + '">' + name + '</a></h2>';
		                sHtml += '</li>';
		            }
		        }
		        list_news.innerHTML = sHtml;

		        $("#list_news").hide().fadeIn(1000, "swing");
		    }
		}
		, 'onError': function (req) { }
        }
	)
}