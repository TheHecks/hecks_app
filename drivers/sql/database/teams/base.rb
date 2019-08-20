module SQL
  module Database
    module Teams
      class Base < ActiveRecord::Base
        self.abstract_class = true
        self.table_name_prefix = 'teams_'
      end
    end
  end
end
