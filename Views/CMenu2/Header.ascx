<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
%>

<%--<ul class="menu_top fl">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
    <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name%></a></li>
    <%} %>
</ul>--%>
<div class="ViewMenu_left fl"> 
                    <div class="fl sl_tinh"> 
                        <span> Bạn đang xem tin </span>
                        <a href="#" class="acity_active">HÀ NỘI</a>
                    </div>
                    <span class="tinh-thanh">&nbsp;|&nbsp;
                        <a href="" class="acity">Hải Phòng</a>&nbsp;|&nbsp;
                        <a href="" class="acity">Đà Nẵng</a>&nbsp;|&nbsp;
                        <a href="" class="acity">TP.HCM</a>&nbsp;|&nbsp;
                        <a href="" class="acity">Bình Dương</a>&nbsp;|&nbsp;
                    </span>
                    <!--  -->
                        <script>
                            $(function () {
                                $('#TM_CityView').click(function () {
                                    $('#TM_pnCity').slideToggle('slow');
                                });
                            });
                        </script>
                    <!--  -->






    <%-- =========================================================================== --%>


                    <a class="arrow-down-gray acity" id="TM_CityView"> Chọn Tỉnh/Thành</a>
                    <div id="TM_pnCity" class="all_city">
                        <p class="menu-select-city">
                            <strong class="red3">----CHỌN TỈNH/THÀNH----</strong>
                        </p>
                        <ul class="list_tp01 fl">
                            <li class="private"><a href="#">Miền Bắc</a></li>
                            <li> <a href="" class="nb">Hà Nội</a> </li>
                            <li> <a href="" class="nb">Hải phòng</a> </li>
                            <li> <a href="">Bắc giang</a> </li>
                            <li> <a href="">Bắc kạn</a> </li>
                            <li> <a href="">Cao bằng</a> </li>
                            <li> <a href="">Điện biên</a> </li>
                            <li> <a href="">Thái Bình</a> </li>
                        </ul>
                        <ul class="list_tp01 fl">
                            <li class="private"><a href="#">Miền trung</a></li>
                            <li> <a href="" class="nb">TP Đà Nẵng</a> </li>
                            <li> <a href="" class="nb">Thừa Thiên Huế</a> </li>
                            <li> <a href="" class="nb">Khánh Hòa</a> </li>
                            <li> <a href="" class="nb">Lâm Đồng</a> </li>
                            <li> <a href="">Bình Định</a> </li>
                            <li> <a href="">Bình thuận</a> </li>
                        </ul>
                        <ul class="list_tp01 fl">
                            <li class="private"><a href="#">Miền nam</a></li>
                            <li> <a href="" class="nb">TP. Hồ Chí Minh</a> </li>
                            <li> <a href="" class="nb">Bình Dương</a> </li>
                            <li> <a href="" class="nb">Bà Rịa Vũng tàu</a> </li>
                            <li> <a href="" class="nb">Cần Thơ</a> </li>
                            <li> <a href="">Đồng Nai</a> </li>
                            <li> <a href="">An Giang</a> </li>
                            <li> <a href="">Bình Dương</a> </li>
                            <li> <a href="">Bà Rịa Vũng tàu</a> </li>
                            <li> <a href="">Cần Thơ</a> </li>
                            <li> <a href="">Đồng Nai</a> </li>
                            <li> <a href="">An Giang</a> </li>
                        </ul>
                    </div>
                </div>