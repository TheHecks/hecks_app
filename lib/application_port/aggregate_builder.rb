class ApplicationPort
  module AggregateBuilder
    def self.build(domain_aggregate)
      Module.new.tap do |app_module|
        app_module.instance_eval do
          CommandBuilder.build(domain_aggregate, app_module)
        end
      end
    end
  end
end
