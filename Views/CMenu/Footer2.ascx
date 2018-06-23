<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>


<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var item = ViewBag.Data as ModBSNewsEntity ?? new ModBSNewsEntity();
%>



    <%for (int i = 1; listItem != null && i < listItem.Count - 2; i++)
      {
          var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
    %><ul class="list_01 fl">
    <li class="private"><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %> </a></li>
    <%if (listChildItem != null)
      {%>
    <%for (int j = 0; j < listChildItem.Count; j++)
      { var listChildItem1 = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID); %>
    <li><a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a> </li>
         <%if (listChildItem1 != null)
                  {%>
        <%for (int k = 0; k < listChildItem1.Count; k++)
                  {%> <li ><a href="<%=ViewPage.GetPageURL(listChildItem1[k]) %>">-- <%=listChildItem1[k].Name %></a> </li>
                <%}%>
        <%} %>
        
    <%}}%>
        </ul>
    <%}%>

