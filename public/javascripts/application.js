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
  $(link).siblings("[id*=destroy]").val("true");  
  $(link).closest(".data_file_flowbox").fadeOut('fast', function(){});
}

function add_file_block(link) {
  $(link).parent().find(".data_files").append($("#data_file_template").clone().html().replace(/new_data_file/g,new Date().getTime()));
}

function remove_field_block(link) {
  $(link).parent().siblings("[id*=destroy]").val("true");
  $(link).closest(".field_flowbox").fadeOut('fast', function(){});
}

function add_field_block(link) {
  $(link).parent().find(".fields").append($(link).parent().children(".fields").children("#field_template").clone().html().replace(/new_field/g,new Date().getTime()));
}

function swap_block_up(link) {
  if($(link).closest(".field_flowbox:visible").prevAll(".field_flowbox:visible").length > 0) {
    var block = $(link).closest(".field_flowbox:visible");   
    $(link).closest(".field_flowbox:visible").prevAll(".field_flowbox:visible").first().before(block);
    block.animate({backgroundColor: '#DCDCDC'}, 200).delay(100).animate({backgroundColor: '#F2F4F5'}, 200);
  }
}

function swap_block_down(link) {
  if($(link).closest(".field_flowbox:visible").nextAll(".field_flowbox:visible").length > 0) {
    var block = $(link).closest(".field_flowbox:visible");   
    $(link).closest(".field_flowbox:visible").nextAll(".field_flowbox:visible").first().after(block);
    block.animate({backgroundColor: '#DCDCDC'}, 200).delay(100).animate({backgroundColor: '#F2F4F5'}, 200);
  }
}

function renumerate_fields(link) {
  //reset column attributes on save for fields within each data file
  $.each($(".flowbox .data_files .data_file_flowbox:visible"), function(){
    var col_index = 1;    
    $.each($(this).find(".fields .field_flowbox:visible"), function(){
      $(this).find("[id*=column]").val(col_index++);
    });
  });
}
