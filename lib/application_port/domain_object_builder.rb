module HecksApp
  class ApplicationPort
    module DomainObjectBuilder
      def self.build(domain_aggregate, app_module)
        domain_aggregate.constants.each do |domain_object|
          app_module.const_set(
            domain_object, Module.new.tap do |app_object|
              FactoryBuilder.build(domain_aggregate, domain_object, app_object)
              app_object.define_singleton_method :save do
                puts 'saving'
              end
            end
          )
        end
      end
    end
  end
end