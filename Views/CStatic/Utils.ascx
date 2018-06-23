<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    string title = ViewBag.Title;
%>

<div class="thongtincanbiet">
    <div class="title">
        <p>Thông tin cần biết</p>
    </div>
    <aside>
        <img src="img/images.jpg" width="30px" height="auto" /><a href="#"><strong>Chứng khoán</strong></a>
    </aside>
    <aside>
        <img src="img/images.jpg" width="30px" height="auto" /><a href="#"><strong>Giá vàng</strong></a>
    </aside>
    <aside>
        <img src="img/images.jpg" width="30px" height="auto" /><a href="#"><strong>Tỷ giá ngoại tệ</strong></a>
    </aside>
    <aside>
        <img src="img/images.jpg" width="30px" height="auto" /><a href="#"><strong>Thư giãn</strong></a>
    </aside>
</div>









<link type="text/css" href="/Content/utils/html/style.css" rel="stylesheet" media="all" />
<link type="text/css" href="/Content/utils/fancybox/jquery.fancybox.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="/Content/utils/fancybox/jquery.fancybox.js?v=2.0.6"></script>

<div class="hotrotructuyen margin_top all">
    <h2><a href="javascript:void(0)" rel="nofollow">Thông tin cần biết</a></h2>
    <ul class="thongtincanbiets">
        <li class="chungkhoan"><a href="#chungkhoan">Giá chứng khoán</a></li>
        <li class="giavang"><a href="#giavang">Giá vàng</a></li>
        <li class="ngoaite"><a href="#ngoaite">Giá ngoại tệ</a></li>
        <li class="thoithiet"><a href="#thoitiet">Thời tiết</a></li>
    </ul>
</div>

<div id="chungkhoan">
    <form id="contact" name="contact" action="#" method="post">
        <%=VSW.Lib.Global.HtmlHelper.GetGold("http://hn.24h.com.vn/ttcb/giavang/giavang.php") %>
    </form>
</div>
<div id="giavang">
    <form id="contact" name="contact" action="#" method="post">
        <%=VSW.Lib.Global.HtmlHelper.GetGold("http://hn.24h.com.vn/ttcb/giavang/giavang.php") %>
    </form>
</div>
<div id="ngoaite">
    <form id="contact" name="contact" action="#" method="post">
        <%=VSW.Lib.Global.HtmlHelper.GetRate("http://hn.24h.com.vn/ttcb/tygia/tygia.php") %>
    </form>
</div>
<div id="thoitiet">
    <form id="contact" name="contact" action="#" method="post">
        <%=VSW.Lib.Global.HtmlHelper.GetWeather("http://hn.24h.com.vn/ttcb/thoitiet/thoitiet.php") %>
    </form>
</div>