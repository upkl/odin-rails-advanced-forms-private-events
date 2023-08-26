# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :name, presence: true
  validates :date, presence: true
end
