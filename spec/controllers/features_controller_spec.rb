require 'spec_helper'

describe FeaturesController do
  context "#index" do
    it "should provide an index method that returns all features to the view" do
      @features = Array.new(3) { Factory(:feature) }
      Feature.stub!(:find).and_return(@features)
      get :index
      assigns[:features].should == @features
    end
    it "should provide an index method that returns an empty array if there are no features" do
      get :index
      assigns[:features].empty?.should be(true)
    end
    it "should render the index template" do
      get :index
      response.should render_template(:index)
    end
  end

  context "#new" do 
    it "assigns a new feature as @feature" do
      mock_feature = mock("A feature")
      Feature.stub(:new).and_return(mock_feature)
      get :new
      assigns[:feature].should equal(mock_feature)
    end
    it "should render the new template" do
      get :new
      response.should render_template(:new)
    end
  end

  describe "GET show" do
    it "it should exist a feature with an ID" do
      feature = mock_model(Feature)
      Feature.stub(:find).with("1").and_return(feature)
      get :show, :id => "1"
      assigns[:feature].should equal(feature)
      response.should render_template(:show)
    end
  end


  describe "POST create" do


  end

end
