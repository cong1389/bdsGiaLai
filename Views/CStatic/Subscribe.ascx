<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<div class="wd-marketing-newsletter">
    <div class="wd-header">
        <span class="wd-icon"></span>
        <div class="wd-title">Newsletter</div>
    </div>
    <div class="wd-content">
        <form method="post" name="subscribe_form" action="{ActionForm}">
            <div class="form-wrapper">
                <p>Đăng ký nhận khuyến mãi mỗi ngày.</p>
                <div class="input-wrapper">
                    <label>Họ và tên:</label>
                    <input type="text" name="Name" id="Name" onblur="onTextBlur('Name','Họ và tên');" onfocus="onTextFocus('Name','Họ và tên');" value="Họ và tên" />
                </div>
                <div class="input-wrapper">
                    <label>Email:</label>
                    <input type="text" name="Email" id="Email" onblur="onTextBlur('Email','Địa chỉ email');" onfocus="onTextFocus('Email','Địa chỉ email');" value="Địa chỉ email" />
                </div>
                <div class="input-wrapper">
                    <button type="submit" name="_vsw_action[CStatic-AddPOST-Subscribe]"></button>
                </div>
            </div>
        </form>
    </div>
</div>