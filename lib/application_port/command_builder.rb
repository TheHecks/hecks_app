class ApplicationPort
  class CommandBuilder
    def self.build(domain_aggregate, app_module)
      domain_aggregate::Head::Commands.constants.each do |command|
        app_module.class.define_method(AppCommand.new(command).name) do |*args|
          # Implement me
        end
      end
    end
  end
end
