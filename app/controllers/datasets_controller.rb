class DatasetsController < ApplicationController

  def new
    @dataset = Dataset.new
    @data_file = @dataset.data_files.build
    @field = @data_file.fields.build
  end

  def create
    @dataset = Dataset.new(params[:dataset])
    @dataset.generate_uuid!
    if @dataset.save
      redirect_to dataset_path(@dataset.uuid)
    else
      render :action => "new"
    end
  end

  def mail
    @dataset = Dataset.find_by_uuid(params[:id])
    Emailer.deliver_schema(@dataset)
    flash[:notice] = "Schema delivered successfully"
    redirect_to dataset_path(@dataset.uuid)
  end

  def show
    @dataset = (Dataset.find_by_uuid(params[:id]) or raise ActiveRecord::RecordNotFound.new)
    respond_to do |format|
      format.html { render }
      format.xml   { render :xml  => @dataset.schema }
      format.json  { render :json => @dataset.schema }
      format.yaml  { render :yaml => @dataset.schema }
    end
  end

  def edit
    @dataset = (Dataset.find_by_uuid(params[:id])or raise ActiveRecord::RecordNotFound.new)
  end

  def update
    @dataset = Dataset.find_by_uuid(params[:id])
    if @dataset.update_attributes(params[:dataset])
      flash[:notice] = "Updated Dataset Successfully"
      redirect_to dataset_path(@dataset.uuid)
    else
      render :action => "edit"
    end
  end


end
