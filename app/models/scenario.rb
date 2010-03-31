class Scenario < ActiveRecord::Base
  validates_presence_of :title, :given_block, :when_block, :then_block
  belongs_to :feature, :foreign_key => "feature_id"
  def self.create_scenario(feature, scenario)
    feature = Feature.update(feature[:id], :title => feature[:title])
    scenario = Scenario.new(scenario)
    feature.scenarios << scenario
    result = feature.save
    return result, feature
  end
end
