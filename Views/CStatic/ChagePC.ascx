<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<div class="view_pc">
    <form method="post" name="state_form" action="{ActionForm}">
        <a href="javascript:void(0)" onclick="document.state_form.submit()" rel="nofollow" title="Phiên bản <%=Utils.fBrowserIsMobile() == true ? "PC" : "Mobile" %>PC "></a>
        <input type="hidden" name="_vsw_action[CStatic-ChangeState-MobileBottom]" />
        <input type="submit" name="_vsw_action[CStatic-ChangeState-MobileBottom]" style="display: none" />
    </form>
</div>
