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

  $('.swap_down').live('click',function() {
    swap_block_down(this);
    return false;
  });

  $('input#dataset_submit').click(function() {
    renumerate_fields(this);
  });  

});

function remove_file_block(link) {
  var parent = $(link).parent().parent();
  $(link).prev("input:hidden").val(1);
  $(link).closest(".data_file_flowbox").fadeOut('fast', function(){$(this).remove();});
}

function add_file_block(link) {
  var num_data_files = $(link).parent().find(".data_files .data_file_flowbox").length;
  $(link).parent().find(".data_files").append($("#data_file_template").clone().html().replace(/new_data_file/g,new Date().getTime()));
}

function remove_field_block(link) {
  $(link).prev("input:hidden").val("true");
  $(link).closest(".field_flowbox").fadeOut('fast', function(){renumerate_fields(link);});
}

function add_field_block(link) {
  var num_fields = $(link).parent().find(".fields .field_flowbox").length;
  $(link).parent().find(".fields").append($(link).parent().children(".fields").children("#field_template").clone().html().replace(/new_field/g,new Date().getTime()));
}

function swap_block_up(link) {
  if($(link).closest(".fields .field_flowbox").prev(".field_flowbox:visible").length > 0) {
  var block = $(link).closest(".fields .field_flowbox");   
    $(link).closest(".fields .field_flowbox").prev().before(block);
   block.animate({backgroundColor: '#FFFFFF'}, 200).delay(100).animate({backgroundColor: '#DCDCDC'}, 200);
  }
}

function swap_block_down(link) {
  if($(link).closest(".fields .field_flowbox").next(".field_flowbox:visible").length > 0) {  
    var block = $(link).closest(".fields .field_flowbox");   
    // $(link).closest(".fields .field_flowbox").next().after(block);
    //  block.animate({backgroundColor: '#FFFFFF'}, 200).animate({backgroundColor: '#DCDCDC'}, 200);

  }
}

function renumerate_fields(link) {
  var fields = $(link).closest(".fields");
  var index = 0;
  $.each($(fields).find('.field_flowbox:visible'), function(){
    $(this).find("[id*=column]").val(index++);
  });
}
