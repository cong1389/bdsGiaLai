<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<%
    var item = ViewBag.Data as ModWebUserChargeEntity ?? new ModWebUserChargeEntity();
%>

<link href="/Content/skins/baokim.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Content/skins/baokim/baokim.js"></script>

<div class="box-bds all">
    <div class="title all">
        <div class="dv-ico"><i class="ico-sty icon-nhadat"></i></div>
        <div class="dv-ct-tabs">
            <h2><a href="javascrip:voi(0);" class="a-title">Nạp Tiền Bằng Thẻ Điện Thoại</a></h2>
        </div>
    </div>
    <div class="bds-body">
        <div class="register fl">
            <form method="post" name="charge_form">
             <ul class="dangky fl">
                    <li>
                        <p style="font-style: italic;">Quý khách vui lòng nhập đủ thông tin:  </p>
                    </li>
                    <li>
                        <label>Số serial thẻ cào <span class="red">(*)</span></label>
                         <input class="frm-txt" type="text" name="Serial" value="<%=item.Serial %>" placeholder="Số serial thẻ cào" />
                    </li>
                    <li>
                        <label>Mã thẻ cào <span class="red">(*)</span></label>
                         <input class="frm-txt" type="text" name="Code" value="<%=item.Code %>" placeholder="Mã thẻ cào" />

                    </li>
                    <li>
                        <label class="fl w150px">Điện thoại liên hệ <span class="red">(*)</span></label>
                        <div class="ddlgr">
                        <select name="Operator" id="Operator" class="ddl w150px">
                            <option value="" selected="selected">chọn nhà mạng</option>
                            <option value="Viettel" <%if (item.Operator == "Viettel") {%>selected="selected"<%} %>>Viettel</option>
                            <option value="VinaPhone" <%if (item.Operator == "VinaPhone"){%>selected="selected"<%} %>>VinaPhone</option>
                            <option value="Mobiphone" <%if (item.Operator == "Mobiphone"){%>selected="selected"<%} %>>Mobiphone</option>
                            <option value="Gate" <%if (item.Operator == "Gate"){%>selected="selected"<%} %>>Pay Gate</option>
                            <option value="VTC" <%if (item.Operator == "VTC"){%>selected="selected"<%} %>>VTC Card</option>
                        </select>
                        </div>
                    </li>
                     <li>
                         <label></label>
                        <input type="submit" class="btn-s01 h35" id="gh-btn" value="Nạp thẻ" name="_vsw_action[ChargeFormPOST]" />
                        <input type="reset" class="btn-s01 h35" id="Reset1" value="Nhập lại" />

                    </li>
                </ul>

            </form>
        </div>
    </div>
</div>
