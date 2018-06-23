<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<div class="giohang1">
<div class="header_1"></div>
<div class="top">
    <a class="not-yet"><span class="icon step-cart"></span>Giỏ hàng</a>
    <a class="not-yet"><span class="icon step-payment"></span>Thanh toán</a>
    <a class="active"><span class="icon step-finish"></span>Hoàn tất</a>
</div>

<div id="box">
    <div class="hoantat">
        <div class="hoantat_gr">
            {RS:Cart_Complete}
        </div>
    </div>
</div>

<div class="bottom" style="width: 100%;">
    <input value="Trang chủ" class="next-step" onclick="location.href='/';" type="button" />
</div>
</div>
