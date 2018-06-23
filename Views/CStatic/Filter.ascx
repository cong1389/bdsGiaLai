<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = WebMenuService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Type == "Price" && o.ParentID != 0)
                            .OrderByDesc(o => new { o.Order, o.ID })
                            .ToList_Cache();

    int price = ViewPage.CurrentParams.GetValue("price").ToInt(0);
%>

<div class="box_kr">
    <h2><a href="javascript:void(0)" rel="nofollow">Tìm theo khoảng giá</a></h2>
    <ul class="list_dm">
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
        <li><a href="/price/<%=listItem[i].ID %>" <%if (price == listItem[i].ID){%>class="active"<%} %>><%=listItem[i].Name %></a></li>
        <%} %>
    </ul>
</div>