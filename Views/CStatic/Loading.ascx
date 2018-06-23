<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<div style="position: absolute; left: 50%; top: 50%; z-index: 1000; margin-left: -58.5px; margin-top: -58.5px; display: none;" class="aw-LoadingStatus" id="initialLoading" aria-hidden="true">
    <table>
        <tbody>
            <tr>
                <td><img src=""></td>
                <td>Đang tải...</td>
            </tr>
        </tbody>
    </table>
</div>

<script type="text/javascript">var awLoading=document.getElementById("initialLoading");awLoading.style.marginLeft=(-awLoading.offsetWidth/2)+"px";awLoading.style.marginTop=(-awLoading.offsetWidth/2)+"px";window.setTimeout(function(){awLoading.style.display="none"},60000);</script>

<style type="text/css">
    .aw-LoadingStatus {
      background-color: #FFFFFF;
      border: 1px solid #999999;
      color: #000000;
      font-size: 14px;
      font-weight: bold;
      padding: 6px;
    }
</style>