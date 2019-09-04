require 'aws-sdk-dynamodb'
require_relative 'dynamodb/driver_loader'

module HecksApp
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

      def load_driver
        DriverLoader.load(self)
      end
    end
  end
end
