module ApplicationHelper

  def gen_field_template(form)
    @new_field = Field.new
    form.fields_for :fields,@new_field, :child_index => "new_field" do |builder|
      render :partial => "field", :locals => { :f => builder, :field => @new_field}
    end
  end

  def gen_data_file_template(form)
    @new_data_file = DataFile.new
    form.fields_for :data_files,@new_data_file, :child_index => "new_data_file" do |builder|
      render :partial => "data_file", :locals => { :f => builder, :data_file => @new_data_file}
    end
  end

end
