<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%bool isDefault = ViewPage.CurrentPage.Code == "default"; %>

<div class="brand-wrapper">
    <div class="header-wrapper_gr">
        <p class="menu_tomtat"><%= isDefault ? "<a href='http://" + ViewPage.Request.Url.Host + "'>" + ViewPage.Request.Url.Host + "</a>" : Utils.GetMapPage(ViewPage.CurrentPage, "") %></p>
    </div>
</div>