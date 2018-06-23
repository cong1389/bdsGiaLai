<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModProductEntity;
    var listOther = ViewBag.Other as List<ModProductEntity>;
    //hinh anh
    var listFile = item.getURLFiles();
    //shop
    var webUser = item.getWebUser();
%>

<div class="floor all">
    <div class="fltop all">
        <h2><%=ViewPage.CurrentPage.Name %></h2>
    </div>
    <div class="list_sptieubieu border_top all">
        <div class="detail_sp fl">
            <div class="info-box all">
                <div class="pic-info fl">
                    <p class="image">
                        <a href="<%=Utils.GetResizeFile(item.File, 4, 1200, 1200)%>" class="aviewimages" title="<%=item.Name %>" rel="product">
                            <img itemprop="image" src="<%=Utils.GetResizeFile(item.File, 4, 300, 300)%>" alt="<%=item.Name %>" title="<%=item.Name %>" class="viewimages" />
                        </a>
                    </p>
                    <div class="img-gallery">
                        <ul class="list_images">
                            <%for (int i = 0; listFile != null && i < listFile.Count; i++){%>
                            <li class="image-nav-item pager <%=(i == 0 ? "current" : "") %>"><a href="javascript:void(0)" rel="{gallery:'product', smallimage:'<%=Utils.GetResizeFile(listFile[i], 4, 300, 300)%>',largeimage:'<%=Utils.GetResizeFile(listFile[i], 4, 1200, 1200)%>'}"><img src="<%=Utils.GetResizeFile(listFile[i], 2, 55, 55)%>" alt="<%=item.Name %>" width="55" height="55" /></a></li>
                            <%} %>
                        </ul>
                        <a href="javascript:void(0)" class="bx-prev" id="images-prev">prev</a>
                        <a href="javascript:void(0)" class="bx-next" id="images-next">next</a>
                    </div>
                    <div class="zoom-img"><a href="<%=Utils.GetResizeFile(item.File, 4, 1200, 1200)%>" class="highslide" onclick="return hs.expand(this)" rel="nofollow"><strong>Phóng to ảnh</strong> (Bấm xem)</a></div>
                </div>
                <div class="info-inner fr">
                    <p class="code-inf"><span class="viewer">Lượt xem: <span style="font-weight: bold"><%=string.Format("{0:#,##0}", item.View) %></span></span> | Ngày đăng: <%=string.Format("{0:dd-MM-yyyy}", item.Published) %></p>
                    <h1 itemprop="name" class="title-product"><%=item.Name %></h1>
                   
                    <%--<div class="plugin">
                        <div class="fb-like" data-href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
                        <div class="g-plusone" data-size="medium"></div>
                    </div>--%>

                    <h2 class="summary-product"><%=item.Summary %></h2>
                    <div class="wrap-option">
                        <dl class="clearfix">
                            <dt>Số lượng:</dt>
                            <dd class="size"><input type="text" value="1" id="quantity" /></dd>
                        </dl>
                        <dl style="display: block" class="clearfix">
                            <dt>Giá bán:</dt>
                            <dd class="price-sum"><span id="total_price_order"><%=string.Format("{0:#,##0}", item.Price) %></span><span class="unit-price">đ</span></dd>
                        </dl>
                        <dl class="clearfix">
                            <dt>Phạm vi:</dt>
                            <dd><%=item.getCity().Name %></dd>
                        </dl>
                    </div>
                    <ul class="buy">
                        <li class="buy01"><a href="javascript:void(0)" onclick="buyProduct()" rel="nofollow">Mua ngay</a></li>
                    </ul>
                </div>
            </div>
            <div class="info-box all">
                <ul class="mota_sp">
                    <li><a href="javascript:;" id="tab-1" onclick="changeTab('1', 'div-', 'tab-', '2', '', 'active'); return false;" rel="nofollow">Thông tin sản phẩm</a></li>
                    <li><a href="javascript:;" id="tab-2" onclick="changeTab('2', 'div-', 'tab-', '2', '', 'active'); return false;" rel="nofollow">Bình luận</a></li>
                </ul>
                <div class="chitiet_sp" id="div-1">
                    <%=Utils.GetHTMLForSeo(item.Content) %>
                </div>
                <div class="chitiet_sp" id="div-2" style="display:none">
                    <div class="fb-comments" data-href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>" data-width="700" data-numposts="10" data-colorscheme="light"></div>
                </div>
            </div>
        </div>

        <div class="right_nd fr">
            <div class="box01 margin-bt all">
                <div id="sticker">

                    <div class="info-shop fr">
                        <p class="title-shop">
                            <span class="fl">Thông tin người bán</span>
                            <%if (webUser.VIP){%><a class="icon-ranking icon-vip" href="javascript:void(0)"></a><%} %>
                        </p>
                        <div class="info-shop-inner">
                            <div class="info-shop-first">
                                <div class="desc-isf">
                                    <h3><a href="javascript:void(0)" rel="nofollow"><%=webUser.Shop %></a></h3>
                                    <p>Tham gia từ <strong><%=string.Format("{0:dd-MM-yyyy}", webUser.Created) %></strong></p>
                                </div>
                                <div class="addr-isf">
                                    <p class="text-addr"><%=webUser.Address %></p>
                                </div>
                            </div>
                            <div class="info-shop-detail clearfix">
                                <div style="overflow: hidden; left: -16px;" class="hotline"><span class="inside-hl">HOTLINE: <span id="hot_line"><%=webUser.Phone %></span></span></div>
                                <p class="email">
                                    <span class="ico"></span><span class="ctn ctnemail"><a href="mailto:<%=webUser.Email %>" rel="nofollow"><%=webUser.Email %></a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="note-box">
                        <span class="icon"></span>
                        <span class="text">{RS:Product_Note}</span>
                    </div>
                </div>
            </div>

            <%if(listOther != null) {%>
            <div class="box01 margin-bt all">
                <h2>sản phẩm cùng người bán</h2>
                <ul class="list_spmoi fl">
                    <%for (int i = 0; i < listOther.Count; i++){
                        string url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
                    %>
                    <li>
                        <p class="images">
                            <a href="<%=url %>" title="<%= listOther[i].Name %>">
                                <img src="<%=Utils.GetResizeFile(listOther[i].File, 4, 85, 85)%>" alt="<%=listOther[i].Name%>" />
                            </a>
                        </p>
                        <p class="name_sp"><a href="<%=url %>" title="<%= listOther[i].Name %>"><%=listOther[i].Name%></a></p>
                        <p class="price-down"><%=string.Format("{0:#,##0}", listOther[i].Price) %> đ</p>
                    </li>
                    <%} %>
                </ul>
            </div>
            <%} %>
        </div>
    </div>
</div>

<script type="text/javascript">
    function buyProduct() {
        var urlBuy = "<%=ViewPage.GetURL("gio-hang/Add")%>?ProductID=<%=item.ID %>&Quantity=" + document.getElementById('quantity').value + "&returnpath=<%=ViewPage.ReturnPath %>";
        location.href = urlBuy;
    }

    changeTab('1', 'div-', 'tab-', '2', '', 'active');
</script>