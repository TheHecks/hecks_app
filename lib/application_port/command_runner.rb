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
            .const_get(@runnable)::Root

          r.send(name, *args)
        else
          @runnable.send(name, *args) do |domain_event|
            yield(Event.new(domain_event: domain_event)) if block
          end
        end
      rescue ApplicationPort.domain::InvariantViolationError => e
        yield(Event.new(errors: [e.message])) && return if block

        raise e
      end
    end
  end
end
