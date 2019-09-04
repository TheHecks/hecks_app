require 'aws-sdk-dynamodb'
require_relative 'dynamodb/driver_loader'
require 'hecks_domain'

module HecksApp
  HECKS_FILE_NAME = 'Domainfile'.freeze
  gem_dir = Gem::Specification.find_by_name('soccer_season').gem_dir

  def self.domain(name, &block)
    HecksDomain.domain(name, &block)
  end

  DOMAIN = instance_eval(File.open("#{gem_dir}/Domainfile").read)

  module Drivers
    class Dynamodb
      attr_reader :domain, :dynamodb
      def initialize(domain)
        @client = self.class.client
        @domain = domain
        load_driver
      end

      def self.client
        Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000')
      end

      def self.domain_schema
        
      end

      def load_driver
        DriverLoader.load(self)
      end
    end
  end
end
