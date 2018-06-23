<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<div class="menu_tomtat">
    <a href="/"><span><%=ViewPage.Request.Url.Host %></span></a><%=Utils.GetMapPage2(ViewPage.CurrentPage) %>
</div>