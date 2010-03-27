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

  end

end
