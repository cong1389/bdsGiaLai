<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>
<div class="box_new all">
    <div class="title_new">
        <h1>Bài viết</h1>
    </div>
    <div class="bg_new">
        <h3 class="title"><%=ViewPage.CurrentPage.Name %></h3>
        <br />
        <div class="detail_tin">
            <%=Utils.GetHTMLForSeo(ViewPage.CurrentPage.Content) %>
        </div>
    </div>
</div>
