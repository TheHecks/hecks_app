require_relative 'app_command'
require_relative 'command_builder'
require_relative 'aggregate_builder'
require_relative 'command_runner'

class ApplicationPort
  module DomainBuilder
    def self.build(domain, application_port)
      domain.constants.each do |domain_constant|
        application_port.class.const_set(
          domain_constant,
          AggregateBuilder.build(
            domain.const_get(domain_constant)
          )
        )
      end
    end
  end
end
