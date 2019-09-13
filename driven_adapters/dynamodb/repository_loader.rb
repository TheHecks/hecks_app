require 'active_record'
require 'securerandom'
require_relative 'query'
require_relative 'id'
require_relative 'put_item'

module HecksApp
  module DrivenAdapters
    class Dynamodb
      class RepositoryLoader
        def self.load(table)
          aggregate = ApplicationPort.find_aggregate(table.aggregate_name)

          ApplicationPort.in_repository(aggregate) do
            define_method 'self.save' do |domain_object|
              PutItem.put(table, domain_object)
            end

            define_method 'self.fetch' do |fetchable|
              ApplicationPort.domain_object_from_repository(self).default(
                Query.query(table, ID.for_fetchable(fetchable))
              )
            end
          end
        end
      end
    end
  end
end
