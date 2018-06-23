<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModVoteEntity>;
    var model = ViewBag.Model as MVoteModel;
    int TotalValue = ViewBag.TotalValue;
    
    
%>

<table style="border: 1px solid rgb(0, 102, 153);" width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgcolor="#ff0000">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="24">
                        &nbsp;
                    </td>
                    <td style="color: rgb(255, 255, 255);">
                        <b><%if (listItem != null){%><%=listItem[0].getMenu().Name%><%} %></b>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left">
            <table width="100%" border="0" cellpadding="5" cellspacing="1">
                <%for (int i = 0; listItem != null && i < (listItem.Count > 8 ? 8 : listItem.Count); i++){ %>
                <tr bgcolor="#ffffff">
                    <td width="50%">
                        <%=listItem[i].Name%>
                    </td>
                    <td width="25%">
                        <table width="<%= string.Format("{0:##0.##}", (double)listItem[i].Value * 100 / (double)TotalValue)%>" bgcolor="#0099ff" border="0" bordercolor="#000066" cellpadding="0" cellspacing="0">
                            <tr>
                                <td> &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <%=listItem[i].Value%> {RS:Res_Vote_P}(<%= string.Format("{0:##0.##}", (double)listItem[i].Value * 100 / (double)TotalValue)%> %)
                    </td>
                </tr>
                <%} %>
            </table>
        </td>
    </tr>
</table>
<p>
    <b>Kết quả : <%= TotalValue%> lượt bình chọn </b>
    <p>
        <input name="submit" value="Đóng" onclick="window.close()" type="submit" />
    </p>
</p>