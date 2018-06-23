<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var item = WebLogin.CurrentUser ?? new ModWebUserEntity();
%>


    <div class="box-bds all">
        <div class="title all">
            <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
            <div class="dv-ct-tabs">
                <h2><a href="javascrip:voi(0);" class="a-title">Thay Đổi Mật Khẩu</a></h2>
            </div>
        </div>
        <div class="bds-body">
            <div class="register fl">
                <form method="post" name="password_form" id="password_form" enctype="multipart/form-data">
                <ul class="dangky fl">
                    <li>
                        <p style="font-style: italic;">Quý khách vui lòng nhập đủ thông tin:  </p>
                    </li>
                    <li>
                        <label>Mật khẩu cũ <span class="red">(*)</span></label>
                        <input placeholder="Mật khẩu cũ" type="password" name="Password" value="">
                    </li>
                    <li>
                        <label>Mật khẩu mới <span class="red">(*)</span></label>
                        <input placeholder="Mật khẩu mới" type="password" name="Password1" value=""><span class="red">(6 -> 12 ký tự!)</span>
                    </li>
                    <li>
                        <label>Nhập lại mật khẩu <span class="red">(*)</span></label>
                        <input placeholder="Nhập lại mật khẩu" type="password" name="Password2" value=""><span class="red">(6 -> 12 ký tự!)</span>
                    </li>
                    <li>
                        <label></label>
                        <input type="submit" value="Cập nhật" name="_vsw_action[ChangePasswordPOST]" />
                        <input type="reset" value="Nhập lại" />
                    </li>
                </ul>
                </form>
            </div>
        </div>
    </div>




    <div class="box-bds all">
        <div class="title all">
            <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
            <div class="dv-ct-tabs">
                <h2><a href="javascrip:voi(0);" class="a-title">Thay đổi thông tin! </a></h2>
            </div>
        </div>
        <div class="bds-body">
            <div class="register fl">
                <form method="post" name="info_form" enctype="multipart/form-data">
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
                        <input type="text" placeholder="" readonly="readonly" name="Usernameid" id="Usernameid" value="<%=item.Username %>">
                    </li>
                    <li>
                        <label>Địa chỉ Email:<span class="red">(*)</span></label>
                        <input type="text" placeholder="" name="Email" value="<%=item.Email %>">
                    </li>

                    <li>
                       <label>Loại môi giới : <span style="color: #FF0000;">(*)</span></label>

                            <select name="ObjectID" id="Select1">
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
                        <label></label>
                        <input type="submit" value="Cập nhật" name="_vsw_action[ChangeInfoPOST]" />
                         <input type="reset" value="Nhập lại" />
                    </li>
                </ul>
                </form>
            </div>
        </div>
    </div>

