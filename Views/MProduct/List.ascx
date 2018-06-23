<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<script runat="server">
    
    public bool GridMode { get { return VSW.Core.Web.HttpQueryString.GetValue("view").ToString() != "list"; } }

    public int SizeMode
    {
        get
        {
            int size = VSW.Core.Web.HttpQueryString.GetValue("size").ToInt();

            if (size == 24 || size == 48 || size == 96)
                return size;
            return 24;
        }
    }

    public string SortMode
    {
        get
        {
            string sort = VSW.Core.Web.HttpQueryString.GetValue("sort").ToString().ToLower().Trim();

            if (sort == "update" || sort == "new" || sort == "price_asc" || sort == "price_desc")
                return sort;
            return "update";
        }
    }

    public string GetURL(string sKey, string sValue)
    {
        string strUrl = string.Empty;
        string strKey = string.Empty;
        string strValue = string.Empty;
        for (int i = 0; i < ViewPage.PageViewState.Count; i++)
        {
            strKey = ViewPage.PageViewState.AllKeys[i];
            strValue = ViewPage.PageViewState[strKey].ToString();
            if (strKey.ToLower() == sKey.ToLower() || strKey.ToLower() == "vsw" || strKey.ToLower() == "v" || strKey.ToLower() == "s" || strKey.ToLower() == "w" || strKey.ToLower().Contains("web."))
                continue;
            if (strUrl == string.Empty)
                strUrl = "?" + strKey + "=" + HttpContext.Current.Server.UrlEncode(strValue);
            else
                strUrl += "&" + strKey + "=" + HttpContext.Current.Server.UrlEncode(strValue);
        }
        strUrl += (strUrl == string.Empty ? "?" : "&") + sKey + "=" + sValue;

        return strUrl;
    }
</script>

<%
    var listItem = ViewBag.Data as List<ModProductEntity>;
    var model = ViewBag.Model as MProductModel;
%>

<div class="sanpham_c fl">
    <div class="tieude_c"><%=Utils.GetMapPage(ViewPage.CurrentPage,"")%></div>

    <div class="tieude_phu">
        <div class="views fl">
            <p>Hiển thị:</p>
            <ul class="views_1 fl">
                <li><a href="<%= GetURL("view", "list") %>" <%if(!GridMode){%>class="selected"<%} %>>Danh sách</a></li>
                <li><a href="<%= GetURL("view", "grid") %>" <%if(GridMode){%>class="selected"<%} %>>Lưới</a></li>
            </ul>
        </div>
        <div class="views fr">
            <p>Sắp xếp:</p>
            <select onchange="javascript:window.location.href='' + this.value;">
                <option value="" selected="selected">-lựa chọn-</option>
                <option value="<%= GetURL("sort", "new") %>" <%if(SortMode=="new"){%>selected="selected"<%} %>>Sản phẩm mới</option>
                <option value="<%= GetURL("sort", "price_asc") %>" <%if(SortMode=="price_asc"){%>selected="selected"<%} %>>Giá tăng dần</option>
                <option value="<%= GetURL("sort", "price_desc") %>" <%if(SortMode=="price_desc"){%>selected="selected"<%} %>>Giá giảm dần</option>
            </select>
        </div>
    </div>

    <ul class="listsp_list fl">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++){
          string _Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code); 
    %>
        <li>
            <%if (!string.IsNullOrEmpty(listItem[i].File)) {%>
            <div class="anh_tin">
                <a href="<%=_Url%>">
                    <img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 128, 100)%>" width="128" height="100" alt="<%=listItem[i].Name%>" />
                </a>
            </div>
            <%} %>
            <div class="info">
                <h4><a href="<%=_Url%>"><%=listItem[i].Name%></a></h4>
                <p class="tinhtrang">Tình trạng: <%=listItem[i].Store ? "Còn hàng" : "Hết hàng"%></p>
                <p class="price"><%if (listItem[i].Price2 > 0){%><%=string.Format("{0:#,##0}", listItem[i].Price2)%> đ<%} %></p>
                <p class="price"><%if (listItem[i].Price > 0){%><span><%=string.Format("{0:#,##0}", listItem[i].Price)%> đ</span><%} %></p>
            </div>
            <p class="muahang_list"><input class="btn-order" type="button" value="Mua" onclick="location.href='<%=ViewPage.GetURL("gio-hang/Add") %>?ProductID=<%=listItem[i].ID %>&Quantity=1&returnpath=<%=ViewPage.ReturnPath%>'" /></p>
        </li>
    <%} %>
    </ul>

    <ul class="phantrang">
        <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
    </ul>
</div>