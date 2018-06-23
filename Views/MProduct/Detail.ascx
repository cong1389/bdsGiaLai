<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModProductEntity;
    var listOther = ViewBag.Other as List<ModProductEntity>;
    var listDecor = ViewBag.Decor as List<ModProductEntity>;
    
    //hinh anh
    var listFile = ViewBag.File as List<string>;
%>

<div class="tieude0004">
    <p class="fl icon"><img src="/Content/skins/images/icon.png" /></p>
    <h2 class="fl"><a href="<%=ViewPage.GetPageURL(ViewPage.CurrentPage) %>"><%=ViewPage.CurrentPage.Name %></a></h2>
</div>
<div class="list_sanpham all margin_bt magin_top  backgr">
    <div class="left_sp fl">
        <p class="sp3">
            <a href="javascript:void(0)">
                <img src="<%=Utils.GetResizeFile(item.File, 4, 673, 673)%>" alt="<%=item.Name %>" title="<%=item.Name %>" class="detail_image" />
            </a>
        </p>
        <div class="sp_small all list_small">
            <div class="line04 private fl"></div>
            <ul id="list_images">
                <%for (int i = 0; listFile != null && i < listFile.Count; i++){%>
                <li><a href="javascript:void(0)" onclick="$('.sp3 > a > img').attr('src', '<%=Utils.GetResizeFile(listFile[i], 4, 673, 673)%>');"><img src="<%=Utils.GetResizeFile(listFile[i], 2, 135, 86) %>" width="135" height="86" alt="<%=item.Name %>" /></a></li>
                <%} %>
            </ul>
        <!--     <p class="pre" id="imageprev"><a href="#">&nbsp;</a></p>
            <p class="next" id="imagenext"><a href="#">&nbsp;</a></p> -->
        </div>
    </div>
    <div class="right_sp fr">

        <div class="title">
            <h1 itemprop="name" class="title-dealdt"><%=item.Name %></h1>
            <i class="hori-line"></i>
            <p class="img_mota">
                <a href="javascript:void(0)"><img src="/Content/skins/images/BG.jpg" /></a>
            </p>
            <div itemprop="description">
                <p><%=item.Summary %></p>
            </div>
        </div>
    </div>
</div>

<div class="thongtin_chitiet fl">
    <ul class="list-tt">
        <li><a href="javascript:;" id="tab-1" onclick="changeTab('1', 'div-', 'tab-', '4', '', 'active'); return false;" rel="nofollow">Sản phẩm DECOR</a></li>
        <li><a href="javascript:;" id="tab-2" onclick="changeTab('2', 'div-', 'tab-', '4', '', 'active'); return false;" rel="nofollow">Mô tả</a></li>
        <li><a href="javascript:;" id="tab-3" onclick="changeTab('3', 'div-', 'tab-', '4', '', 'active'); return false;" rel="nofollow">Chi tiết & Kích thước</a></li>
        <li><a href="javascript:;" id="tab-4" onclick="changeTab('4', 'div-', 'tab-', '4', '', 'active'); return false;" rel="nofollow">Bảo dưỡng & Điều chỉnh</a></li>
    </ul>

    <div id="div-1">
        <ul class="list_sp marr all" id="list_decor">
            <%for (int i = 0; listDecor != null && i < listDecor.Count; i++){
                string url = ViewPage.GetURL(listDecor[i].MenuID, listDecor[i].Code);
            %>
            <li <%if (i % 4 == 0){%>class="pding big"<%}else {%>class="big"<%} %>>
                <div class="v6ItemCon">
                    <div class="v6ItemImg">
                        <a href="<%=url%>" title="<%=listDecor[i].Name%>"><img src="<%=Utils.GetResizeFile(listDecor[i].File, 2, 214, 185)%>" alt="<%=listDecor[i].Name%>" width="214" height="185" /></a>
                    </div>

                    <div class="v6ItemPrice">
                        <a href="<%=url%>" title="<%=listDecor[i].Name%>"><%=Data.CutString(listDecor[i].Name, 40)%></a>
                    </div>
                </div>
            </li>
            <%} %>
        </ul>
        <p class="pre03" id="slideprev">
            <a href="#"><img src="/Content/skins/images/pre2.png" /></a>
        </p>
        <p class="nexxt03" id="slidenext">
            <a href="#"><img src="/Content/skins/images/next.png" /></a>
        </p>
    </div>

    <div class="product-detail" id="div-2" style="display:none"><%=Utils.GetHTMLForSeo(item.Content2) %></div>
    <div class="product-detail" id="div-3" style="display:none"><%=Utils.GetHTMLForSeo(item.Content) %></div>
    <div class="product-detail" id="div-4" style="display:none"><%=Utils.GetHTMLForSeo(item.Content3) %></div>

</div>

<%if (listOther != null){%>
<div class="tieude0004">
    <p class="fl icon"><img src="/Content/skins/images/icon.png" /></p>
    <h2 class="fl"><a href="<%=ViewPage.GetPageURL(ViewPage.CurrentPage)%>">sản phẩm liên quan</a></h2>
    <div class="xemthem fr"><a href="<%=ViewPage.GetPageURL(ViewPage.CurrentPage)%>">xem thêm</a></div>
</div>
<div class="left_rieng all">
    <ul class="list_sp all">
        <%for (int i = 0; i < listOther.Count; i++){
              string url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
        %>
        <li <%if (i % 4 == 0){%>class="pding"<%} %>>
            <div class="v6ItemCon">
                <div class="v6ItemImg">
                    <a href="<%=url%>" title="<%=listOther[i].Name%>"><img src="<%=Utils.GetResizeFile(listOther[i].File, 2, 214, 141)%>" alt="<%=listOther[i].Name%>" width="214" height="141" /></a>
                </div>

                <div class="v6ItemPrice">
                    <a href="<%=url%>" title="<%=listOther[i].Name%>"><%=Data.CutString(listOther[i].Name, 40)%></a>
                </div>
            </div>
        </li>
        <%} %>
    </ul>
</div>
<%} %>

<script type="text/javascript">
    changeTab('1', 'div-', 'tab-', '4', '', 'active');
</script>