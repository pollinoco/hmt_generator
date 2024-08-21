# frozen_string_literal: true
class <%= model_name %> < ApplicationRecord
  # == Relationships ========================================================
  belongs_to <%= model_relationships[0] %>
  belongs_to <%= model_relationships[1] %>
end
