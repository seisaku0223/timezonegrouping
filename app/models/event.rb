class Event < ActiveRecord::Base
  belongs_to :user, foreign_key: "manager_id"
  has_many :registrations, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
