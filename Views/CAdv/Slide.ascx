<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<%--<script type="text/javascript" src="/Content/utils/sliderman/js/sliderman.1.3.7.js"></script>--%>
<%for (int i = 0; listItem != null && i < listItem.Count; i++){%><%= Utils.GetCodeAdv(listItem[i])%><%} %>

<%--<script type="text/javascript">
    _Effect1 = { name: 'Effect1', top: true, move: true, duration: 400 };
    _Effect2 = { name: 'Effect2', right: true, move: true, duration: 400 };
    _Effect3 = { name: 'Effect3', bottom: true, move: true, duration: 400 };
    _Effect4 = { name: 'Effect4', left: true, move: true, duration: 400 };
    _Effect5 = { name: 'Effect5', rows: 3, cols: 9, delay: 50, duration: 100, order: 'random', fade: true };
    _Effect6 = { name: 'Effect6', rows: 2, cols: 4, delay: 100, duration: 400, order: 'random', fade: true, chess: true };
    effectsSlide = [_Effect1, _Effect2, _Effect3, _Effect4, _Effect5, _Effect6, 'blinds'];
    var slider = Sliderman.slider({ container: 'banner', width: <%=listItem[0].Width%>, height: <%=listItem[0].Height%>, effects: effectsSlide, display: { autoplay: 5000 } });
</script>--%>