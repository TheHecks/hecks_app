class ApplicationPort
  class AppCommand
    def initialize(domain_command)
      @domain_command = domain_command
    end

    def name
      @domain_command.to_s.underscore.downcase + '!'
    end
  end
end