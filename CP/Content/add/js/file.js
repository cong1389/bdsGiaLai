//kich co
function size_add() {

    var arrSizes = new Array();
    
    var sizes = document.getElementsByName('ArrSize');
    for (var i = 0; i < sizes.length; i++)
        if (sizes[i].checked && arrSizes.indexOf(sizes[i].value) < 0)
            arrSizes.push(sizes[i].value);

    var v = '';
    for (var i = 0; i < arrSizes.length; i++) {
        v += (v == '' ? '' : '|') + arrSizes[i];
    }
    document.getElementById('Sizes').value = v;
}


//hinh anh
display();

function add() {
    var file = document.getElementById('add_file');

    if (file.value == '' || file.value == 'Click vào đây để chọn file') {
        alert('Bạn chưa chọn file.');
        file.value == 'Click vào đây để chọn file';
        return;
    }

    arrFiles.push(file.value);
    display();

    file.value = 'Click vào đây để chọn file';
}
function add_v1() {
    var file = document.getElementById('add_file');

    for (var i = 0; i < arrFiles.length; i++) {
        if (arrFiles[i] == file.value) {
            alert('File đã tồn tại!');
            return;
        }
    }

    if (file.value == '' || file.value == 'Click vào đây để chọn file') {
        alert('Bạn chưa chọn file.');
        file.value == 'Click vào đây để chọn file';
        return;
    }

    arrFiles.push(file.value);
    display();

    file.value = 'Click vào đây để chọn file';
}

function add_v2(fileName) {

    for (var i = 0; i < arrFiles.length; i++) {
        if (arrFiles[i] == fileName) {
            alert('File đã tồn tại!');
            return;
        }
    }

    arrFiles.push(fileName);
    display();
}

function display() {

    var list_file = document.getElementById('list_file');
    var s = '';
    var v = '';
    s += '<table width="100%" cellpadding="0" cellspacing="0">';

    for (var i = 0; i < arrFiles.length; i++) {
        v += (v == '' ? '' : '|') + arrFiles[i];

        s += '<tr>';
        s += '<td>';
        s += '<a title="Xóa ảnh" href="javascript:file_delete(' + i + ');"><img src="/CP/Content/add/img/dash_remove_icon.png" /></a>';
        s += '</td>';
        s += '<td>';
        s += '<img src="' + arrFiles[i].replace("~/", "/") + '" width="100px" height="80px" />';
        s += '</td>';
        s += '</tr>';
    }
    list_file.innerHTML = s;

    document.getElementById('Files').value = v;
}

function file_delete(index) {
    if (confirm('Bạn chắc muốn xóa không ?')) {
        arrFiles.splice(index, 1);
        display();
    }
}

function formatDollar(value) {
    return value.split("").reverse().reduce(function (acc, value, i, orig) {
        return value + (i && !(i % 3) ? "." : "") + acc;
    }, "");
}

function checkNumber(numberId, errorId) {
    $(document).ready(function () {
        var keypress = $(numberId).keypress(function (e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                $(errorId).html("Chỉ nhập số!.").show().fadeOut("slow");
                return false;
            }
            return false;
        });
    });
}