class User < ActiveRecord::Base
  has_many :events, foreign_key: 'creator_id'
  has_many :attended_events, through: :users_events
  has_many :users_events

  validates :name, presence: true
  validates :email, presence: true
end
