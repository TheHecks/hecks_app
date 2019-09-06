require_relative 'app_command'
require_relative 'command_builder'
require_relative 'aggregate_builder'
require_relative 'domain_object_builder'
require_relative 'factory_builder'
require_relative 'command_runner'

module HecksApp
  class ApplicationPort
    module DomainBuilder
      def self.build(domain, application_port)
        domain::Domain.constants.each do |domain_constant|
          application_port.class.const_set(
            domain_constant,
            AggregateBuilder.build(
              domain::Domain.const_get(domain_constant)
            )
          )
        end
      end
    end
  end
end