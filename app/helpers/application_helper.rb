# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_to_add_fields(name,form)
    fields = form.fields_for(:field, Field.new, :child_index => "new_field") do |builder|
      render "field", :f => builder
    end
    link_to_function(name,"add_block(this,\'#{escape_javascript(fields)}\')")
  end
end
