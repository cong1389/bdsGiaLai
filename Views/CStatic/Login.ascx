<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%--<%if (!WebLogin.IsLogin()){%>
<ul class="dangky_dangnhap fr">
    <a class="a-btl-uload" href="<%=ViewPage.GetURL("dang-tin") %>">Đăng Tin</a>&nbsp; &nbsp;
    <li><a href="<%=ViewPage.GetURL("dang-ky") %>">Đăng ký</a></li>
</ul>
<%}else {%>
<ul class="dangky_dangnhap fr"> 
     <li><a  href="<%=ViewPage.GetURL("dang-tin") %>">Đăng Tin</a></li>
     <li><a href="<%=ViewPage.GetURL("tai-khoan") %>"><%if (WebLogin.CurrentUser.Name.Length > 20) {%>Chào:<%=WebLogin.CurrentUser.Name.Substring(0,20)+"..."%><%}else{%><%=WebLogin.CurrentUser.Name%><%}%></a>&nbsp;|&nbsp; </li>
    <li><a href="<%=ViewPage.GetURL("quan-ly-tin-dang")%>?act=quan-ly-tin-dang">Quản Lý Tin</a>&nbsp;|&nbsp; </li>
    <li><a href="<%=ViewPage.GetURL("tai-khoan/Logout") %>" rel="nofollow">Thoát</a></li>
</ul>
<%} %>--%>



 <ul class="dangky_dangnhap fr">
            <%if (WebLogin.IsLogin()){%>
            <li class="dangky1 bg_all1"><a href="<%=ViewPage.GetURL("tai-khoan") %>" rel="nofollow">Chào bạn <%=WebLogin.CurrentUser.Name %> (<%=string.Format("{0:#,##0}", WebLogin.CurrentUser.Point) %> Gold)</a>

                <ul class="webuser_box">
                    <li><a href="<%=ViewPage.GetURL("dang-tin") %>" rel="nofollow">Đăng tin</a></li>
                    <li><a href="<%=ViewPage.GetURL("thanh-vien") %>?act=nap-the" rel="nofollow">Nạp thẻ cào</a></li>
                    <li><a href="<%=ViewPage.GetURL("thanh-vien") %>?act=chuyen-khoan" rel="nofollow">Nạp tiền</a></li>
                    <li><a href="<%=ViewPage.GetURL("thanh-vien") %>?act=doi-mat-khau" rel="nofollow">Đổi mật khẩu</a></li>
                    <li><a href="<%=ViewPage.GetURL("thanh-vien") %>?act=thong-tin-ca-nhan" rel="nofollow">Thông tin cá nhân</a></li>
                    <li><a href="<%=ViewPage.GetURL("quan-ly-tin-dang") %>?act=quan-ly-tin-dang" rel="nofollow">Tin đã đăng</a></li>
                    <li><a href="<%=ViewPage.GetURL("thanh-vien/Logout") %>" rel="nofollow">Thoát</a></li>
                </ul>
                  |  
            </li>
            <li class="dangky1 bg_all1"><a href="<%=ViewPage.GetURL("thanh-vien/Logout") %>" rel="nofollow">Thoát</a></li> 
            <%}else{%>
            <li class="dangnhap bg_all"><a href="/dang-nhap.html" rel="nofollow" class="login">Đăng nhập</a></li>
            <li class="dangky bg_all"><a href="<%=ViewPage.GetURL("dang-ky") %>" rel="nofollow">Đăng ký</a></li>

            <%} %>
        </ul>