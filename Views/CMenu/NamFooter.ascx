<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>


<div class="nam-footer">
    <ul class="nam-menu">
        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
          {
              var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
        %>
        <li <%if (ViewPage.IsPageActived(listItem[i]))
              {%>class="li-activer" <%} %>><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %></a>
            <%if (listChildItem != null)
              {%>
            <ul class="menu_cap2">
                <%for (int j = 0; j < listChildItem.Count; j++)
                  {
                      var listChildItemlv2 = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID);%>
                <li><a <%if (listChildItemlv2 != null) {%>class="indent" <%} %> href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a>

                    <%if (listChildItemlv2 !=null)
                      {%>
                           <ul class="menu_cap3">

                        <%for (int k = 0; k < listChildItemlv2.Count; k++)
                          {%>
                        <li><a href="<%=ViewPage.GetPageURL(listChildItemlv2[k]) %>"><%=listChildItemlv2[k].Name %></a>
                        </li>
                        <%} %>
                    </ul>
                    <%  } %>
                </li>
                <%} %>
            </ul>
            <%} %>
        </li>
        <%} %>
    </ul>
</div>


