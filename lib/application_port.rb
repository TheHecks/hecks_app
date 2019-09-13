require 'hecks_domain'
require 'hecks_adapters/dynamodb'
require_relative 'application_port/command_runner'

module HecksApp
  class ApplicationPort
    include Singleton

    def initialize
      @driven_adapters = []
      @domain = nil
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

    def driven_adapter(name)
      @driven_adapters << DrivenAdapters.const_get(name).new.load
    end
  end
end