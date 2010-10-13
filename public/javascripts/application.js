function remove_block(link) {
  $(link).closest(".field_flowbox").fadeOut('fast', function(){$(this).remove();});
}

function add_block(link,content) {
  $(link).parent().find(".fields").append(content);
}

function swap_block_up(link) {
  $(link).closest(".field_flowbox").append($(link).previous(".flowbox"));
}
