<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
            
    string[] _ArrVnExpress = new string[] { 
        "http://kinhdoanh.vnexpress.net/tin-tuc/hang-hoa/", 
        "----------",
        "http://kinhdoanh.vnexpress.net/tin-tuc/doanh-nghiep/doanh-nghiep-viet/", 
        "----------",
        "http://kinhdoanh.vnexpress.net/tin-tuc/ebank/ngan-hang/",
        "http://kinhdoanh.vnexpress.net/tin-tuc/ebank/thanh-toan-dien-tu/",
        "http://kinhdoanh.vnexpress.net/tin-tuc/ebank/tuyen-dung/",
        "http://kinhdoanh.vnexpress.net/tin-tuc/ebank/cong-dong/",
        "http://kinhdoanh.vnexpress.net/tin-tuc/ebank/tien-cua-toi/",
        "----------",
        "http://kinhdoanh.vnexpress.net/tin-tuc/bat-dong-san/du-an/",
        "----------",
        "http://kinhdoanh.vnexpress.net/tin-tuc/chung-khoan/",
        "----------",
        "http://kinhdoanh.vnexpress.net/tin-tuc/quoc-te/"
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!VSW.Lib.Global.CPLogin.IsLogin() || !VSW.Lib.Global.CPLogin.CurrentUser.IsAdministrator)
        {
            Response.Redirect("Login.aspx?ReturnPath=" + Server.UrlEncode(Request.RawUrl));
            return;
        }

        ////generator sitemap.xml
        //var listItem = ModNewsService.Instance.CreateQuery()
        //                            .Where(o => o.Activity == true)
        //                            .OrderByDesc(o => o.ID)
        //                            .ToList();

        //try
        //{
        //    XNamespace _Xnamespace = XNamespace.Get("http://www.sitemaps.org/schemas/sitemap/0.9");
        //    XElement _Urlset = null;
        //    XDocument siteMapDocument = new XDocument(_Urlset = new XElement(_Xnamespace + "urlset"));

        //    _Urlset.Add(new XElement(
        //                _Xnamespace + "url",
        //                new XElement(_Xnamespace + "loc", "http://tintucvietuc.com"),
        //                new XElement(_Xnamespace + "lastmod", DateTime.Now),
        //                new XElement(_Xnamespace + "priority", "1.0")
        //                )
        //    );

        //    foreach (var o in listItem)
        //    {
        //        _Urlset.Add(new XElement(
        //                    _Xnamespace + "url",
        //                    new XElement(_Xnamespace + "loc", ("http://tintucvietuc.com/vn/" + Utils.GetURL(o.MenuID, o.Code) + ".aspx").Replace("//", "/").Replace(".aspx.aspx", ".aspx")),
        //                    new XElement(_Xnamespace + "lastmod", DateTime.Now),
        //                    new XElement(_Xnamespace + "priority", "0.2")
        //                    )
        //        );
        //    }

        //    //luu sitemap
        //    siteMapDocument.Save(String.Format("{0}\\{1}", AppDomain.CurrentDomain.BaseDirectory, "sitemap.xml"));
        //}
        //catch (Exception ex)
        //{
        //    VSW.Lib.Global.Error.Write(ex.Message);
        //}

        ////submit sitemap
        //try
        //{
        //    System.Net.WebRequest reqGoogle = System.Net.WebRequest.Create("http://www.google.com/webmasters/tools/ping?sitemap=" + System.Web.HttpUtility.UrlEncode("http://tintucvietuc.com" + "/sitemap.xml"));
        //    reqGoogle.GetResponse();
        //}
        //catch (Exception ex)
        //{
        //    VSW.Lib.Global.Error.Write(ex.Message);
        //}
    }

    protected void btnRunVnExpress_Click(object sender, EventArgs e)
    {
        string _Url = Request.Form["UrlVnexpress"].ToString();
        int _MenuID = VSW.Core.Global.Convert.ToInt(Request.Form["MenuIDVnExpress"]);
        int _Page = VSW.Core.Global.Convert.ToInt(Request.Form["PageVnExpress"]);

        if (string.IsNullOrEmpty(_Url) || _Url == "- chọn đường dẫn -")
        {
            ltErrorVnExpress.Text += "Chưa nhập đường dẫn.<br />";
            return;
        }
        if (_MenuID < 1)
        {
            ltErrorVnExpress.Text += "Chưa chọn chuyên mục.<br />";
            return;
        }
        if (_Page < 1)
        {
            ltErrorVnExpress.Text += "Chưa chọn số trang giới hạn.<br />";
            return;
        }

        var menu = WebMenuService.Instance.GetByID(_MenuID);
        if (menu == null) return;
        string _UrlVnExpressData = "~/Data/upload/images/News/" + menu.Code + "/";
        string _UrlVnExpressDes = Server.MapPath(_UrlVnExpressData);
        if (!System.IO.Directory.Exists(_UrlVnExpressDes)) System.IO.Directory.CreateDirectory(_UrlVnExpressDes);

        HtmlHelper html = new HtmlHelper();
        html.InsertVnExpress(_Url, _MenuID, _Page, _UrlVnExpressData, _UrlVnExpressDes);

        ltErrorVnExpress.Text = "Thêm thành công.";
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Lấy tin tự động - webviet24h.com</title>
</head>
<body>
    <form id="form1" runat="server">

    <center><h1>LẤY TIN TỰ ĐỘNG</h1></center>

    <p style="font-size:20px;font-style:italic;font-weight:bold;margin-top:50px;">vnexpress.net</p>
    <table width="100%" cellpadding="10" cellspacing="10" style="border:1px dotted #CCC; border-collapse:collapse;">
        <tr>
            <td width="575">
                <span style="margin:10px 0;">ĐƯỜNG DẪN (có dạng http://kinhdoanh.vnexpress.net/)</span>
            </td>
            <td>
                <span style="margin:10px 0;">CHUYÊN MỤC</span>
            </td>
            <td>
                <span style="margin:10px 0;">GIỚI HẠN SỐ TRANG</span>
            </td>
        </tr>

        <tr>
            <td>
                <select name="UrlVnexpress" id="UrlVnexpress">
                    <option value="0">- chọn đường dẫn -</option>
                    <%for (int i = 0; _ArrVnExpress!=null && i < _ArrVnExpress.Length; i++){%>
                    <option value="<%=_ArrVnExpress[i] %>">- <%=_ArrVnExpress[i]%> -</option>
                    <%} %>
                </select>
            </td>
            <td>
                <select name="MenuIDVnexpress" id="MenuIDVnexpress">
                    <option value="0">- chọn chuyên mục -</option>
                    <%=Utils.ShowDDLMenuByType("News", 1, 0)%>
                </select>
            </td>
            <td>
                <select name="PageVnexpress" id="PageVnexpress">
                    <option value="0">- chọn số trang -</option>
                    <%for (int i = 1; i <= 100; i++){%>
                    <option value="<%=i %>">- <%=i %> -</option>
                    <%} %>
                </select>
            </td>
        </tr>
    </table>

    <div style="text-align:center; padding-top:30px; color:#FF0000; font-weight:bold;">
        <asp:Button ID="btnRunVnExpress" runat="server" onclick="btnRunVnExpress_Click" Text="Thực hiện"  Width="111px" />
        <br />
        <asp:Literal ID="ltErrorVnExpress" runat="server"></asp:Literal>
    </div>

    <center style="margin-top:50px;">Công ty cổ phần <a href="http://webviet24h.com" target="_blank">ANGKORICH</a></center>

    </form>
</body>
</html>
