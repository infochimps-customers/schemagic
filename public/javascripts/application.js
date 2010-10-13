function remove_block(link) {
  $(link).closest(".field_flowbox").fadeOut('slow', function(){});
}

function add_block(link,content) {
  $(link).closest("form").append(content);
}

function swap_block_up(link) {
  $(link).closest(".field_flowbox").append($(link).previous(".flowbox"));
}



