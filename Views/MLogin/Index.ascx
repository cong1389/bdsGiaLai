<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>


<%-- -------------------------------- --%>
<%if (!WebLogin.IsLogin())
  {%>
<div class="box-bds all">
                    <div class="title all">
                        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
                        <div class="dv-ct-tabs">
                            <h2><a href="" class="a-title"> Đăng nhập</a></h2>
                        </div>
                    </div>
                        <div class="bds-body">
                        <div class="dangnhap">
                            <p class="wecom"> Chào mừng bạn đến với <span> Reo.com.vn </span></p>
                            <div class="dangnhap-header">
                                 <img src="/Content/skins/images/dangnhap.jpg">&nbsp;
                                 Đăng nhập 
                             </div>
                             <form method="post" name="login_form" action="{ActionForm}">
                             <div class="dangnhap-content all">
                                <div class="dangnhap-content-left">
                                    <div class="dangnhap-content-left-row">
                                        Tên đăng nhập hoặc email (<span>*</span>)
                                    </div>
                                    <div class="dangnhap-content-left-row">  <input type="text" name="Username" id="Username" value="Tên đăng nhập" onblur="onUsernameBlur();" onfocus="onUsernameFocus();" /> </div>
                                    <div class="dangnhap-content-left-row">
                                        Mật khẩu  (<span>*</span>)
                                    </div>
                                    <div class="dangnhap-content-left-row">
                                        <input type="password" id="Password" name="Password" onblur="onPasswordBlur()" style="display: none;" />
                                         <input type="text" id="Password1" name="Password1" onfocus="onPasswordFocus()" value="Mật khẩu" />
                                    </div>
                                    <div class="dangnhap-content-bottom">
                                        <span>
                                            <input type="submit" value="Đăng nhập" name="_vsw_action[LoginPOST]" />
                                        </span>
                                        <span> <a href="/quen-mat-khau.html">Quên mật khẩu?</a></span>
                                    </div>
                                </div>
                                <div class="dangnhap-content-right">
                                    <p class="colorblue"> Nếu bạn chưa có tài khoản tại Reo.com.vn</p>
                                    <div class="dangnhap-content-right-nut">
                                            <a href="<%=ViewPage.GetURL("dang-ky") %>"><input type="button" class="button-login" value="Đăng ký"></a>
                                    </div>
                                </div>
                             </div>
                                  </form>
                        </div>
                    </div>
    </div>


<script type="text/javascript" language="javascript">
    var Username = document.getElementById('Username');
    function onUsernameBlur() {
        if (Username.value == '') Username.value = 'Tên đăng nhập';
    }
    function onUsernameFocus() {
        if (Username.value == 'Tên đăng nhập') Username.value = '';
    }

    var Password1 = document.getElementById('Password1');
    var Password = document.getElementById('Password');
    function onPasswordBlur() {
        if (Password.value == '') {
            Password1.style.display = '';
            Password.style.display = 'none';
        }
    }
    function onPasswordFocus() {
        Password.style.display = '';
        Password1.style.display = 'none';
        Password.focus();
    }
</script>
<%}  else
  {%>
<%ViewPage.Response.Redirect("/"); %>
<%}%>