class ScenariosController < ApplicationController

  def new
    feature_id = params[:feature_id]
    @feature = Feature.find(feature_id)
    @scenario = Scenario.new
  end
  def create
    feature = params[:feature]
    scenario = params[:scenario]
    result, feature = Scenario.create_scenario(feature, scenario)
    if result == true
      flash[:notice] = 'Scenario was successfully created.'
      redirect_to(feature)
    else
      render :action => "new"
    end
  end
end
