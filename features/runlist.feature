Feature: Overriding Chef runlist

  Scenario: Run default recipe when passing no arguments
    Given a metadata.rb file with the cookbook name "cats"
    And an empty file named "Vagrantfile"
    And an empty file named "recipes/default.rb"
    When I successfully run `chef-runner`
    Then the runlist should be "cats::default"

  Scenario: Run local recipe when passing filename
    Given a metadata.rb file with the cookbook name "cats"
    And an empty file named "Vagrantfile"
    And an empty file named "recipes/foo.rb"
    When I successfully run `chef-runner recipes/foo.rb`
    Then the runlist should be "cats::foo"

  Scenario: Run local recipe when passing recipe name
    Given a metadata.rb file with the cookbook name "cats"
    And an empty file named "Vagrantfile"
    And an empty file named "recipes/foo.rb"
    When I successfully run `chef-runner foo`
    Then the runlist should be "cats::foo"

  Scenario: Run external recipe when passing cookbook::recipe
    Given a metadata.rb file with the cookbook name "cats"
    And an empty file named "Vagrantfile"
    When I successfully run `chef-runner dogs::bar`
    Then the runlist should be "dogs::bar"

  Scenario: Run multiple recipes
    Given a metadata.rb file with the cookbook name "cats"
    And an empty file named "Vagrantfile"
    And an empty file named "recipes/foo.rb"
    And an empty file named "recipes/bar.rb"
    When I successfully run `chef-runner recipes/foo.rb bar dogs::baz`
    Then the runlist should be "cats::foo,cats::bar,dogs::baz"
