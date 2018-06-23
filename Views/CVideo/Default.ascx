<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModVideoEntity>;
    string title = ViewBag.Title;
%>

<div class="webpart fl">
    <div class="left_webpart">
        <div class="wrap_left_webpart">
            <h2><a href="javascript:void(0)" rel="nofollow"><%=title%></a></h2>
            <div class="video"><p id="main_video"></p></div>
        </div>
    </div>
</div>

<%if (listItem != null){%>
<script type="text/javascript">
    PlayYoutube('main_video', '<%=listItem[0].File%>', 191, 143, false);
</script>
<%} %>