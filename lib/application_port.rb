require_relative 'application_port/domain_builder'

module HecksApp
  class ApplicationPort
    include Singleton

    def initialize
      @drivers = []
      @domain = nil
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

    def domain(domain)
      @domain = domain
      DomainBuilder.build(@domain, self)
    end

    def driver(name)
      @drivers << Drivers.const_get(name).new(@domain)
    end
  end
end
