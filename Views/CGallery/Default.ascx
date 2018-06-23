<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<SysPageEntity>;
    string title = ViewBag.Title;
%>

<div class="newsBox" id="banner1">
                                    <a class="newsBoxArrow" href="/news-events/ong-khalid-muhmood-dong-sang-lap-to-chuc-giao-duc-dao-tao-apollo-viet-nam-khi-tieng-anh-la-ve-vao-cua-cua-thanh-cong"></a>
                                    <a href="/news-events/ong-khalid-muhmood-dong-sang-lap-to-chuc-giao-duc-dao-tao-apollo-viet-nam-khi-tieng-anh-la-ve-vao-cua-cua-thanh-cong" title="Ông Khalid Muhmood, Đồng sáng lập Tổ chức Giáo dục & Đào tạo Apollo Việt Nam Khi Tiếng Anh là vé vào cửa của thành công">
                                        <img class="img-polaroid fl" typeof="foaf:Image" src="http://apollo.edu.vn/sites/default/files/styles/news-home-thumb/public/field/image/unnamed.jpg?itok=LP7oTbUi" width="319" height="248" alt="" /></a>
                                    <div class="homeNewsDesc" style="height: 41px;">
                                        <p class="newsBoxTitle"><a href="/news-events/ong-khalid-muhmood-dong-sang-lap-to-chuc-giao-duc-dao-tao-apollo-viet-nam-khi-tieng-anh-la-ve-vao-cua-cua-thanh-cong">Ông Khalid Muhmood, Đồng sáng lập Tổ chức Giáo dục & Đào tạo Apollo Việt Nam Khi Tiếng Anh là vé vào cửa của thành công</a></p>
                                        <p class="newsBoxDesc">Có hơn 20 năm kinh nghiệm trong việc xây dựng chương trình dào tạo tiếng Anh cho các tập đoàn lớn, Apollo được nhiều người xem là nơi đáng tin cậy...</p>
                                    </div>
                                    <div class="homeNewsDescB"></div>
                                </div>






<div class="webpart margin_bt fl">
    <div class="left_webpart">
        <div class="wrap_left_webpart">
            <h2><a href="javascript:void(0)" rel="nofollow"><%=title %></a></h2>
            <ul class="list_tk">
                <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %></a></li>
                <%} %>
            </ul>
        </div>
    </div>
</div>