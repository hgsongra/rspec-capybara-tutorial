class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true

  scope :persisted, -> { where.not(id: nil).order(created_at: :desc) }
end
