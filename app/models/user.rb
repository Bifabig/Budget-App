class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :entities, foreign_key: 'author_id'
  has_many :groups

  validates :name, presence: true
end
