<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var item = ViewBag.Data as ModWebUserChargeBankEntity ?? new ModWebUserChargeBankEntity();
    var model = ViewBag.Model as MUserCPModel;
%>

<link href="/Content/skins/baokim.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Content/skins/baokim/baokim.js"></script>

<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="javascrip:voi(0);" class="a-title">Chuyển Tiền</a></h2>
        </div>
    </div>
    <div class="bds-body">
        <div class="register fl">
            <form method="post" name="chargebank_form">
                <ul class="dangky fl">
                    <li>
                        <p style="font-style: italic;">Quý khách vui lòng nhập đủ thông tin:  </p>
                    </li>
                    <li>
                        <label>Nhập họ và tên <span class="red">(*)</span></label>
                         <input type="text" class="frm-txt" name="FullName" placeholder="Nhập họ và tên" value="<%=item.FullName %>" />
                    </li>
                    <li>
                        <label>Địa chỉ email <span class="red">(*)</span></label>
                         <input type="text" class="frm-txt" name="Email" placeholder="Địa chỉ email" value="<%=item.Email %>" />

                    </li>
                    <li>
                        <label>Điện thoại liên hệ <span class="red">(*)</span></label>
                        <input type="text" class="frm-txt" name="Phone" placeholder="Điện thoại liên hệ" value="<%=item.Phone %>" />

                    </li>
                     <li>
                        <label>Số tiền chuyển khoản <span class="red">(*)</span></label>
                        <input type="text" class="frm-txt" name="Value" placeholder="Số tiền chuyển khoản" value="<%=item.Value %>" />

                    </li>
                </ul>
                <div class="content_bank">
                    <a class="login-window" href="#login-box" id="B1">
                        <img src="/Content/skins/baokim/banks/vietcombank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B2">
                        <img src="/Content/skins/baokim/banks/techcombank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B3">
                        <img src="/Content/skins/baokim/banks/acbbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B4">
                        <img src="/Content/skins/baokim/banks/agribank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B5">
                        <img src="/Content/skins/baokim/banks/baovietbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B6">
                        <img src="/Content/skins/baokim/banks/bidvbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B7">
                        <img src="/Content/skins/baokim/banks/dongabank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B8">
                        <img src="/Content/skins/baokim/banks/eximbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B9">
                        <img src="/Content/skins/baokim/banks/gpbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B10">
                        <img src="/Content/skins/baokim/banks/hdbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B11">
                        <img src="/Content/skins/baokim/banks/ivbbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B12">
                        <img src="/Content/skins/baokim/banks/maritimebank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B13">
                        <img src="/Content/skins/baokim/banks/mbbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B14">
                        <img src="/Content/skins/baokim/banks/namabank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B15">
                        <img src="/Content/skins/baokim/banks/navibank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B16">
                        <img src="/Content/skins/baokim/banks/Oceanbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B17">
                        <img src="/Content/skins/baokim/banks/pgbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B18">
                        <img src="/Content/skins/baokim/banks/sacombank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B19">
                        <img src="/Content/skins/baokim/banks/saigonbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B20">
                        <img src="/Content/skins/baokim/banks/scbbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B21">
                        <img src="/Content/skins/baokim/banks/seabank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B22">
                        <img src="/Content/skins/baokim/banks/shbbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B23">
                        <img src="/Content/skins/baokim/banks/tienphongbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B24">
                        <img src="/Content/skins/baokim/banks/vibbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B25">
                        <img src="/Content/skins/baokim/banks/vietabank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B26">
                        <img src="/Content/skins/baokim/banks/vietinbank.gif" class="img-v"></a>
                    <a class="login-window" href="#login-box" id="B27">
                        <img src="/Content/skins/baokim/banks/vpbank.gif" class="img-v"></a>
                </div>

                <div id="login-box" class="login-popup">

                    <div style="text-align: right; padding-right: 5px;">
                        <a href="#" class="close">
                            <img src="/Content/skins/baokim/images/close.png" class="btn_close" title="Close Window" alt="Close" />
                        </a>
                    </div>

                    <div class="head"></div>

                    <a id="A3" href="#">
                        <img class="img-b" src="/Content/skins/baokim/images/tienmat.png" title="Thanh toán online bằng thẻ ATM" alt="" />
                    </a>
                    <a id="A4" href="#">
                        <img class="img-b" src="/Content/skins/baokim/images/ATM_offline.png" title="Thanh toán online bằng thẻ ATM" alt="" />
                    </a>
                    <a id="A1" href="#">
                        <img class="img-b" src="/Content/skins/baokim/images/ATM_h.png" title="Thanh toán online bằng thẻ ATM" alt="" />
                    </a>
                    <a id="A2" class="img-b" href="#">
                        <img src="/Content/skins/baokim/images/Banking_h.png" title="Thanh toán online bằng thẻ ATM" alt="" />
                    </a>
                </div>

                <input type="hidden" id="hidden" value="" />
                <input type="hidden" id="payment_method_id" name="payment_method_id" value="" />
                <input type="hidden" name="_vsw_action[ChargeBankPOST]" value="" />
                <input type="submit" name="_vsw_action[ChargeBankPOST]" style="display: none;" />
            </form>
        </div>
    </div>
</div>
