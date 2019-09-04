module HecksApp
  module Drivers
    class Dynamodb
      class Table
        def initialize(aggregate_name)
          @aggregate_name = aggregate_name
        end

        def name
          @aggregate_name.to_s + '-' + domain_object_name.to_s.split('::').last
        end

        def domain_object_name
          ApplicationPort.domain::Domain.const_get(@aggregate_name)::Head.superclass
        end
      end
    end
  end
end