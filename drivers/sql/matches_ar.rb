class MatchesAR < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = 'matches_'
end
