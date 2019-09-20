require_relative 'command_runner/event'
module HecksApp
  class ApplicationPort
    class CommandRunner
      attr_reader :runnable
      def initialize(runnable)
        @runnable =
          case runnable
          when Symbol
            ApplicationPort.domain::Domain
              .const_get(runnable)::Root
          when Hash
            ApplicationPort.domain::Domain
              .const_get(runnable.keys.first)
              .const_get(runnable.values.first)
          else
            runnable
          end
      end

      def method_missing(name, *args, &block)
        run(name, args, &block)
      end

      def run(name, args, &block)
        @runnable.send(name, *args) do |domain_event|
          yield(Event.new(domain_event: domain_event)) if block
        end
      rescue ApplicationPort.domain::InvariantViolationError => e
        yield(Event.new(errors: [e.message])) && return if block

        raise e
      end
    end
  end
end
