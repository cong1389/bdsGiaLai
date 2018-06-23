<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    //var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    //var page = ViewBag.Page as SysPageEntity;
    //var model = ViewBag.Model as MBSNewsModel;

    //var listItem = ViewBag.Data2 as List<ModBSNewsEntity>;
    //var page = ViewBag.Page2 as SysPageEntity;

    //if (listItem == null || page == null) return;
    //string title = ViewBag.Title;


    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var listItem2 = ViewBag.Data2 as List<ModBSNewsEntity>;

    var page = ViewBag.Page as SysPageEntity;
    var page2 = ViewBag.Page2 as SysPageEntity;
    //var model = ViewBag.Model as MCBSNewsModel;
    
    if (page == null || listItem == null || page2 == null || listItem2 == null) return;

    string _url = ViewPage.GetURL(listItem[0].MenuID, listItem[0].Code);
    string _url2 = ViewPage.GetURL(listItem2[0].MenuID, listItem2[0].Code);

    string title = ViewBag.Title;
    //int count =  ViewBag.countBSNewsHome1;
%>

    <script type="text/javascript" src="/Content/js/tooltip.js"></script>

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
                     <a  href="<%=url %>" title="<%= listItem[i].Name %>" class="screenshot" rel="<%= Utils.GetResizeFile(listItem[i].File, 2, 260, 180)%>" rev="<%=hover %>">
                                <h4 ><%= listItem[i].Name %>
                                    <img border="0" src="/Content/skins/images/imgVip.gif">
                                </h4>
                            </a>
                        </span>
                        <span class="khuvuc" title="<%=listItem[i].getDistrict().Name %> - <%=listItem[i].getCity().Name %>"><%=listItem[i].getDistrict().Name %> <br /><%=listItem[i].getCity().Name %></span>
                        <span class="date"><%= string.Format("{0:dd/MM/yyyy}", listItem[i].Created) %></span>
                    </li>

                    <%} %>


                    <%for (int k = 0; k < listItem2.Count; k++)
                      {
                          string url2 = ViewPage.GetURL(listItem2[k].MenuID, listItem2[k].Code);

                          string hover = string.Empty;
                          string content = Data.RemoveAllTag(listItem2[k].Content);
                          if (!string.IsNullOrEmpty(content)) hover = Data.CutString(content, 150);
                          else if (!string.IsNullOrEmpty(listItem2[k].Summary)) hover = Data.CutString(listItem2[k].Summary, 150);
                    %>

                    <li>
                        <span class="tieude">
                            <a href="<%=url2 %>" title="<%= listItem2[k].Name %>" class="screenshot" rel="<%= Utils.GetResizeFile(listItem2[k].File, 2, 260, 180)%>" rev="<%=hover %>">
                                <h4><%= listItem2[k].Name %>
                                    <%--<img border="0" src="/Content/skins/images/imgVip.gif">--%>
                                </h4>
                            </a>
                        </span>
                        <span class="khuvuc" title="<%=listItem2[k].getDistrict().Name %> - <%=listItem2[k].getCity().Name %>"><%=listItem2[k].getDistrict().Name %> - <%=listItem2[k].getCity().Name %></span>
                        <span class="date"><%= string.Format("{0:dd/MM/yyyy}", listItem2[k].Created) %></span>
                    </li>

                    <%} %>
                </ul>
            </div>
        </div>
        <ul class="phantrang">
</ul>
    </div>
</div>
