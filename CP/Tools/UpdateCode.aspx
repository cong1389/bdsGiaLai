<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
            
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!VSW.Lib.Global.CPLogin.IsLogin() || !VSW.Lib.Global.CPLogin.CurrentUser.IsAdministrator)
        {
            Response.Redirect("Login.aspx?ReturnPath=" + Server.UrlEncode(Request.RawUrl));
            return;
        }
    }

    protected void btnRun_Click(object sender, EventArgs e)
    {
        var listProduct = ModProductService.Instance.CreateQuery().ToList();
        for (int i = 0; listProduct != null && i < listProduct.Count; i++)
        {
            listProduct[i].Code = Data.GetCode(listProduct[i].Name) + "-p" + listProduct[i].ID;
            ModProductService.Instance.Save(listProduct[i]);
        }
        
        var listNews = ModNewsService.Instance.CreateQuery().ToList();
        for (int i = 0; listNews != null && i < listNews.Count; i++)
        {
            listNews[i].Code = Data.GetCode(listNews[i].Name) + "-n" + listNews[i].ID;
            ModNewsService.Instance.Save(listNews[i]);
        }
        
        //var listPage = SysPageService.Instance.CreateQuery().ToList();
        //for (int i = 0; listPage != null && i < listPage.Count; i++)
        //{
        //    listPage[i].Code = Data.GetCode(listPage[i].Name);
        //    SysPageService.Instance.Save(listPage[i]);
        //}

        //var listMenu = WebMenuService.Instance.CreateQuery().ToList();
        //for (int i = 0; listMenu != null && i < listMenu.Count; i++)
        //{
        //    listMenu[i].Code = Data.GetCode(listMenu[i].Name);
        //    WebMenuService.Instance.Save(listMenu[i]);
        //}
    }
    
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>SQL</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>        
            
        <br />
            <asp:TextBox ID="txtSQL" TextMode="MultiLine" runat="server" Height="200px" 
                Width="574px"></asp:TextBox>
            
            <br />
            
            <asp:Button ID="btnRun" runat="server" onclick="btnRun_Click" Text="Run" 
                Width="111px" />
        
        
         <br /><br />
           <asp:TextBox ID="txtResult" TextMode="MultiLine" runat="server" Height="200px" 
                Width="574px"></asp:TextBox>
        </center>
    </div>
    </form>
</body>
</html>
