<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    if (VSW.Lib.Global.Utils.IsMobileDevice(ViewPage.Request.UserAgent)) return;
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    if (listItem == null) return;

    int width = listItem[0].Width;
%>

<%for (int i = 0; i < (listItem.Count > 2 ? 2 : listItem.Count); i++)
    {%>
<div id="divAdLeft<%=i %>" style="display: block; position: fixed; top: 10px; left:55px;">
     <a href="<%=ViewPage.GetURL(listItem[i].AdvCode) %>" title="<%=listItem[i].Name %>">
<%= Utils.GetCodeAdv(listItem[i])%></a>
</div>
<%} %>
<%for (int i = 1; i < (listItem.Count > 3 ? 3 : listItem.Count); i++)
    {%>
<div id="divAdRight<%=i %>" style="display: block; position: fixed; top: 10px; right:55px;">
    <a href="<%=ViewPage.GetURL(listItem[i].AdvCode) %>" title="<%=listItem[i].Name %>">
<%= Utils.GetCodeAdv(listItem[i])%></a>
</div>


<%--<script type="text/javascript">
    function FloatTopDiv() {
        startLX = ((document.body.clientWidth - MainContentW) / 2) - LeftBannerW - LeftAdjust, startLY = TopAdjust + 80;
        startRX = ((document.body.clientWidth - MainContentW) / 2) + MainContentW + RightAdjust, startRY = TopAdjust + 80;
        var d = document;
        function ml(id) {
            var el = d.getElementById ? d.getElementById(id) : d.all ? d.all[id] : d.layers[id];
            el.sP = function (x, y) { this.style.left = '0px'; this.style.top = y + 'px'; };
            el.x = startRX;
            el.y = startRY;
            return el;
        }
        function m2(id) {
            var e2 = d.getElementById ? d.getElementById(id) : d.all ? d.all[id] : d.layers[id];
            e2.sP = function (x, y) { this.style.right = '0px'; this.style.top = y + 'px'; };
            e2.x = startLX;
            e2.y = startLY;
            return e2;
        }
        window.stayTopLeft = function () {
            if (document.documentElement && document.documentElement.scrollTop)
                var pY = document.documentElement.scrollTop;
            else if (document.body)
                var pY = document.body.scrollTop;
            if (document.body.scrollTop > 30) { startLY = 0; startRY = 0; } else { startLY = TopAdjust; startRY = TopAdjust; };
            ftlObj.y += (pY + startRY - ftlObj.y) / 16;
            ftlObj.sP(ftlObj.x, ftlObj.y);
            ftlObj2.y += (pY + startLY - ftlObj2.y) / 16;
            ftlObj2.sP(ftlObj2.x, ftlObj2.y);
            setTimeout("stayTopLeft()", 1);
        }
        ftlObj = ml("divAdRight");
        //stayTopLeft();
        ftlObj2 = m2("divAdLeft");
        stayTopLeft();
    }
    function ShowAdDiv() {
        var objAdDivRight = document.getElementById("divAdRight");
        var objAdDivLeft = document.getElementById("divAdLeft");
        if (document.body.clientWidth < MainContentW + 10 + 2 * <%=width%>) {
            objAdDivRight.style.display = "none";
            objAdDivLeft.style.display = "none";
        }
        else {
            objAdDivRight.style.display = "block";
            objAdDivLeft.style.display = "block";
            FloatTopDiv();
        }
    } 
</script>
<script type="text/javascript">
    document.write("<script type='text/javascript'>MainContentW = 1000;LeftBannerW = <%=width %>;RightBannerW = <%=width %>;LeftAdjust = 5;RightAdjust = 5;TopAdjust = 10;ShowAdDiv();window.onresize=ShowAdDiv;<\/script>");
</script>--%>

<%} %>