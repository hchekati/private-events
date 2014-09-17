class Event < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  scope :upcoming, -> { where "date > ?", Time.zone.now }
  scope :past, -> { where "date <= ?", Time.zone.now }

  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :users_events
  has_many :users_events

  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
