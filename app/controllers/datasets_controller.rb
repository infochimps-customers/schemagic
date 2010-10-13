class DatasetsController < ApplicationController

  def index
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.new(params[:dataset])
    if @dataset.save
      redirect_to @dataset
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
