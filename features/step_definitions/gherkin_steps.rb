Given /^there is feature titled "([^\"]*)"$/ do |title|
  @feature = Factory(:feature, :title => title)
  scenario = Factory(:scenario)
  @feature.scenarios << scenario
  @feature.save
end

Given /^the feature has "([^\"]*)" of "([^\"]*)"$/ do |field, value|
  case field
  when "feature-title"
    @feature.update_attribute("title",value)
  when "scenario-title"
    @feature.scenarios[0].update_attribute("title",value)
  when "given-block" 
    @feature.scenarios[0].update_attribute("given_block",value)
  when "when-block"
    @feature.scenarios[0].update_attribute("when_block",value)
  when "then-block"
    @feature.scenarios[0].update_attribute("then_block",value)
  end
end