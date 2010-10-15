class DatasetsController < ApplicationController

  def index
  end

  def new
    @dataset = Dataset.new
    @data_file = @dataset.data_files.build
    @field = @data_file.fields.build
  end

  def create
    @dataset = Dataset.new(params[:dataset])
    if @dataset.save
      redirect_to @dataset
    else
      render :action => "new"
    end
  end

  def show
    @dataset = Dataset.find(params[:id])
  end

  def edit
    @dataset = Dataset.find(params[:id])
  end

  def update
    @dataset = Dataset.find(params[:id])
    if @dataset.update_attributes(params[:dataset])
      flash[:notice] = "Updated Dataset Successfully"
      redirect_to @dataset
    else
      render :action => "edit"
    end
  end

  def destroy
  end

end
