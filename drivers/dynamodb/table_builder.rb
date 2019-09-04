module HecksApp
  module Drivers
    class Dynamodb
      module TableBuilder
        def self.build(driver, aggregate_name)
          domain_object_name = ApplicationPort.domain::Domain.const_get(aggregate_name)::Head.superclass
          table_name = aggregate_name.to_s + '-' + domain_object_name.to_s.split('::').last

          begin
            Dynamodb.client.create_table(
              table_name: table_name,
              key_schema: [
                { attribute_name: 'id', key_type: 'HASH'}
              ],
              attribute_definitions: [
                { attribute_name: 'id', attribute_type: 'S' }
              ],
              provisioned_throughput: {
                read_capacity_units: 10,
                write_capacity_units: 10
              }
            )
          rescue Aws::DynamoDB::Errors::ResourceInUseException
            return false
          end
        end
      end
    end
  end
end