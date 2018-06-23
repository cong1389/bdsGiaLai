<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%--<div class="content-duoi">
    <div class="title_with_bg">
        <p><%=ViewPage.CurrentPage.Name %></p>
    </div>
</div>

<div class="detail_tintuc">
    <div class="detail"><%=Utils.GetHTMLForSeo(ViewPage.CurrentPage.Content) %></div>
</div>--%>


<%-- ----------------------------- --%>



<div class="box-bds all">
                    <div class="title all">
                        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
                        <div class="dv-ct-tabs">
                           <h2> <a href="" class="a-title"><%=ViewPage.CurrentPage.Name %></a> </h2>
                        </div>
                    </div>
                    <div class="bds-body">
                        <div class="news-detail fl">
                            <%=Utils.GetHTMLForSeo(ViewPage.CurrentPage.Content) %>
                        </div>
                    </div>
                </div>

