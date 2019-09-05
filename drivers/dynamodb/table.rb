module HecksApp
  module Drivers
    class Dynamodb
      class Table
        attr_reader :fields
        
        def initialize(aggregate)
          @aggregate = aggregate
          @head = @aggregate.instance_variable_get(:@head)
          @fields = @head.instance_variable_get(:@fields)
        end

        def name
          [@aggregate.name.to_s, @head.name.to_s].join('-')
        end

        def aggregate_name
          @aggregate.name
        end
      end
    end
  end
end