<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<div class="logo fl">
    <h1><%= Utils.GetCodeAdv(listItem[0])%> </h1>
</div>
