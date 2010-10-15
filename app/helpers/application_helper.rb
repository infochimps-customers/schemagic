module ApplicationHelper

  def gen_field_template(form)
    form.fields_for :fields,Field.new, :child_index => "new_field" do |builder|
      render "field", :f => builder
    end
  end

  def gen_data_file_template(form)
    form.fields_for :data_files,DataFile.new, :child_index => "new_data_file" do |builder|
      render "data_file", :f => builder
    end
  end

end
