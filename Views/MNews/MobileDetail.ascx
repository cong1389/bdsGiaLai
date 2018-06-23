<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
    var listOther = ViewBag.Other as List<ModNewsEntity>;
%>
<div class="box_new all">
    <div class="title_new">
        <h1>Tin tức</h1>
    </div>
    <div class="bg_new">
        <h3 class="title"><%=item.Name %></h3>
        <div class="post-meta"><b><%=string.Format("{0:dd/MM/yyyy}", item.Published) %></b> </div>
        <strong><%=item.Summary %></strong>
        <br />
        <div class="detail_tin">
            <%=Utils.GetHTMLForSeo(item.Content) %>
        </div>
           <%if (listOther != null)
              {%>
        <div class="news_other all">
            <h3>Tin cùng chuyên mục</h3>
            <ul class="list_newsother">
                <%for (int i = 0; i < listOther.Count; i++)
                  {%>
                <li><a href="<%=ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code) %>"><%=listOther[i].Name %></a></li>
                <%} %>
            </ul>
        </div>
        <%} %>
    </div>
</div>
