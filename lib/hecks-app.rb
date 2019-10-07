require 'active_record'
require 'hecks/domain'

require_relative 'application_port/command_runner'
require_relative 'application_port/adapters'
require_relative 'application_port/event'

module HecksApp
  class ApplicationPort
    include Singleton

    attr_accessor :adapters, :event

    def initialize
      @adapters = []
      @domain = nil
      @event = Event
    end

    def self.in_repository(aggregate)
      aggregate::Root::Repository.class_eval do
        yield
      end
    end

    def self.domain_object_from_repository(repository)
      const_get(repository.to_s.gsub('::Repository', ''))
    end

    def self.find_aggregate(name)
      domain::Domain.const_get(name)
    end

    def self.config(&block)
      instance.instance_eval(&block)
      instance.event.emit(:AppConfigured)
    end

    def self.subscribe(subscriber, event)
      instance.event.subscribe(subscriber, event)
    end

    def self.domain
      instance.domain_get
    end

    def domain_get
      @domain
    end

    def self.[](value)
      CommandRunner.new(value)
    end

    def domain(domain)
      @domain = domain
      require_relative 'application_port/domain_schema'
    end

    def adapter(name)
      Adapters.const_get(name).new.tap do |adapter|
        adapter.load
        @adapters << adapter
      end
    end
  end
end