<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    string title = ViewBag.Title;
    
    //san pham vua xem
    var cart = new Cart("JustView");
%>

<div class="left_dacbiet fl">
    <h2><%=title %></h2>
    <ul class="sp_xem">
    <%for (int i = 0; i < cart.Items.Count; i++){
        var product = ModProductService.Instance.GetByID(cart.Items[i].ProductID);
        if (product == null) continue;

        string _Url = ViewPage.GetURL(product.MenuID, product.Code);
    %>
        <li>
            <a href="<%=_Url %>"><img src="<%=Utils.GetResizeFile(product.File, 4, 72, 72)%>" width="72" alt="<%=product.Name%>" /></a>
            <p class="ten_sp">
                <a href="<%=_Url %>"><%=product.Name%></a>
            </p>
        </li>
    <%} %>
    </ul>
</div>