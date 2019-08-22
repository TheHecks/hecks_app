require 'soccer_season'
require_relative 'factory_runner'

module SoccerSeasonApp
  def self.config(&block)
    class_eval(&block)
  end

  def self.load_driver(name)
    require_relative '../drivers/' + name.to_s
  end

  class CommandRunner
    def initialize(domain_object:)
      @domain_object = domain_object
    end

    def method_missing(name, *args)
      if @domain_object.respond_to?(name)
        @domain_object.send(name, *args)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @domain_object.respond_to?(method_name) || super
    end
  end

  def self.[](domain_object)
    return CommandRunner.new(domain_object: domain_object)
  end
end
