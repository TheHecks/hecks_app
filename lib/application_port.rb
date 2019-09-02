require 'pry'
require_relative 'application_port/command_runner'

class ApplicationPort
  include Singleton

  def self.config(&block)
    instance.instance_eval(&block)
  end

  def domain(domain)
    @domain = domain
    load_domain
  end

  private

  def load_domain
    @domain.constants.each do |domain_constant|
      self.class.const_set(domain_constant, build_aggregate(@domain.const_get(domain_constant)))
    end
  end

  def build_aggregate(domain_aggregate)
    Module.new.tap do |application_module|
      application_module.instance_eval do
        domain_aggregate::Head::Commands.constants.each do |command|
          self.class.define_method(command.to_s.underscore.downcase + '!') do |*args|
          end
        end
      end
    end
  end
end
