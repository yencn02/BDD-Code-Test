class FeaturesController < ApplicationController
  def index
    @features = Feature.all
  end
  def new
    @feature = Feature.new
  end
  def create
    feature = params[:feature]
    scenario = params[:scenario]
    result = Feature.create_feature(feature, scenario)
    if result == true
      flash[:notice] = 'Feature was successfully created.'
      redirect_to(features_url)
    else
      render :action => "new"
    end
  end

  def show
    @feature = Feature.find(params[:id])
  end

end
