$(document).ready(function() {
  
$('.remove_field_button').live('click',function() {
    remove_field_block(this);
    return false;
});

$('.add_field_button').live('click',function() {
    add_field_block(this);
    return false;
});

$('.remove_file_button').live('click',function() {
    remove_file_block(this);
    return false;
});

$('.add_file_button').live('click',function() {
    add_file_block(this);
    return false;
});

$('.swap_up').live('click',function() {
    swap_block_up(this);
    return false;
});

});

function remove_file_block(link) {
  var parent = $(link).parent().parent();
  $(link).closest(".data_file_flowbox").fadeOut('fast', function(){$(this).remove();});
  renumerate_data_files(parent);
}

function add_file_block(link) {
    var num_data_files = $(link).parent().find(".data_files .data_file_flowbox").length;
    $(link).parent().find(".data_files").append($("#data_file_template").clone().html().replace(/new_data_file/g,num_data_files));
}

function remove_field_block(link) {
  var parent = $(link).parent().parent();
  $(link).closest(".field_flowbox").fadeOut('fast', function(){$(this).remove();});
  renumerate_fields(parent);
}

function add_field_block(link) {
    var num_fields = $(link).parent().find(".fields .field_flowbox").length;
    $(link).parent().find(".fields").append($("#field_template").clone().html().replace(/new_field/g,num_fields));
}

function swap_block_up(link) {
 if($(link).closest(".field_flowbox").prev(".field_flowbox").length >= 2) {
  $(link).closest(".field_flowbox").append($(link).prev(".field_flowbox"));
  renumerate_fields(link);
 }
}

function swap_block_down(link) {
 if($(link).closest(".field_flowbox").prev(".field_flowbox").length >= 2) {
  $(link).closest(".field_flowbox").append($(link).prev(".field_flowbox"));
  renumerate_fields(link);
 }
}

function renumerate_fields(fields) {
var index = 0;
$.each($(fields).find('.field_flowbox'), function(){
//    $(this).replaceWith($(this).html().replace(/[0-9]*/g,index++));
});
}
