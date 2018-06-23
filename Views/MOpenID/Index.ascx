<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var item = ViewBag.Data as ModWebUserEntity ?? new ModWebUserEntity();
%>

<div class="floor all">
    <div class="fltop all">
        <h1><%=ViewPage.CurrentPage.Name %></h1>
    </div>

    <div class="list_sptieubieu border_top all">
        <div class="wrap-account">
            <form method="post" name="google_form" onsubmit="document.google_form.submit(); return false;">
                <div class="ctn-creat-shop">
                    <h4>Thông tin tài khoản</h4>
                    <div class="account-form">
                        <p class="row-info">
                            <label>Tên đăng nhập <span>(*)</span></label>
                            <input type="text" name="Username" value="<%=item.Username %>" />
                            <span class="content-tips">Tên đăng nhập được lấy từ tài khoản google của bạn. Bạn có thể đổi tên đăng nhập khác.</span>
                        </p>
                        <p class="row-info">
                            <label>Chọn một mật khẩu <span>(*)</span></label>
                            <input type="password" name="Password" />
                            <span class="content-tips">Mật khẩu phải từ 6-12 ký tự.</span>
                        </p>
                    </div>
                </div>
                <div class="ctn-creat-shop">
                    <h4>Thông tin cá nhân</h4>
                    <div class="account-form">
                        <p class="row-info">
                            <label for="name">Họ và tên <span>(*)</span></label>
                            <input type="text" name="Name" value="<%=item.Name %>" />
                            <span class="content-tips">Họ và tên được lấy từ tài khoản google của bạn.</span>
                        </p>
                        <p class="row-info">
                            <label for="address">Email <span>(*)</span></label>
                            <input type="text" name="Email" value="<%=item.Email %>" />
                            <span class="content-tips">Email được lấy từ tài khoản google của bạn.</span>
                        </p>
                        <p class="row-info">
                            <label for="address">Mã bảo mật <span>(*)</span></label>
                            <input type="text" class="security" name="ValidCode" id="ValidCode" value="" />
                            <img class="sec_img" src="/Tools/Security.aspx" id="imgValidCode" alt="ValidCode" />
                            <img src="/Content/skins/images/recaptcha_refresh.png" class="sec_img2" title="Đổi mã khác" onclick="change_captcha();" alt="Đổi mã" />
                        </p>
                        <p class="row-info">
                            <label for="address"></label>
                            <span class="buy01 margin15 fl"><a href="javascript:void(0)" onclick="document.google_form.submit(); return false;" rel="nofollow">Xác nhận thông tin</a></span>
                        </p>
                    </div>
                </div>

                <input type="hidden" name="_vsw_action[AddGooglePOST]" />
                <input type="submit" name="_vsw_action[AddGooglePOST]" style="display:none;" />
            </form>
        </div>
    </div>
</div>