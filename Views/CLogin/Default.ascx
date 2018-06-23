<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%--<div class="dangky_dangnhap fl">
    <div class="dangky1 fl"></div>
    <ul class="dangky2 fl">
        <%if (!WebLogin.IsLogin()){%>
        <li><a href="<%=ViewPage.GetURL("dang-ky") %>">Đăng ký</a></li>
        <li><a href="#inline" class="fancybox">Đăng nhập</a></li>
        <%}else {%>
        <li><a href="<%=ViewPage.GetURL("tai-khoan") %>">Welcome <b><%=WebLogin.CurrentUser.Username %></b></a></li>
        <li><a href="<%=ViewPage.GetURL("tai-khoan/Logout") %>">Thoát</a></li>
        <%} %>
        
    </ul>
    <div class="dangky3 fl"></div>
</div>--%>

<%--<div>
    <div id="inline">
        <div class="container">
            <div id="content">
                <form method="post" name="login_form" action="{ActionForm}">
                <h1>Đăng nhập</h1>

                
               

                <div>
                    
                    <a href="<%=ViewPage.GetURL("quen-mat-khau") %>">Quên mật khẩu?</a> 
                    <a href="<%=ViewPage.GetURL("dang-ky") %>">Đăng ký mới</a>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>--%>
<%-- ------------------------- --%>
<div class="box-bds all">
                    <div class="title all">
                        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
                        <div class="dv-ct-tabs">
                            <h2><a href="" class="a-title"> Đăng nhập</a></h2>
                        </div>
                    </div>
                    <div class="bds-body">
                        <div class="dangnhap">
                            <p class="wecom"> Chào mừng bạn đến với <span> Reo.com.vn</span></p>
                            <div class="dangnhap-header">
                                 <img src="skins/images/dangnhap.jpg">&nbsp;
                                 Đăng nhập 
                             </div>
                             <form method="post" name="login_form" action="{ActionForm}">
                             <div class="dangnhap-content all">
                                <div class="dangnhap-content-left">
                                    <div class="dangnhap-content-left-row">
                                        Tên đăng nhập hoặc email (<span>*</span>)
                                    </div>
                                    <div class="dangnhap-content-left-row"> <input type="text" name="Username" id="Username" value="Tên đăng nhập" onblur="onUsernameBlur();" onfocus="onUsernameFocus();" /> </div>
                                    <div class="dangnhap-content-left-row">
                                        Mật khẩu (<span>*</span>)
                                    </div>
                                    <div class="dangnhap-content-left-row">
                                         <input type="password" id="Password" name="Password" onblur="onPasswordBlur()" style="display: none;" />
                <input type="text" id="Password1" name="Password1" onfocus="onPasswordFocus()" value="Mật khẩu" />
                                    </div>
                                    <div class="dangnhap-content-left-row">
                                        <input type="checkbox" checked="checked" value="1">
                                        <a>Nhớ tài khoản</a>
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
                                            <a href="<%=ViewPage.GetURL("dang-ky") %>"><input type="submit" class="button-login" value="Đăng ký"></a>
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