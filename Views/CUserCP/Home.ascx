<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.intPost as List<ModWebUserEntity>;
    string title = ViewBag.Title;
%>
<div class="box-tin all">
    <div class="title-1">
        <div class="dv-ico-1"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs-1"><a class="a-title" href="javascript:void(0);" title="<%=title%>"><%=title%></a> </div>
    </div>
    <div class="list-dmtt">
        <ul class="list_moigioi">
            <%for (int i = 0; listItem != null && i < listItem.Count; i++)
              { %>
            <li>
                <p class="images_moigioi fl">
                    <img src="<%=Utils.GetResizeFile(listItem[i].Logo,2,70,70)%>" alt="<%=listItem[i].Name%>" />
                </p>
                <div class="dv-txt-mgnb fr">
                    <a href="javascript:void(0);" class="a-title"><%=listItem[i].Name%></a>
                    <p><a class="a-txt-cl1-2" href="javascript:void(0);" title="<%=listItem[i].Mobile != null ? listItem[i].Mobile :listItem[i].Phone %>"><%=listItem[i].Mobile != null ? listItem[i].Mobile :listItem[i].Phone %></a> </p>
                    <p class="lb-des"><%=listItem[i].getObject().Name %></p>
                </div>
            </li>
            <%} %>
        </ul>
    </div>
</div>
