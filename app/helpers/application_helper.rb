module ApplicationHelper

  def link_to_add_fields(name,form)
    fields = form.fields_for :fields,Field.new do |builder|
               render "field", :f => builder
             end
    link_to_function(name,"add_block(this,\'#{escape_javascript(fields)}\')")
  end

end
