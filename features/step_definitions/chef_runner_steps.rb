Given(/^a cookbook named "([^"]*)"$/) do |name|
  step %(a file named "metadata.rb" with:), %(name "#{name}")
  step %(an empty file named "Vagrantfile")
end

Given(/^a cookbook named "([^"]*)" with the recipes? "([^"]*)"$/) do |cookbook, recipes|
  step %(a cookbook named "#{cookbook}")
  recipes.split(",").each do |recipe|
    step %(an empty file named "recipes/#{recipe}.rb")
  end
end

Then(/^the runlist should be "([^"]*)"$/) do |runlist|
  step %(the output should contain "--override-runlist=#{runlist} ")
end

Then(/^the command "([^"]*)" should be executed$/) do |cmd|
  step %(the output should contain "#{cmd}")
end

Then(/^the command "([^"]*)" should not be executed$/) do |cmd|
  step %(the output should not contain "#{cmd}")
end
