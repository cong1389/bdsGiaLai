<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var model = ViewBag.Model as MBSNewsModel;

    string urlPage = "";
    string[] ArrPage = ViewPage.Request.RawUrl.Split('?');
    if (ArrPage != null && ArrPage.Length > 1) urlPage = ArrPage[0];
%>
<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="" class="a-title"><%=ViewPage.CurrentPage.PageTitle %>  </a></h2>
            <p class="fr dangvip ico-sty">
                <a href="">Đăng V.I.P</a>
            </p>
        </div>
    </div>
    <%if (listItem != null)
      {%>
    <div class="bds-body">
        <div class="table all">
            <div class="bl_desc all">
                <ul>
                    <li class="tieude">Tiêu đề tin</li>
                    <li class="khuvuc">Khu vực</li>
                    <li class="date">Ngày đăng</li>
                </ul>
            </div>
            <div class="bl_result all">
                <ul>

                    <%for (int i = 0; i < listItem.Count; i++)
                      {
                          string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
                          if (listItem[i].State == 1)
                          {%>
                    <li class="tinhot">
                        <span class="tieude">
                            <a href="<%=url %>" title="<%= listItem[i].Name %>" class="screenshot" rel="<%= Utils.GetResizeFile(listItem[i].File, 2, 260, 180)%>" rev="<%= listItem[i].Summary %>">
                                <h4><%= listItem[i].Name %>
                                    <img border="0" src="/Content/skins/images/imgVip.gif">
                                </h4>
                            </a>
                        </span>
                        <span class="khuvuc" title="<%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %>"><%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %></span>
                        <span class="date"><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %></span>
                    </li>
                    <% }
                          else
                          {%>
                    <li>
                        <span class="tieude">
                            <a href="<%=url %>" title="<%= listItem[i].Name %>" class="screenshot" rel="<%= Utils.GetResizeFile(listItem[i].File, 2, 260, 180)%>" rev="<%= listItem[i].Summary %>">
                                <h4><%= listItem[i].Name %>
                                    <%--  <img border="0" src="/Content/skins/images/imgVip.gif">--%>
                                </h4>
                            </a>
                        </span>
                        <span class="khuvuc" title="<%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %>"><%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %></span>
                        <span class="date"><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %></span>
                    </li>
                    <% }
                    %>



                    <%} %>
                </ul>
            </div>
        </div>
        <ul class="phantrang">
            <%= GetPagination(urlPage, model.Page, model.PageSize, model.TotalRecord)%>
        </ul>
    </div>
    <% }else{
    %><div class="bds-body"></br>Dữ Liệu Rỗng ! ....</br></br></div>
    <%}%>
</div>
