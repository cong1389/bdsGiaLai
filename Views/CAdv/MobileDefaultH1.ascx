<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>;
   if (listItem == null) return;
%>
<!-- <script type="text/javascript" src="/Content/js/tooltip.js"></script> -->
<div class="logo-mb">
    <h1><%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {%>
        <%= Utils.GetCodeAdv(listItem[i])%>
        <%} %>   </h1>
</div>
