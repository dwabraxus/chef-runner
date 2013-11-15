Feature: Running commands via SSH

  Scenario: Run `vagrant ssh` per default
    Given a cookbook named "cats" with the recipe "default"
    When I successfully run `chef-runner`
    Then the command "vagrant ssh default" should be executed

  Scenario: Run `vagrant ssh` with machine name passed via --machine
    Given a cookbook named "cats" with the recipe "default"
    When I successfully run `chef-runner --machine somebox`
    Then the command "vagrant ssh somebox" should be executed

  Scenario: Run `ssh` with hostname passed via --host
    Given a cookbook named "cats" with the recipe "default"
    When I successfully run `chef-runner --host somehost.local`
    Then the command "ssh somehost.local" should be executed

  Scenario: Disallow passing both host and machine name
    Given a cookbook named "cats" with the recipe "default"
    When I run `chef-runner --host somehost.local --machine somebox`
    Then the stderr should contain "--host and --machine cannot be used together"
