require 'spec_helper'

describe ScenariosController do

  def mock_scenario(stubs={})
    @mock_scenario ||= mock_model(Scenario, stubs)
  end

  describe "GET new" do
    it "assigns a new scenario as @scenario" do
      feature = mock_model(Feature)
      Feature.stub(:find).with("1").and_return(feature)
      Scenario.stub(:new).and_return(mock_scenario)
      get :new, :feature_id => "1"
      assigns[:scenario].should equal(mock_scenario)
      assigns[:feature].should equal(feature)
    end
  end

  describe "POST create" do
    it "call create_feature method and return true" do 
      feature = {"title" => "Test", "id" => 1}
      scenario = {"title" => "Test", "given_block" => "Test", "when_block" => "Test", "then_block" => "Test"}
      feature_obj = mock_model(Feature,{:id => 1})
      result = [true, feature_obj]
      Scenario.should_receive(:create_scenario).with(feature, scenario).and_return(result)
      post :create, :feature => feature, :scenario => scenario
      flash[:notice].should == "Scenario was successfully created."
      response.should redirect_to("/features/1")
    end
    it "call create_feature method and return false" do 
      feature = {}
      scenario = {}
      feature_obj = mock("Something")
      result = [false, feature_obj]
      Scenario.should_receive(:create_scenario).with(feature, scenario).and_return(result)
      post :create, :feature => feature, :scenario => scenario
      response.should render_template("new")
    end

  end

end
