module HecksApp
  class ApplicationPort
    class CommandRunner
      def self.run(method, app_module, args)
        
        domain_aggregate = ApplicationPort.domain::Domain.const_get(
          app_module.to_s.split('::').last
        )
        head = domain_aggregate::Head.default(args.first)

        saved_head =
          if head.id
            domain_aggregate::Head::Repository.fetch(head)
          else
            domain_aggregate::Head::Repository.save(head)
          end

        
        saved_head.send(method, args[1]) unless method == :save!

        saved_head = domain_aggregate::Head::Repository.save(saved_head)
        saved_head.as_json.deep_symbolize_keys
      end
    end
  end
end