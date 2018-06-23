<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    if (listItem == null) return;
%>

<div class="slide">
    <div id="list_news">
        <%for(int i = 0; i < listItem.Count; i++){
            string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
        %>
        <div style="position:relative;">
            <a href="<%=url %>" title="<%=listItem[i].Name %>">
                <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 550, 328)%>" width="550" height="328" alt="<%= listItem[i].Name %>" />
            </a>
            <p class="onslide"><a href="<%=url %>" title="<%=listItem[i].Name %>"><%= listItem[i].Name %></a></p>
        </div>
        <%} %>
    </div>
    <div id="thumbs">
        <div id="thumbscarousel">
            <%for(int i = 0; i < listItem.Count; i++){%>
            <img src="<%= Utils.GetResizeFile(listItem[i].File, 2, 150, 75)%>" width="150" height="75" alt="<%= listItem[i].Name %>" />
            <%} %>
        </div>
    </div>

    <div id="pager_slide"></div>
</div>

<style type="text/css">
    #list_news {
    width: 550px;
    height: 328px;
    overflow: hidden;
    }
    #list_news > div {
    display: block;
    float: left;
    }
    #list_news > div > a {
    display: block;
    float: left;
    }

    #list_news img {
    display: block;
    float: left;
    }

    #pager_slide {
      float: left;
      margin-top: 5px;
      text-align: right;
    }

    #pager_slide a {
        background-color: #00A3E8;
        box-shadow: 0 1px 1px #CCEEFF;
        display: inline-block;
        height: 20px;
        margin-right: 6px;
        width: 20px;
    }

    #pager_slide a.selected {
    background-color: #D20604;
    }

    #pager_slide a span {
      color: #FFFFFF;
      float: left;
      font-weight: bold;
      height: 20px;
      padding-top: 3px;
      text-align: center;
      width: 20px;
    }

    #thumbs {
      background-color: rgba(0, 0, 0, 0.5);
      border: 1px solid rgba(0, 0, 0, 0.8);
      display: none;
      height: 75px;
      padding: 10px;
      position: absolute;
      width: 150px;
      right: 0;
      bottom: 42px;
      top: ;
    }

    #thumbs img {
    display: block;
    float: left;
    }
</style>
