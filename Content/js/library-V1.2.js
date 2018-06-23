/*tab*/
var _type = 1;
function changeTab(type, boxId, aId, count, classBox, classA) {
    _type = type;
    document.getElementById(boxId + type).style.display = "";
    document.getElementById(aId + type).className = classA;

    for (var i = 1; i <= count; i++) {
        if (i != type) {
            document.getElementById(boxId + i).style.display = "none";
            document.getElementById(aId + i).className = classBox;
        }
    }
}
