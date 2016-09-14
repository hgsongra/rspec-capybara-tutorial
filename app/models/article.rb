class Article < ApplicationRecord

	has_many :comments, dependent: :destroy
	
	validates :title, :body, presence: true

	default_scope {order(created_at: :desc)}

	belongs_to :user
end
