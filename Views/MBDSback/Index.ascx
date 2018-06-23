<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>


<% 
    var listitem = ViewBag.Data as List<ModBDSbackEntity>;
    var model = ViewBag.Model as MBDSbackModel;
    string urlPage = "";
    
    var item = ViewBag.Data as ModBDSbackEntity ?? new ModBDSbackEntity();

%>

<form name="BDSback_form" method="post">
    <div class="box-bds all">
        <div class="title all">
            <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
            <div class="dv-ct-tabs">
                <h2><a href="javascript:void(0);" class="a-title"><%=ViewPage.CurrentPage.Name %></a> </h2>
            </div>
        </div>
        <div class="bds-body">
            <ul class="contact_top">
                {RS:BDSPOST}
            </ul>
            <ul class="contact_bottom dangky fl ">
                <li>
                    <label>Nội dung<span class="red">*</span></label>
                    <textarea name="Content" rows="5" cols="5"><%=item.Content %></textarea>
                </li>
                <li>
                    <label>Họ và tên:<span class="red">*</span></label>
                    <input type="text" value="<%=item.Name %>" name="Name" placeholder="Nhập đầy đủ họ và tên" />
                </li>
                <li>
                    <label>Địa chỉ :<span class="red">*</span></label>
                    <input type="text" value="<%=item.Address %>" name="Address"  />
                </li>
                <li>
                    <label>Số điện thoại:<span class="red">*</span></label>
                    <input type="text" value="<%=item.Phone %>" name="Phone" />
                </li>
                 <li class="captcha-content">
                    <label>Mã xác thực<span class="red">*</span></label>
                    <input type="text" autocomplete="off" class="security w150px" name="ValidCode" id="ValidCode" value="" />
                    <img src="/Tools/Security.aspx" id="imgValidCode" alt="ValidCode" />
                    <a href="javascript:void(0)" class="recaptcha" onclick="change_captcha();" rel="nofollow">Đổi mã khác</a>
                </li>
                <li>
                    <label></label>
                    <input type="submit" class="button-login" onclick="document.BDSback_form.submit();" value="Gửi yêu cầu">
                    <input type="reset" class="button-login" onclick="document.BDSback_form.reset();" value="Nhập lại">

                    <input type="hidden" name="_vsw_action[AddPOST]" />
                    <input type="submit" name="_vsw_action[AddPOST]" style="display: none;" />
                </li>
            </ul>
        </div>
        <div class="box-bds all">
                            <div class="title all">
                                <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
                                <div class="dv-ct-tabs">
                                    <h2><a href="Javascript:void(0);" class="a-title">TOP ĐẶT MUA MỚI NHẤT</a></h2>
                                </div>
                            </div>
                            <div class="bds-body">
                                <ul class="content_paging2">
                                     <%for (int i = 0; listitem != null && i < listitem.Count; i++)
                  {%>
                                    <li><%=listitem[i].Content %>
                                            <div class="text_paging">
                                                <div class="row1"><span class="date"><%=listitem[i].Time %></span></div>
                                            </div>
                                    </li>
                                    <%} %>
                                </ul>
                                <ul class="phantrang">
                                    <%= GetPagination(urlPage, model.Page, model.PageSize, model.TotalRecord)%>
                                </ul>
                            </div>
                        </div>
    </div>
</form>


