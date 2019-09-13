module HecksApp
  module DrivenAdapters
    class Dynamodb
      class RepositoryLoader
        class PutItem
          def put(table, domain_object)
            Dynamodb.client.put_item(
              table_name: table.name,
              item: domain_object.as_json.merge(
                id: ID.for_object(domain_object)
              )
            )
            domain_object.tap do |result|
              result.instance_eval { @id = ID.for_object(domain_object) }
            end
          end
        end
      end
    end
  end
end