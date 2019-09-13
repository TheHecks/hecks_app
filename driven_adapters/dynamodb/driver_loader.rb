require_relative 'repository_loader'
require_relative 'table_builder'
require_relative 'table'

module HecksApp
  module DrivenAdapters
    class Dynamodb
      class AdapterLoader
        def self.load
          HecksApp::DOMAIN_SCHEMA.aggregates.each do |aggregate|
            TableBuilder.build(Table.new(aggregate))
            RepositoryLoader.load(aggregate.name)
          end
        end
      end
    end
  end
end