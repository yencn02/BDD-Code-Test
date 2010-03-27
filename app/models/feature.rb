class Feature < ActiveRecord::Base
  validates_presence_of :title
#  validates_uniqueness_of :title
  has_many :scenarios

  def self.create_feature(feature, scenario)
    feature = Feature.new(feature)
    scenario = Scenario.new(scenario)
    feature.scenarios << scenario
    feature.save
  end
end
