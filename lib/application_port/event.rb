module HecksApp
  class ApplicationPort
    class Event
      include Singleton

      def initialize
        @subscriptions = {}
      end

      def self.subscribe(subscriber, event)
        instance.subscribe(subscriber, event)
      end

      def self.emit(event)
        instance.emit(event)
      end

      def subscribe(subscriber, event)
        @subscriptions[event] ||= []
        @subscriptions[event] << subscriber
      end

      def emit(event)
        return unless @subscriptions[event]

        @subscriptions[event].each do |subscriber|
          subscriber.notify(event)
        end
      end
    end
  end
end