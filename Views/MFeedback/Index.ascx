<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModFeedbackEntity ?? new ModFeedbackEntity();
    var BSNews = ViewBag.BSNews as ModBSNewsEntity;
    if (BSNews != null) item.Title = "Cần tư vấn tin rao vặt: " + BSNews.Name;
%>

<%--<div class="content-duoi">
    <div class="title_with_bg">
        <p><%=ViewPage.CurrentPage.Name %></p>
    </div>
</div>

<form name="feedback_form" method="post">
    <p class="title_contact">Gửi thông tin liên hệ</p>
    <div class="fieldwrapper">
        <label class="styled">Họ tên <span style="color: red">(*)</span></label>
        <div class="thefield">
            <input type="text" value="<%=item.Name %>" name="Name"  />
        </div>
    </div>
    <div class="fieldwrapper">
        <label class="styled">Email <span style="color: red">(*)</span></label>
        <div class="thefield">
            <input type="text" value="<%=item.Email %>" name="Email"  />
        </div>
    </div>
    <div class="fieldwrapper">
        <label class="styled">Điện thoại <span style="color: red">(*)</span></label>
        <div class="thefield">
            <input type="text" value="<%=item.Phone %>" name="Phone"  />
        </div>
    </div>
    <div class="fieldwrapper">
        <label class="styled">Di động <span style="color: red">(*)</span></label>
        <div class="thefield">
            <input type="text" value="<%=item.Mobile %>" name="Mobile"  />
        </div>
    </div>
    <div class="fieldwrapper">
        <label class="styled">Tiêu đề <span style="color: red">(*)</span></label>
        <div class="thefield">
            <input type="text" value="<%=item.Title %>" name="Title"  />
        </div>
    </div>
    <div class="fieldwrapper">
        <label class="styled">Nội dung <span style="color: red">(*)</span></label>
        <div class="thefield">
            <textarea name="Content" rows="" cols=""><%=item.Content %></textarea>
        </div>
    </div>
    <div class="fieldwrapper">
        <label class="styled">&nbsp;</label>
        <div class="thefield">
            <div class="lienhe">
                <a href="javascript:void(0)" onclick="document.feedback_form.submit();">Gửi liên hệ</a>
                <a href="javascript:void(0)" onclick="document.feedback_form.reset();">Nhập lại</a>
            </div>

            <input type="hidden" name="_vsw_action[AddPOST]" />
            <input type="submit" name="_vsw_action[AddPOST]" style="display:none;" />
        </div>
    </div>
</form>--%>
<%-- ------------------------------------------------------------------ --%>


<form name="feedback_form" method="post">
    <div class="box-bds all">
        <div class="title all">
            <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
            <div class="dv-ct-tabs">
                <h2><a href="" class="a-title"><%=ViewPage.CurrentPage.Name %></a> </h2>
            </div>
        </div>
        <div class="bds-body">
            <ul class="contact_top">
           {RS:Web_Feedback}
            </ul>
            <ul class="contact_bottom dangky fl ">
                <li>
                    <label>Tiêu đề<span class="red">*</span></label>
                    <input type="text" value="<%=item.Title %>" name="Title" />
                </li>
                <li>
                    <label>Nội dung</label>
                    <textarea name="Content" rows="" cols=""><%=item.Content %></textarea>
                </li>
                <li>
                    <label>Họ và tên:<span class="red">*</span></label>
                    <input type="text" value="<%=item.Name %>" name="Name" placeholder="Nhập đầy đủ họ và tên" />
                </li>
                <li>
                    <label>Địa chỉ email:</label>
                    <input type="text" value="<%=item.Email %>" name="Email" placeholder="abc@gmail.com" />
                </li>
                <li>
                    <label>Số điện thoại:<span class="red">*</span></label>
                    <input type="text" value="<%=item.Mobile %>" name="Mobile" />
                </li>
                <li>
                    <label></label>
                    <input type="submit" class="button-login" onclick="document.feedback_form.submit();" value="Gửi liên hệ">
                    <input type="reset" class="button-login" onclick="document.feedback_form.reset();" value="Nhập lại">

                    <input type="hidden" name="_vsw_action[AddPOST]" />
                    <input type="submit" name="_vsw_action[AddPOST]" style="display: none;" />
                </li>
            </ul>
        </div>
    </div>
</form>
