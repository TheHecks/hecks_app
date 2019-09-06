module HecksApp
  class ApplicationPort
    module FactoryBuilder
      def self.build(domain_aggregate, domain_object, app_object)
        result = domain_aggregate.const_get(domain_object)
        return unless result.constants.include?(:Factories)

        result::Factories.constants.each do |factory_name|
          app_object.define_singleton_method factory_name.to_s.underscore.downcase do |args|
            domain_aggregate.const_get(domain_object)::Factories.const_get(factory_name).factory(args)
          end
        end
      end
    end
  end
end