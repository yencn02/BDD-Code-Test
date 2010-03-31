require 'spec_helper'

describe Scenario do
  before(:each) do
    @valid_attributes = {
      :title => "Scenario Title",
      :given_block => "Given Block",
      :when_block => "When Block",
      :then_block => "Then Block",
      :feature_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Scenario.create!(@valid_attributes)
  end

  it "should not have nil value of title" do
    @valid_attributes[:title] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
  end

  it "should not have nil value of given_block" do
    @valid_attributes[:given_block] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
  end

  it "should not have nil value of when_block" do
    @valid_attributes[:when_block] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
  end

  it "should not have nil value of then_block" do
    @valid_attributes[:then_block] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
  end

  it "validate association" do
    association = Scenario.reflect_on_association(:feature) 
    association.macro.should == :belongs_to
    association.class_name.should == 'Feature' 
  end

  it "should update feature title and create a new scenario" do 
    scenario_attributes = {
      :title => "Scenario Title",
      :given_block => "Given Block",
      :when_block => "When Block",
      :then_block => "Then Block"
    }
    
    feature_atrributes = {
      :id => 11,
      :title => "Feature"
    }

    feature = mock_model(Feature)
    Feature.should_receive(:update).with(feature_atrributes[:id], :title => feature_atrributes[:title]).and_return(feature)
    
    scenario = mock_model(Scenario)
    Scenario.should_receive(:new).with(scenario_attributes).and_return(scenario)

    scenarios = mock("List of Scenarios of a feature")
    feature.should_receive(:scenarios).and_return(scenarios)
    
    scenarios.should_receive(:<<).with(scenario).and_return scenarios
    
    result = mock("Result")
    feature.should_receive(:save).and_return(result)

    Scenario.create_scenario(feature_atrributes, scenario_attributes).should == [result, feature]

  end

end
