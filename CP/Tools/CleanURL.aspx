﻿<%@ Page Language="C#" AutoEventWireup="true" %>
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
            //update url
            if (!ModCleanURLService.Instance.CheckCode(listProduct[i].Code, "Product", listProduct[i].ID))
                ModCleanURLService.Instance.InsertOrUpdate(listProduct[i].Code, "Product", listProduct[i].ID, listProduct[i].MenuID);
        }
        
        var listNews = ModNewsService.Instance.CreateQuery().ToList();
        for (int i = 0; listNews != null && i < listNews.Count; i++)
        {
            //update url
            if (!ModCleanURLService.Instance.CheckCode(listNews[i].Code, "News", listNews[i].ID))
                ModCleanURLService.Instance.InsertOrUpdate(listNews[i].Code, "News", listNews[i].ID, listNews[i].MenuID);
        }
        
        var listPage = SysPageService.Instance.CreateQuery().ToList();
        for (int i = 0; listPage != null && i < listPage.Count; i++)
        {
            //update url
            if (!ModCleanURLService.Instance.CheckCode(listPage[i].Code, "Page", listPage[i].ID))
                ModCleanURLService.Instance.InsertOrUpdate(listPage[i].Code, "Page", listPage[i].ID, listPage[i].MenuID);
        }
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
            <asp:Button ID="btnRun" runat="server" onclick="btnRun_Click" Text="Run" Width="111px" />
        </center>
    </div>
    </form>
</body>
</html>
