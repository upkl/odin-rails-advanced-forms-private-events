# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances

  scope :past, -> { where('date <= ?', DateTime.current) }
  scope :future, -> { where('date > ?', DateTime.current) }
end
