require 'spec_helper'

describe Feature do
  it "should be valid with a title" do
    Factory(:feature).should be_valid
  end
  it "should be invalid without a title" do
    Factory.build(:feature, :title => nil).should be_invalid
  end
  it "validate association" do
    association = Feature.reflect_on_association(:scenarios) 
    association.macro.should == :has_many
    association.class_name.should == 'Scenario' 
  end
  it "should create a feature which has at least one scenario" do 
    scenario_attributes = {
      :title => "Scenario Title",
      :given_block => "Given Block",
      :when_block => "When Block",
      :then_block => "Then Block"
    }
    
    feature_atrributes = {
      :title => "Feature"
    }

    feature = mock_model(Feature)
    Feature.should_receive(:new).with(feature_atrributes).and_return(feature)

    scenario = mock_model(Scenario)
    Scenario.should_receive(:new).with(scenario_attributes).and_return(scenario)

    scenarios = mock("List of Scenarios of a feature")
    feature.should_receive(:scenarios).and_return(scenarios)
    
    scenarios.should_receive(:<<).with(scenario).and_return scenarios
    
    result = mock("Result")
    feature.should_receive(:save).and_return(result)
    Feature.create_feature(feature_atrributes, scenario_attributes).should == result

  end
end
