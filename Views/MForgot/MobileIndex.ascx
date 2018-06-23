<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%--<div class="sanpham_c fl">
    <div class="tieude_c"><%=Utils.GetMapPage(ViewPage.CurrentPage,"")%></div>

    <div class="tintuc_bd">
        <div class="contact">

            <form method="post" name="forgot_form">
            <p class="title_contact">Nhập địa chỉ email đã dùng để đăng ký tài khoản</p>
            <div class="fieldwrapper">
                <label class="styled">Hộp thư <span style="color: red">(*)</span></label>
                <div class="thefield">
                    <input class="subject" type="text" name="Email" value="" />
                </div>
            </div>
            <div class="send">
                <input type="submit" name="_vsw_action[ForgotPOST]" value="Xác nhận" />
                <input type="reset" name="Reset" value="Nhập lại" />
            </div>
            </form>

        </div>
    </div>
</div>--%>

<%if (!WebLogin.IsLogin())
  {%>
<div class="box-bds all">
                    <div class="title all">
                        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
                        <div class="dv-ct-tabs">
                            <h2><a href="" class="a-title"> Nhập địa chỉ email đã dùng để đăng ký tài khoản</a></h2>
                        </div>
                    </div>
                        <div class="bds-body">
                        <div class="dangnhap">
                            <p class="wecom"> Chào mừng bạn đến với <span> Muabanbds.net</span></p>
                            <div class="dangnhap-header">
                                  <img src="/Content/skins/images/dang_ky.jpg">&nbsp;
                                 Quên mật khẩu
                             </div>
                             <form method="post" name="login_form" action="{ActionForm}">
                             <div class="dangnhap-content all">
                                <div class="dangnhap-content-left">
                                    <div class="dangnhap-content-left-row">
                                      Mật khẩu mới sẽ được gửi về hộp thư: (<span>*</span>)
                                    </div>
                                    <div class="dangnhap-content-left-row">  
                                        <input type="text" name="Username" id="Username" value="" placeholder="Nhập Tên đăng nhập vào đây!"/> 

                                    </div>
                                    <div class="dangnhap-content-left-row">  
                                        <input type="text" name="Email" id="Email" value="" placeholder="Nhập Email mà bạn đã đăng ký vào đây!"/> 

                                    </div>

                                      <input type="submit" name="_vsw_action[ForgotPOST]" value="Xác nhận" />
                                            <input type="reset" name="Reset" value="Nhập lại" />
                                </div>
                                  </form>
                                <div class="dangnhap-content-right">
                                    <p class="colorblue"> Nếu bạn chưa có tài khoản tại Muabanbds.net</p>
                                    <div class="dangnhap-content-right-nut">
                                            <a href="<%=ViewPage.GetURL("dang-ky") %>">
                                                <input type="button" class="button-login" value="Đăng ký">
                                            </a>
                                        
                                    </div>
                                </div>
                             </div>
                                 
                        </div>
                    </div>
    </div>
<%} %>