$(function() {
    $("#imageListId").sortable({
    update: function(event, ui) {
    var isAdmin = false; // Здесь нужно проверить, является ли пользователь администратором
    if (isAdmin) {
    getIdsOfImages();
    } else {
    alert("У вас нет прав для изменения порядка изображений.");
    }
    }
    });
    });
    
    function getIdsOfImages() {
    var values = [];
    $('.listitemClass').each(function(index) {
    values.push($(this).attr("id").replace("imageNo", ""));
    });
    $('#outputvalues').val(values);
    }