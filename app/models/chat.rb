class Chat < ApplicationRecord
  has_many :messages, -> { sorted }, dependent: :destroy
end
