<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>;
   var listItem2 = ViewBag.Data2 as List<ModAdvEntity>;
   var title = ViewBag.Title as List<ModAdvEntity>;
   var title2 = ViewBag.Title2 as List<ModAdvEntity>;
   var MenuID = ViewBag.MenuID as List<ModAdvEntity>;
   var MenuID2 = ViewBag.MenuID2 as List<ModAdvEntity>;
   if (listItem2 == null || listItem == null) return;
    
%>


<style type="text/css">
    .c {
        clear: both;
    }
    /*#wrapper { margin: 0 auto; padding: 0 40px 60px 40px; width: 206px; height:293px;}*/
</style>
<script type="text/javascript" src="/Content/utils/sliderman/js/sliderman.1.3.8.js"></script>
<link rel="stylesheet" type="text/css" href="/Content/utils/sliderman/css/sliderman.css" />
<%-- slider 1 --%>

<div class="qc-main all">
    <div class="qc-left fl">
        <div id="slider_container_2">
            <div id="SliderName_2" class="SliderName_2">
                <%for (int i = 0; listItem != null && i < listItem.Count; i++)
                  {%> <a href="<%=ViewPage.GetURL(listItem[i].URL)%>" class="boderIMG">
          <%= Utils.GetCodeAdv(listItem[i])%></a>

                <div class="SliderName_2Description">QC: <strong><%=listItem[i].Name%></strong></div>
                <%} %>
            </div>
            <div class="c"></div>
        </div>
        <div class="control-slide">
                <div id="SliderNameNavigation_2"></div>
                <div class="c"></div>
            </div>
        <script type="text/javascript">
            effectsDemo2 = 'rain,stairs,fade';
            var demoSlider_2 = Sliderman.slider({
                container: 'SliderName_2', width: 206, height: 293, effects: effectsDemo2,
                display: {
                    autoplay:7000,
                    loading: { background: '#000000', opacity: 0.5, image: '/Content/utils/sliderman/img/loading.gif' },
                    buttons: { hide: true, opacity: 1, prev: { className: 'SliderNamePrev_2', label: '' }, next: { className: 'SliderNameNext_2', label: '' } },
                    description: { hide: true, background: '#000000', opacity: 0.4, height: 100, position: 'top' },
                    navigation: { container: 'SliderNameNavigation_2', label: '<img src="/Content/utils/sliderman/img/clear.gif" />' }
                }
            });
        </script>
    </div>



    <%-- end slider 1 --%>
    <%-- slider 2 --%>


    <div class="qc-right fr">
        <div class="slide">
            <div id="slider_container_3">
                <div id="SliderName_3" class="SliderName_3">
                    <%for (int j = 0; listItem2 != null && j < listItem2.Count; j++)
                      {%> <a href="<%=ViewPage.GetURL(listItem2[j].URL)%>" class="boderIMG">
          <%= Utils.GetCodeAdv(listItem2[j])%></a>

                    <div class="SliderName_3Description">QC: <strong><%=listItem2[j].Name%></strong></div>
                    <%} %>
                </div>
                <div class="c"></div>
            </div>

        </div>
        <div class="control-slide">
            <div id="SliderNameNavigation_3"></div>
            <div class="c"></div>
        </div>
        <script type="text/javascript">
            effectsDemo2 = 'rain,stairs,fade';
            var demoSlider_2 = Sliderman.slider({
                container: 'SliderName_3', width: 480, height: 293, effects: effectsDemo2,
                display: {
                    autoplay: 5000,
                    loading: { background: '#000000', opacity: 0.5, image: '/Content/utils/sliderman/img/loading.gif' },
                    buttons: { hide: true, opacity: 1, prev: { className: 'SliderNamePrev_3', label: '' }, next: { className: 'SliderNameNext_3', label: '' } },
                    description: { hide: true, background: '#000000', opacity: 0.4, height: 100, position: 'top' },
                    navigation: { container: 'SliderNameNavigation_3', label: '<img src="/Content/utils/sliderman/img/clear.gif" />' }
                }
            });
        </script>
    </div>



















    <%-- end slider 2 --%>
</div>





<%--


<script type="text/javascript">
    effectsDemo2 = 'rain,stairs,fade';
    var demoSlider_2 = Sliderman.slider({
        container: 'SliderName_2', width: 700, height: 450, effects: effectsDemo2,
        display: {
            autoplay: 3000,
            loading: { background: '#000000', opacity: 0.5, image: 'img/loading.gif' },
            buttons: { hide: true, opacity: 1, prev: { className: 'SliderNamePrev_2', label: '' }, next: { className: 'SliderNameNext_2', label: '' } },
            description: { hide: true, background: '#000000', opacity: 0.4, height: 50, position: 'bottom' },
            navigation: { container: 'SliderNameNavigation_2', label: '<img src="img/clear.gif" />' }
        }
    });
				</script>
    </div>--%>