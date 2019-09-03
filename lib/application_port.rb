require_relative 'application_port/domain_builder'

class ApplicationPort
  include Singleton

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
end
