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

function slide_change(page) {
    var ranNum = Math.floor(Math.random() * 999999);
    var list_item = document.getElementById("list_item");

    sLink = '/Tools/BSNews.aspx/menu_id/' + menu_id + '/state/' + state + '/lang_id/' + lang_id + '/page_size/' + page_size + '/page/' + page + '?rnd=' + ranNum;
    AjaxRequest.get(
        {
            'url': sLink
		, 'onSuccess': function (req) {
		    if (req.responseXML.getElementsByTagName('Item').length > 0) {
		        var sHtml = '';
		        for (var i = 0; i < req.responseXML.getElementsByTagName('Item').length; i++) {
		            with (req.responseXML.getElementsByTagName('Item').item(i)) {

		                var File = getNodeValue(getElementsByTagName('File'));
		                var Name = getNodeValue(getElementsByTagName('Name'));
		                var Summary = getNodeValue(getElementsByTagName('Summary'));
		                var Menu = getNodeValue(getElementsByTagName('Menu'));
		                var Location = getNodeValue(getElementsByTagName('Location'));
		                var Price = getNodeValue(getElementsByTagName('Price'));
		                var Created = getNodeValue(getElementsByTagName('Created'));

		                sHtml += "div class=\"box2\">";
		                sHtml += "<a href=\"<%=url %>\" title=\"" + Name + "\">";
		                sHtml += "<img src=\"" + File + "\" width=\"140\" height=\"140\" alt=\"" + Name + "\" />";
		                sHtml += "</a>";
		                sHtml += "<h1><a href=\"<%=url %>\" title=\"" + Name + "\">" + Name + "</a></h1>";
		                sHtml += "<h2>" + Summary + "</h2>";
		                sHtml += "<div class=\"box3\">";
		                sHtml += "<p>Loại tin: <span>" + Menu + "</span></p>";
		                sHtml += "<p>Địa điểm: <span>" + Location + "</span></p>";
		                sHtml += "<p>Khung giá: <span>" + Price + "</span></p>";
		                sHtml += "<p>Ngày đăng: <span>" + Created + "</span></p>";
		                sHtml += "</div>";
		                sHtml += "</div>";
		            }
		        }
		        list_item.innerHTML = sHtml;

		        $("#list_item").hide().fadeIn(1000, "swing");
		    }
		}
		, 'onError': function (req) { }
        }
	)
}

$('ul.phantrang li a').click(function (e) {
    e.preventDefault(); // prevent the default action
    e.stopPropagation(); // stop the click from bubbling
    $(this).closest('ul').find('.active').removeClass('active');
    $(this).parent().addClass('active');
});