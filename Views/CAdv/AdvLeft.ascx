<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    if (listItem == null) return;
%>
<script type="text/javascript" src="/Content/utils/sliderman/js/sliderman.1.3.7.js"></script>
<div class="qcleft" id="bannerLeft">
<%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
    <%= Utils.GetCodeAdv(listItem[i])%>
<%} %>
</div>

<style type="text/css">
    #bannerLeft { padding: 0; width: 140px;}
    .qcleft {
	    width: 140px;
	    height: 600px;
    }
</style>

<script type="text/javascript">
    _Effect1 = { name: 'Effect1', top: true, move: false, duration: 200 };
    _Effect2 = { name: 'Effect2', left: true, move: false, duration: 200 };
    //_Effect3 = { name: 'Effect3', bottom: true, move: true, duration: 400 };
    //_Effect4 = { name: 'Effect4', left: true, move: true, duration: 400 };
    //_Effect5 = { name: 'Effect5', rows: 3, cols: 9, delay: 50, duration: 100, order: 'random', fade: true };
    //_Effect6 = { name: 'Effect6', rows: 2, cols: 4, delay: 100, duration: 400, order: 'random', fade: true, chess: true };

    effectsSlide = [_Effect1, _Effect2, 'fade'];

    var slider1 = Sliderman.slider({ container: 'bannerLeft', width: 140, height: 600, effects: effectsSlide, display: { autoplay: 5000 } });
</script>
