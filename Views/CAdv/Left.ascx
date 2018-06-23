<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    string _url = ViewPage.GetURL(listItem[0].MenuID, listItem[0].AdvCode);
%>

<div class="box-qc all">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
         <a href="<%=_url %>"><%= Utils.GetCodeAdv(listItem[i])%></a>
    <%} %>
</div>
