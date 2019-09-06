require 'active_record'
require 'securerandom'
module HecksApp
  module Drivers
    class Dynamodb
      class RepositoryLoader
        def self.load(aggregate_name)
          aggregate = ApplicationPort.domain::Domain.const_get(aggregate_name)
          aggregate::Head::Repository.class_eval do
            def self.save(domain_object)
              id = domain_object.id || SecureRandom.uuid
              Dynamodb.client.put_item(
                table_name: domain_object.class.to_s.split('::')[-2] + '-' + domain_object.class.to_s.split('::')[-1],
                item: domain_object.as_json.merge(id: id)
              )
              domain_object.instance_eval do
                @id = id
              end

              domain_object
            end

            def self.fetch(domain_object)
              record = Dynamodb.client.query(
                table_name: domain_object.class.to_s.split('::')[-2] + '-' + domain_object.class.to_s.split('::')[-1],
                key_condition_expression: "#id = :id",
                expression_attribute_names: {
                  "#id" => "id"
                },
                expression_attribute_values: {
                  ":id" => domain_object.id
                }
              ).items.first.as_json.deep_symbolize_keys

              domain_object.class.default(record)
            end
          end
        end
      end
    end
  end
end
