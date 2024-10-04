# frozen_string_literal: true

class Demand < ActiveRecord::Base
  belongs_to :retrospective
end
