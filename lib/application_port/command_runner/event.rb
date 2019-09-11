module HecksApp
  class ApplicationPort
    class CommandRunner
      class Event
        attr_reader :errors, :domain_event
        def initialize(errors: [], domain_event: nil)
          @errors = errors
          @domain_event = domain_event
        end

        def on_success
          return unless @errors.empty?

          yield self
        end

        def on_fail
          return if @errors.empty?

          yield self
        end
      end
    end
  end
end
