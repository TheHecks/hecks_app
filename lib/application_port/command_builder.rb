module HecksApp
  class ApplicationPort
    class CommandBuilder
      def self.build(domain_aggregate, app_module)
        domain_aggregate::Head::Commands.constants.each do |command|
          app_command = AppCommand.new(command)

          app_module.instance_eval do
            def method_missing(name, *args)
              CommandRunner.run(name, self, args)
            end
          end
        end
      end
    end
  end
end
