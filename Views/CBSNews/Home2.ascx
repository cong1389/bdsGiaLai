<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;
    string title = ViewBag.Title;
%>

<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="" class="a-title"><%=title %> </a></h2>
            <p class="fr dangvip ico-sty">
                <a href="">Đăng V.I.P <%--<%=count %>--%></a>
            </p>
        </div>
    </div>
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

                          string hover = string.Empty;
                          string content = Data.RemoveAllTag(listItem[i].Content);
                          if (!string.IsNullOrEmpty(content)) hover = Data.CutString(content, 150);
                          else if (!string.IsNullOrEmpty(listItem[i].Summary)) hover = Data.CutString(listItem[i].Summary, 150);
                    %>

                    <li class="tinhot">
                        <span class="tieude">
                     <a  style="color:red" href="<%=url %>" title="<%= listItem[i].Name %>" class="screenshot" rel="<%= Utils.GetResizeFile(listItem[i].File, 2, 260, 180)%>" rev="<%=hover%>">
                  
                                <h4><%= listItem[i].Name %>
                                    <img border="0" src="/Content/skins/images/imgVip.gif">
                                </h4>
                            </a>
                        </span>
                        <span class="khuvuc" title="<%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %>"><%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %></span>
                        <span class="date"><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %></span>
                    </li>

                    <%} %>
                </ul>
            </div>
        </div>
        <ul class="phantrang">
</ul>
    </div>
</div>
