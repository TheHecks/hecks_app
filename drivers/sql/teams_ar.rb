class TeamsAR < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = 'teams_'
end
