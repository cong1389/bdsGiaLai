<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    if (listItem == null) return;
%>

<div class="support">
    <figure>
        <%= Utils.GetCodeAdv(listItem[0])%>
    </figure>
</div>