class ApplicationRecord < ActiveRecord::Base
  helper :all
  self.abstract_class = true
end
