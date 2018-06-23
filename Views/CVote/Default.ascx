<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<script runat="server">
    List<ModVoteEntity> listItem = null;
    int MenuID = 0;
    string title = string.Empty;
    
    void Page_Load(object sender, EventArgs e)
    {
        listItem = ViewBag.Data as List<ModVoteEntity>;
        MenuID = ViewBag.MenuID;
        title = ViewBag.Title;
    }

    string GetAlphabet(int pos)
    {
        char[] alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToLower().ToCharArray();
        return pos <= 26 ? alpha[pos].ToString() : string.Empty;
    }
</script>

<%if (listItem != null){%>
<div class="danhmuc none_pad">
    <h2><img src="/Content/skins/images/icon_li.png" alt="icon_li" /><a href="javascript:;">Thắc mắc của bạn</a></h2>
    <div class="thacmac">
        <h3><img src="/Content/skins/images/request.png" alt="request" /><a href="javascript:;"><%=listItem[0].getMenu().Name %></a></h3>
        <ul class="list_request">
        <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
            <li><input <%if(i == 0) {%>checked="checked"<%} %> name="<%=VSWID %>" type="radio" value="<%=listItem[i].ID%>" /><a href="javascript:;"><%=listItem[i].Name%></a></li>
        <%} %>
            <li><a href="#">Hình thức thanh toán ?</a></li>
            <li><a href="#">Đại lý, bán buôn tranh thêu ?</a></li>
            <li><a href="#">Chính sách vận chuyển ?</a></li>
            <li><a href="#">Chính sách thẻ VIP ?</a></li>
            <li><a href="#">Đóng khung tranh thêu ?</a></li>
            <li><a href="#">Chuyển ảnh thành chart ?</a></li>
        </ul>
    </div>
    <!--End class thacmac-->
</div>







<div class="thongtin">
    <h2><a href="javascript:;"><%=title %></a></h2>
    <div class="noidung_thongtin">
        <div class="thamdo">
            <h3><a href="javascript:;"><%=listItem[0].getMenu().Name %></a></h3>
            <div class="rd">
                <ul>
                <%for (int i = 0; listItem != null && i < listItem.Count; i++){%>
                    <li><input <%if(i == 0) {%>checked="checked"<%} %> name="<%=VSWID %>" type="radio" value="<%=listItem[i].ID%>" /><a href="javascript:;"><%=listItem[i].Name%></a></li>
                <%} %>
                </ul>
            </div>

            <div class="bottom">
                <input class="bg" type="button" value="Bình chọn" onclick="ShowVoteForm('<%=ViewPage.GetURL("tham-do-y-kien") %>/menuid/<%=MenuID %>', 'Tham do y kien', 600, 300, true, '<%=VSWID %>');return false;" />
                <input class="bg" type="button" value="Kết quả" onclick="ShowVoteForm('<%=ViewPage.GetURL("tham-do-y-kien") %>/menuid/<%=MenuID %>', 'Tham do y kien', 600, 300, false, '<%=VSWID %>');return false;" />
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function ShowVoteForm(pageURL, title, w, h, vote_mode, client_name) {
        var left = (screen.width / 2) - (w / 2);
        var top = (screen.height / 2) - (h / 2);

        if (vote_mode) {
            var listName = window.document.getElementsByName(client_name);
            for (i = 0; i < listName.length; i++) {
                if (listName[i].checked) {
                    pageURL += '/voteid/' + listName[i].value;
                }
            }
        }

        var targetWin = window.open(pageURL, title, 'toolbar=no, titlebar=no, status=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
    }
</script>
<%} %>