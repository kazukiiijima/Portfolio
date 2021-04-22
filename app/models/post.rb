class Post < ApplicationRecord

	belongs_to :user
	belongs_to :genre
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :comments, dependent: :destroy
	attachment :image

	validates :title, presence: true
	validates :body, presence: true
end
