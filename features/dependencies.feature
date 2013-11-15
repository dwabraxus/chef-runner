Feature: Install cookbook dependencies

  Scenario: Run Berkshelf when the cookbook folder does not exist
    Given a cookbook named "cats" with the recipe "default"
    When I successfully run `chef-runner`
    Then the command "berks install --path vendor/cookbooks" should be executed
    And the command "rsync" should not be executed

  Scenario: Run rsync when the cookbook folder already exists
    Given a cookbook named "cats" with the recipe "default"
    And a directory named "vendor/cookbooks/cats"
    When I successfully run `chef-runner`
    Then the command "rsync" should be executed
    And the command "berks install" should not be executed

  Scenario: Run rsync when the cookbook folder already exists
    Given a cookbook named "cats" with the recipe "default"
    And a directory named "vendor/cookbooks/cats"
    When I successfully run `chef-runner`
    Then the command "rsync" should be executed
    And the command "berks install" should not be executed
