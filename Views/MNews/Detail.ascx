<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModNewsEntity;
    var listOther = ViewBag.Other as List<ModNewsEntity>;
%>

<div class="box-bds all">
                    <div class="title all">
                        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
                        <div class="dv-ct-tabs">
                           <h2> <a href="" class="a-title" ><%=ViewPage.CurrentPage.Name %></a> </h2>
                        </div>
                    </div>
                    <div class="bds-body">
                        <div class="news-detail fl">
                            <h3><%=item.Name %></h3>
                            <h6><%=string.Format("{0:dd/MM/yyyy}", item.Published) %></h6>
                            <strong><%=item.Summary %></strong>
                            <p class="detail fl" style="text-align: justify;"><%=Utils.GetHTMLForSeo(item.Content) %> </p>
                            <%if (listOther != null){%>
                            <div class="other-list">
                                <h3>Tin tức khác</h3>
                                <ul>
                                 <%for (int i = 0; i < listOther.Count; i++){%>
        <li><a href="<%=ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code) %>"><%=listOther[i].Name %><span>(<%=string.Format("{0:dd/MM/yyyy}", listOther[i].Published) %>)</span></a></li>
        <%} %>
                               </ul>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
  <div class="box-bds all">
        <div class="title all">
            <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
            <div class="dv-ct-tabs">
                <h2><a href="" class="a-title">Bình Luận</a></h2>
            </div>
        </div>
        <div class="bds-body">
            <div class="table all">
                <div class="bl_desc all">
                    <ul>
                         <div class="fb-comments" data-href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>" data-width="696" data-numposts="20" data-colorscheme="light"></div>
                    </ul>
                </div>
            </div>
        </div>
    </div>


