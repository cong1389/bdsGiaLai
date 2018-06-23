<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModProductEntity;
    var listOther = ViewBag.Other as List<ModProductEntity>;
    string urlContact = ViewPage.GetURL("lien-he") + "/p/" + item.ID;

    //hinh anh
    var listFile = ViewBag.File as List<string>;
    
    //vote
    bool hasVote = Cookies.GetValue("VoteStar_" + item.ID, true) == string.Empty;
%>

<div class="tieude0004">
                    <p class="fl icon">
                        <img src="skins/images/icon.png"></p>
                    <h2 class="fl"><a href="#">sản phẩm</a></h2>

                </div>
                <div class="list_sanpham all margin_bt magin_top  backgr">
                    <div class="left_sp fl">
                        <p class="sp3"><a href="#">
                            <img src="images/sp3.jpg" /></a></p>
                        <div class="sp_small all list_small ">
                            <div class="line04 private fl"></div>
                            <ul>
                                <li><a href="#">
                                    <img src="images/small.jpg" /></a></li>
                                <li><a href="#">
                                    <img src="images/small.jpg" /></a></li>
                                <li><a href="#">
                                    <img src="images/small.jpg" /></a></li>
                                <li><a href="#">
                                    <img src="images/small.jpg" /></a></li>

                            </ul>
                            <p class="pre"><a href="#"></a></p>
                            <p class="next"><a href="#"></a></p>
                        </div>
                    </div>
                    <div class="right_sp fr">

                        <div class="title">
                            <h1 itemprop="name" class="title-dealdt">sofa heaven sft 10</h1>
                            <i class="hori-line"></i>
                            <p class="img_mota"><a href="#">
                                <img src="skins/images/BG.jpg" /></a></p>
                            <div itemprop="description">
                                <p>Hãy thể hiện sự tinh tế của gia chủ qua phong cách trang trí của ngôi nhà mình.Luôn làm mới không gian sống là một cách để  tạo ra những niềm vui nhỏ, những bất ngờ thú vị làm phong phú  đời sống tinh thần cho gia đình bạn.</p>
                            </div>
                        </div>
                        <!--class title-->




                    </div>
                </div>




                <div class="thongtin_chitiet fl">
                    <ul class="list-tt">
                        <li class="active"><a href="#">Sản phẩm DECOR</a></li>
                        <li><a href="#">Mô tả</a></li>
                        <li><a href="#">Chi tiết & Kích thước</a></li>
                        <li><a href="#">Bảo dưỡng & Điều chỉnh</a></li>
                    </ul>
                    <ul class="list_sp marr all">
                        <li class="pding big">
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img class="rieng" src="images/rieng.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">Bình hoa tt 10</a>
                                </div>
                            </div>
                        </li>
                        <li class="big">
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img class="rieng" src="images/rieng.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">Bình hoa tt 10</a>
                                </div>
                            </div>
                        </li>
                        <li class="big">
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img class="rieng" src="images/rieng.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">Bình hoa tt 10</a>
                                </div>
                            </div>
                        </li>
                        <li class="big">
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img class="rieng" src="images/rieng.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">Bình hoa tt 10</a>
                                </div>
                            </div>
                        </li>

                    </ul>
                    <p class="pre03"><a href="#">
                        <img src="skins/images/pre2.png" /></a></p>
                    <p class="nexxt03"><a href="#">
                        <img src="skins/images/next.png" /></a></p>
                </div>


                <div class="tieude0004">
                    <p class="fl icon">
                        <img src="skins/images/icon.png" /></p>
                    <h2 class="fl"><a href="#">sản phẩm liên quan</a></h2>
                    <div class="xemthem fr"><a href="#">xem thêm</a></div>
                </div>
                <div class="left_rieng all">

                    <ul class="list_sp all">
                        <li class="pding">
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img src="images/sp1.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">sofa heaven - sf133w sofa heaven - sf133w</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img src="images/sp1.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">sofa heaven - sf133w sofa heaven - sf133w</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img src="images/sp1.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">sofa heaven - sf133w sofa heaven - sf133w</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="v6ItemCon">
                                <div class="v6ItemImg">
                                    <a href="#">
                                        <img src="images/sp1.jpg" /></a>
                                </div>

                                <div class="v6ItemPrice">
                                    <a href="#">sofa heaven - sf133w sofa heaven - sf133w</a>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>














<div class="pri_left fl">
    <div class="list_sanpham all margin_bt magin_top  backgr">
        <div class="left_sp fl">
            <p class="sp3">
                <a href="<%=Utils.GetResizeFile(item.File, 4, 1024, 1024)%>" class="highslide" id="highslide" title="<%=item.Name %>" onclick="return hs.expand(this)">
                    <img src="<%=Utils.GetResizeFile(item.File, 4, 673, 673)%>" alt="<%=item.Name %>" title="<%=item.Name %>" class="detail_image" id="detail_image" />
                </a>
            </p>
            <div class="sp_small all list_small ">
                <div class="line04 private fl"></div>
                <ul id="list_image"></ul>
                <p class="pre"><a href="javascript:void(0)" onclick="slide_back();" rel="nofollow" title="Ảnh trước">&nbsp;</a></p>
                <p class="next"><a href="javascript:void(0)" onclick="slide_next();" rel="nofollow" title="Ảnh sau">&nbsp;</a></p>
            </div>
        </div>

        <div class="right_sp fr">
            <div class="amo-rating">
                <div data-productid="<%=item.ID %>" data-rateit-value="<%=item.Average %>" data-rateit-ispreset="true" class="rateit"></div>
            </div>

            <div class="title">
                <h1 itemprop="name" class="title-dealdt"><%=item.Name %></h1>
                <i class="hori-line"></i>
                <div itemprop="description">
                    <p><%=item.Summary %></p>
                </div>
            </div>
            <%--<div class="amo-rating">
                <h3>Vẫn còn mua được</h3>
            </div>--%>
            <div class="pire">
                <p class="price_top"><%=string.Format("{0:#,##0}", item.Price2)%> VNĐ</p>
                <p class="price_bottom"><%=string.Format("{0:#,##0}", item.Price)%> VNĐ</p>
                <p class="mua">
                    <a href="<%=urlContact %>" class="button_example" rel="nofollow">Đặt hàng</a>
                </p>
            </div>
        </div>
    </div>

    <p class="line02 fl"></p>
    <div class="left_rieng all">
        <div class="detail_left fl">
            <h3 class="margin_bt">thông tin chi tiết</h3>
            <div class="chitiet"><%=Utils.GetHTMLForSeo(item.Content) %></div>
        </div>

        <div class="detail_right fr">
            <div class="sp_lienquan">
                <p class="fl sp">Sản phẩm liên quan</p>
                <p class="fr"><a href="<%=ViewPage.GetPageURL(ViewPage.CurrentPage) %>">Xem thêm</a></p>
            </div>
            <ul class="list_sp all">
                <%for (int i = 0; listOther != null && i < listOther.Count; i++){
                      string url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
                %>
                <li <%if(i % 4 == 0) {%>class="pding"<%} %>>
                    <div class="v6ItemCon">
                        <div class="v6ItemImg">
                            <a href="<%=url%>"><img src="<%=Utils.GetResizeFile(listOther[i].File, 2, 214, 140)%>" alt="<%=listOther[i].Name%>" width="214" height="140" /></a>
                        </div>
                        <div class="v6ItemTitle">
                            <a href="<%=url%>" title="<%=listOther[i].Name %>"><%=Data.CutString(listOther[i].Name, 40)%></a>
                        </div>
                        <div class="v6ItemPrice">
                            <div class="fl">
                                <p class="v7PromotionSmall"><%=string.Format("{0:#,##0}", listOther[i].Price)%><span>đ</span></p>
                                <p class="v7bnew"><%=string.Format("{0:#,##0}", listOther[i].Price2)%> đ</p>
                            </div>
                            <p class="views fr">
                                <a href="<%=url%>" class="xem">Xem</a>
                            </p>
                        </div>
                    </div>
                </li>
                <%} %>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('.amo-rating .rateit').bind('rated reset', function (e) {
        var ri = $(this);

        //if the use pressed reset, it will get value: 0 (to be compatible with the HTML range control), we could check if e.type == 'reset', and then set the value to  null .
        var value = ri.rateit('value');
        var productID = ri.data('productid'); // if the product id was in some hidden field: ri.closest('li').find('input[name="productid"]').val()

        //maybe we want to disable voting?
        ri.rateit('readonly', true);

        var ranNum = Math.floor(Math.random() * 999999);
        sLink = '/Tools/GetHTML.aspx?cmd=up_vote&product_id=' + productID + '&value=' + value + '&rnd=' + ranNum;
        AjaxRequest.get({
            'url': sLink
	        , 'onSuccess': function (req) {
	            with (req.responseXML.getElementsByTagName('I').item(0)) {

	            }
	        }
	        , 'onError': function (req) { }
        })
    });
</script>

<script type="text/javascript" src="/Content/js/slide.js"></script>
<script type="text/javascript">
    var index = 0;
    var run_next_mode = true;
    var pid = <%=item.ID%>;

    var maxindex = Math.ceil(<%= listFile ==  null ? 0 : listFile.Count %> / 4);
    slide_change();

    setInterval(function() {
        slide_next_back();
    }, 4000);
</script>