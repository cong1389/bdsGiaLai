<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>


<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var item = ViewBag.Data as ModBSNewsEntity ?? new ModBSNewsEntity();
%>


<ul class="choose_cat_post">
    <li class="title_choose_cat"><a>Chọn chuyên mục</a></li>

    <%for (int i = 1; listItem != null && i < listItem.Count - 3; i++)
      {
          var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
    %>
    <li class="icon-menu choose_cat"><a href="javascript:void(0)"><%=listItem[i].Name %></a>
        <%if (listChildItem != null)
          {%>
        <ul class="step_2">
            <li class="title_step_2"><a>Chọn danh mục</a></li>
            <ul class="step_3">
                <%for (int j = 0; j < listChildItem.Count; j++)
                  {
                      var listChildItem1 = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID); %>
                <li class="choose_sub_cat" <%if (listChildItem1 != null)
                                             {%>style="width:100%" <%}%>><a class="clicka" href="javascript:void(0)" <%if (listChildItem1 == null)
                                                                                                                                                   {%> onclick="myFunction(this.text ,'<%=listChildItem[j].MenuID%>','<%=listItem[i].Name %>','<%=listItem[i].MenuID %>','<%=listItem[i].DVPriceID %>');return false;" <%} %>><%=listChildItem[j].Name%></a>
                    <%if (listChildItem1 != null)
                      {%>
                    <%for (int k = 0; k < listChildItem1.Count; k++)
                      {%><li class="choose_sub_cat2"><a class="clicka" href="javascript:void(0)" onclick="myFunction(this.text ,'<%=listChildItem1[k].MenuID%>','<%=listItem[i].Name %>','<%=listItem[i].MenuID %>','<%=listItem[i].DVPriceID %>');return false;"><%=listChildItem1[k].Name%></a></li>
                    <%}%> <%}
                    %>
                </li>
                <%}%>
            </ul>
        </ul>
        <%} %>
    </li>
    <%} %>
</ul>
<script>

    function myFunction(text, MenuID, ParName, TypeID, id) {

        document.getElementById("text1").innerHTML = ParName;
        document.getElementById("text2").innerHTML = " >> " + text;
        $('.step_2').css("display", "block");
        $('.all_info_item_new').css("display", "block");
        $('.choose_menu').css("display", "none");

        document.getElementById("TypeID").value = TypeID;
        document.getElementById("MenuID").value = MenuID;

        if (id == 1) {
            document.getElementById("DVPriceID").innerHTML = '<select name="DVPriceID" class="ddl" id="DVPriceID" name="DVPriceID" onchange="sum()" ><option value="0">- Thỏa thuận -</option><%=Utils.ShowDDLMenuByType2("DVPrice2", ViewPage.CurrentLang.ID, item.DVPriceID) %></select>';
        } else if (id == -1) {
            document.getElementById("DVPriceID").innerHTML = '<select  name="DVPriceID" class="ddl" id="DVPriceID" name="DVPriceID" onchange="sum()" ><option value="0">- Thỏa thuận -</option><%=Utils.ShowDDLMenuByType2("DVPrice", ViewPage.CurrentLang.ID, item.DVPriceID) %></select>';
        }
        else {
            document.getElementById("DVPriceID").innerHTML = '<select name="DVPriceID" class="ddl" id="DVPriceID" name="DVPriceID" onchange="sum()" ><option value="0">- Thỏa thuận -</option><%=Utils.ShowDDLMenuByType2("DVPrice", ViewPage.CurrentLang.ID, item.DVPriceID) %><%=Utils.ShowDDLMenuByType2("DVPrice2", ViewPage.CurrentLang.ID, item.DVPriceID) %></select>';
        }

    GetPrice();

}
$(document).ready(function () {
    $('.clicka').click(function () {
        $('.step_2').css("display", "none");
    });
    $('.choose_cat').hover(function () {
        $('.step_2').css("display", "");
    });
});
$(document).ready(function () {
  var tyid =  document.getElementById("TypeID").value;
  if (tyid > 0 || tyid != null) {
      $('.choose_menu').css("display", "none !important");
      $('.all_info_item_new').css("display", "block !important");
  } else {
      $('.choose_menu').css("display", "block !important");
      $('.all_info_item_new').css("display", "none !important");
  }
            
});

</script>
