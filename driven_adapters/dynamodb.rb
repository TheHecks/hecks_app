require 'aws-sdk-dynamodb'
require_relative 'dynamodb/adapter_loader'

module HecksApp
  module DrivenAdapters
    class Dynamodb
      def initialize
        @client = self.class.client
        load_adapter
      end

      def self.client
        Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000')
      end

      def load_adapter
        AdapterLoader.load
      end
    end
  end
end
