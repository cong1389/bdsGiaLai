<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModBSNewsEntity>;
    var page = ViewBag.Page as SysPageEntity;
    if (listItem == null || page == null) return;

    string title = ViewBag.Title;
    string link = ViewBag.Link;

    int ProjectID = ViewBag.ProjectID;
    int CityID = ViewBag.CityID;
    int MenuID = ViewBag.MenuID;
    int isVip = ViewBag.isVip;
    int State = ViewBag.State;
    int PageSize = ViewBag.PageSize;

    var Total = ModBSNewsService.Instance.CreateQuery()
                        .Select(o => o.ID)
                        .Where("[DateStart] IS NULL OR DATEDIFF(minute, [DateStart], GETDATE()) >= 0")
                        .Where(o => o.Activity == true)
                        .Where(State > 0, o => (o.State & State) == State)
                         .Where(isVip > 0, o => o.isVip == isVip)
                         .Where(CityID > 0, o => o.CityID == CityID)
                         .Where(ProjectID > 0, o => o.ProjectID == ProjectID)
                        .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BSNews", MenuID, ViewPage.CurrentLang.ID))
                        .Count().ToValue().ToInt(0);
%>


<script type="text/javascript">
    $(document).ready(function () {
        $('#<%=VSWID %>').smartpaginator({
            totalrecords: <%=Total%>, recordsperpage: <%=PageSize%>, length: 5, next: '>', prev: '<', first: '<<', last: '>>', theme: 'red', controlsalways: false, onchange: function (newPage) {
                paging_list_<%=VSWID %>(newPage - 1);
            }
        });
    });
</script>
<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="<%=link == string.Empty ? ViewPage.GetPageURL(page) :link%>" class="a-title"><%=title %> </a></h2>
            <p class="fr dangvip">
                <a href="<%=link == string.Empty ? ViewPage.GetPageURL(page) :link%>">Xem thêm >><%--<%=count %>--%></a>
            </p>
        </div>
    </div>

    <div class="bds-body">
        <div class="table all">
            <div class="bl_desc all">
                <ul>
                    <li class="tieude">Tiêu đề tin</li>
                    <li class="khuvuc">Khu vực</li>
                    <li class="date">Ngày đăng</li>
                </ul>
                <div id="loading"></div>
            </div>
            <div class="bl_result all">
                <ul id="bds-body_<%=VSWID %>">

                </ul>
                    <ul class="phantrang" id="<%=VSWID %>">
    </ul>
            </div>
        </div>
    </div>


    

</div>
<script type="text/javascript">
    function paging_list_<%=VSWID %>(page) {
        $('#loading').html('<img src="/Content/skins/images/ajax-loader.gif" />');

        var ranNum = Math.floor(Math.random() * 999999);
        sLink = '/Tools/GetBSNews.aspx?cmd=tintitle&MenuID=<%=MenuID%>&isVip=<%=isVip%>&CityID=<%=CityID%>&ProjectID=<%=ProjectID%>&State=<%=State%>&VSWID=<%=VSWID%>&PageSize=<%=PageSize%>&LangID=<%=ViewPage.CurrentLang.ID%>&Page=' + page + '&rnd=' + ranNum;
        AjaxRequest.get(
	        {
	            'url': sLink
	            , 'onSuccess': function (req) {
	                with (req.responseXML.getElementsByTagName('I').item(0)) {
	                    var content = getNodeValue(getElementsByTagName('Content'));
	                    
	                    $('#bds-body_<%=VSWID %>').html(content);
	                    $("#bds-body_<%=VSWID %>").hide().fadeIn(500, "swing");
	                    
	                    setTimeout(function () {
	                        $('#loading').html('');
	                    }, 200);


	                    this.screenshotPreview = function () {
	                        /* CONFIG */

	                        xOffset = 10;
	                        yOffset = 30;

	                        // these 2 variable determine popup's distance from the cursor
	                        // you might want to adjust to get the right result

	                        /* END CONFIG */
	                        $("a.screenshot").hover(function (e) {
	                            this.t = this.title;
	                            this.title = "";
	                            var c = (this.t != "") ? this.t : "";

	                            $("body").append("<div id='screenshot'><h3>" + c + "</h3><img src='" + this.rel + "' alt='" + c + "' width='80' class='info' /><p>" + this.rev + "</p></div>");
	                            $("#screenshot")
                                    .css("top", (e.pageY - xOffset) + "px")
                                    .css("left", (e.pageX + yOffset) + "px")
                                    .fadeIn("fast");
	                        },
                            function () {
                                this.title = this.t;
                                $("#screenshot").remove();
                            });
	                        $("a.screenshot").mousemove(function (e) {
	                            $("#screenshot")
                                    .css("top", (e.pageY - xOffset) + "px")
                                    .css("left", (e.pageX + yOffset) + "px");
	                        });
	                    };

	                    // starting the script on page load
	                    $(document).ready(function () {
	                        screenshotPreview();
	                    });
	                }
	            }
	            , 'onError': function (req) { }
	        }
        )

        }
        paging_list_<%=VSWID %>(0);
    $("#<%=VSWID %> li a").click(function () {
        $("#<%=VSWID %> li a").removeClass("active");
        $(this).addClass("active");
    });
</script>