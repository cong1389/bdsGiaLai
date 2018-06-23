<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var item = ViewBag.Data as ModWebUserEntity ?? new ModWebUserEntity();
%>

<%if (!WebLogin.IsLogin())
  { %>
<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="javascrip:voi(0);" class="a-title">Đăng ký </a></h2>
        </div>
    </div>
    <div class="bds-body">
        <div class="register fl">
            <div class="register-header">
                <h2>
                    <img src="/Content/skins/images/dang_ky.jpg">
                    Đăng ký thành viên
                </h2>
            </div>
            <form method="post" name="register_form" id="register_form" enctype="multipart/form-data">

                <ul class="dangky fl">
                    <li>
                        <p style="font-style: italic;">Quý khách vui lòng điền đầy đủ thông tin:  </p>
                    </li>
                    <li>
                        <label>Logo :<span style="color: #FF0000;"> </span></label>
                        <input type="file" class="text" name="Logo" id="Logo" value="<%=item.Logo %>" style="display: list-item;" />
                    </li>
                    <li>
                        <label>Tên đăng nhập <span class="red">(*)</span></label>
                        <input type="text" placeholder="" name="Username" id="Username" value="<%=item.Username %>">
                    </li>
                    <li>
                        <label>Mật khẩu <span class="red">(*)</span></label>
                        <input type="password" placeholder="" id="Password" name="Password" value="">
                    </li>
                    <li>
                        <label>Nhập lại mật khẩu <span class="red">(*)</span></label>
                        <input type="password" placeholder="" id="oldPassword" name="oldPassword" value="">
                    </li>
                    <li>
                        <label>Địa chỉ Email:<span class="red">(*)</span></label>
                        <input type="text" placeholder="" name="Email" value="<%=item.Email %>">
                    </li>

                    <li>
                       <label>Loại : <span style="color: #FF0000;">(*)</span></label>

                            <select name="ObjectID" id="ObjectID">
                                <option value="0">---Chọn một---</option>
                                    <%= Utils.ShowDDLMenuByType2("ObjectID", ViewPage.CurrentPage.LangID, item.ObjectID)%>
                            </select>
                    </li>
                    <li>
                        <label>Skype :</label>

                        <input class="text" type="text" name="Skype" placeholder="Skype" value="<%=item.Skype %>" />
                    </li>
                     <li>
                        <label>Yahoo :</label>

                        <input class="text" type="text" name="Yahoo" placeholder="Yahoo" value="<%=item.Yahoo %>" />
                    </li>
                    <li>
                        <label>Họ và tên: <span class="red">(*)</span></label>
                        <input type="text" placeholder="" name="Name" value="<%=item.Name %>">
                    </li>
                    <li>
                        <label>Điện thoại di động: <span class="red">(*)</span></label>
                        <input type="text" placeholder="" name="Mobile" value="<%=item.Mobile %>">
                    </li>
                    <li>
                        <label class="fl">Địa chỉ:</label>
                        <input type="text" placeholder="" name="Address" value="<%=item.Address %>">
                    </li>
                    <li class="captcha-content">
                        <label>Mã xác thực:<span class="red">*</span></label>
                        <input type="text" class="security w150px" name="ValidCode" id="ValidCode" value="" />
                        <img src="/Tools/Security.aspx" id="imgValidCode" alt="ValidCode" />
                        <a href="javascript:void(0)" class="recaptcha" onclick="change_captcha();" rel="nofollow">Đổi mã khác</a>
                    </li>
                    <li>
                        <p style="font-weight: bold;">{RS:Register}</p>
                    </li>
                    <li>
                        <label></label>
                        <input type="submit" value="Đăng ký" name="_vsw_action[AddPOST]" class="button-login" />
                        <input type="reset" value="Nhập lại" />
                    </li>

                </ul>
            </form>
        </div>
    </div>
</div>
<%}
  else { ViewPage.Navigate("/"); } %>
