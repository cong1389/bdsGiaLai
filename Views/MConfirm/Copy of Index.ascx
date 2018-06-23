<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var item = ViewBag.Data as ModWebUserEntity ?? new ModWebUserEntity();
%>

<form method="post" name="register_form" enctype="multipart/form-data">

    <div class="gianhang all">
        <div class="title_raovat  all">
            <h2><%=ViewPage.CurrentPage.Name %></h2>
        </div>
        <div class="list_raovat all">
            <ul class="list_login form_margin">
                <li>
                    <label>Địa chỉ email *</label>
                    <input type="text" class="text01" name="Email" placeholder="Email đăng nhập" />
                </li>
                <li>
                    <label>Mật khẩu *</label>
                    <input type="password" class="text01" name="Password" placeholder="Mật khẩu đăng nhập" />
                </li>
                
                <li>
                    <label>Tạo gian hàng</label>

                    <div class="all">
                        <input type="radio" <%if(item.HasStore) {%>checked="checked"<%} %> value="1" name="HasStore"><span class="forradio">Có</span>
                        <input type="radio" <%if(!item.HasStore) {%>checked="checked"<%} %> value="0" name="HasStore"><span class="forradio">Không</span>
                    </div>
                </li>

                <li>
                    <label>Tên gian hàng *</label>
                    <input type="text" class="text01" name="Company" value="<%=item.Company %>" placeholder="Tên gian hàng" />
                </li>
                <li>
                    <label>Logo</label>
                    <input type="file" class="text01" name="File" />
                </li>

                <li>
                    <label>Họ và tên *</label>
                    <input type="text" class="text01" name="Name" value="<%=item.Name %>" placeholder="Họ và tên" />
                </li>
                <li>
                    <label>Điện thoại *</label>
                    <input type="text" class="text01" name="Phone" value="<%=item.Phone %>" placeholder="Điện thoại liên hệ" />
                </li>
                <li>
                    <label>Địa chỉ</label>
                    <input type="text" class="text01" name="Address" value="<%=item.Address %>" placeholder="Địa chỉ liên hệ" />
                </li>
                <li>
                    <label>Tỉnh / thành phố *</label>
                    <div id="list_menu">
                        <select class="text03" name="CityID">
                            <option value="0">- chọn tỉnh / thành phố -</option>
                            <%=Utils.ShowDDLMenuByType2("BSNews", ViewPage.CurrentLang.ID, item.CityID) %>
                        </select>
                    </div>
                </li>
                <li>
                    <label>Mã bảo mật *</label>
                    <div class="all">
                        <input type="text" class="text01 security" name="ValidCode" id="ValidCode" value="" />
                        <img class="generation_img" src="/Tools/Security.aspx" id="imgValidCode" alt="ValidCode" />
                        <a href="javascript:void(0)" class="change_captcha" onclick="change_captcha()" title="Đổi mã khác"></a>
                    </div>
                </li>

                <li>
                    <p class="dangnhap_btn fl"><a href="javascript:void(0)" onclick="document.register_form.submit()" rel="nofollow">đăng ký</a></p>
                    <div class="lost fl">
                        <a href="<%=ViewPage.GetURL("dang-nhap") %>" rel="nofollow">Đăng nhập</a>
                    </div>
                </li>
            </ul>

            <input type="hidden" name="_vsw_action[AddPOST]" />
            <input type="submit" name="_vsw_action[AddPOST]" style="display:none" />
        </div>
    </div>

</form>