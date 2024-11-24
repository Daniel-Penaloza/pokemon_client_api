class Pokemon < ApplicationRecord
  attribute :types, :json, default: []
  attribute :stats, :json, default: []
end
