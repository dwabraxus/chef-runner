Given(/^a metadata\.rb file with the cookbook name "(.*?)"$/) do |name|
  step %(a file named "metadata.rb" with:), %(name "#{name}")
end

Then(/^the runlist should be "(.*?)"$/) do |runlist|
  step %(the output should contain "--override-runlist=#{runlist} ")
end
