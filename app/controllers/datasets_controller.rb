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
  end

  def update
  end

  def destroy
  end

end
