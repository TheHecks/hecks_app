require_relative 'command_runner/event'
module HecksApp
  class ApplicationPort
    class CommandRunner
      def initialize(runnable)
        @runnable = runnable
      end

      def method_missing(name, *args, &block)
        run(name, args, &block)
      end

      def run(name, args, &block)
        if @runnable.is_a?(Symbol)
          r = ApplicationPort.domain::Domain
            .const_get(@runnable)::Head
            .superclass

          r.send(name, *args)
            
        else
          @runnable.send(name, *args) do |domain_event|
            yield(Event.new(domain_event: domain_event)) if block
          end
        end
      rescue => e
        yield(Event.new(errors: [e.message])) if block
      end
    end
  end
end