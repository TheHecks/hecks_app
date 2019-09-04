module HecksApp
  module Drivers
    class Dynamodb
      class RepositoryLoader
        def self.load(driver, aggregate_name)
          aggregate = driver.domain::Domain.const_get(aggregate_name)

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