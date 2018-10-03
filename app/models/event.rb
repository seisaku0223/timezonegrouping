class Event < ActiveRecord::Base
  belongs_to :user, foreign_key: "manager_id"
end
