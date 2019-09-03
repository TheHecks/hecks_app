module HecksApp
  module Drivers

    class Dynamodb
      def initialize(domain)
        domain.constants.each do |aggregate_name|
          aggregate = domain.const_get(aggregate_name)

          aggregate::Head::Repository.class_eval do
            def self.save(domain_object)
            end

            def self.fetch(id)
            end
          end
        end
      end
    end
  end
end
