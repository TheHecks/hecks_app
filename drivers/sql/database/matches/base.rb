module SQL
  module Database
    module Matches
      class Base < ActiveRecord::Base
        self.abstract_class = true
        self.table_name_prefix = 'matches_'
      end
    end
  end
end
