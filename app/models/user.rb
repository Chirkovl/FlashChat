class User < ApplicationRecord
  has_many :messages, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
end
