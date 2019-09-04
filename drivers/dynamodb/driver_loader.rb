require_relative 'repository_loader'
require_relative 'table_builder'

module HecksApp
  module Drivers
    class Dynamodb
      class DriverLoader
        def self.load(driver)
          driver.domain::Domain.constants.each do |aggregate_name|
            TableBuilder.build(driver, aggregate_name)
            RepositoryLoader.load(driver, aggregate_name)
          end
        end
      end
    end
  end
end