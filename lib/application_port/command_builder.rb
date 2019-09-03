class ApplicationPort
  class CommandBuilder
    def self.build(domain_aggregate, app_module)
      domain_aggregate::Head::Commands.constants.each do |command|
        app_command = AppCommand.new(command)

        app_module.class.define_method(app_command.name) do |args|
          CommandRunner.run(self, args)
        end
      end
    end
  end
end
