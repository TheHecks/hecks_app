module HecksApp
  module Drivers
    class Dynamodb
      module TableBuilder
        def self.build(driver, aggregate_name)
          begin
            Dynamodb.client.create_table(
              table_name: Table.new(aggregate_name).name,
              key_schema: [
                { attribute_name: 'id', key_type: 'HASH' }
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