# frozen_string_literal: true

class Retrospective < ActiveRecord::Base
  has_many :demands
  has_many :doubts, dependent: :destroy
  has_many :negative_topics, dependent: :destroy
  has_many :positive_topics, dependent: :destroy
end
