require_relative 'repository_loader'
require_relative 'table_builder'
require_relative 'table'

module HecksApp
  module Drivers
    class Dynamodb
      class DriverLoader
        def self.load(driver)
          HecksApp::DOMAIN_SCHEMA.aggregates.each do |aggregate|
            TableBuilder.build(Table.new(aggregate))
            RepositoryLoader.load(aggregate.name)
          end
        end
      end
    end
  end
end