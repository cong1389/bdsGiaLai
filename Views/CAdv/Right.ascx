<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
%>

<%--<div class="quangcao">
    <div class="title">
        <p>Quảng cáo</p>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <figure>
            <%= Utils.GetCodeAdv(listItem[i])%>
        </figure>
        <%} %>
    </div>
</div>--%>
<div class="box-qc all">
     <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                    <%= Utils.GetCodeAdv(listItem[i])%>
     <%} %>
                </div>