require 'aws-sdk-dynamodb'
require 'active_record'
require 'securerandom'

require_relative '../id'
require_relative '../repository_builder'
require_relative '../table_builder'
require_relative '../table'
require_relative '../create_table'
require_relative '../query'
require_relative '../put_item'

module HecksApp
  module DrivenAdapters
    class Dynamodb
      BUILDERS = [TableBuilder, RepositoryBuilder].freeze

      def self.client
        Aws::DynamoDB::Client.new(endpoint: 'http://localhost:8000')
      end

      def load
        DOMAIN_SCHEMA.aggregates.each do |aggregate|
          BUILDERS.each { |builder| builder.build Table.new(aggregate) }
        end
      end
    end
  end
end
