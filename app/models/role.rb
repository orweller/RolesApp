class Role < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  scope :archived, -> { where.not(archived_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }
  scope :ended, -> { where.not(ended_at: nil).and(where("ended_at < ?", Time.current)) }
  scope :active, -> { where(archived_at: nil).and(where(deleted_at: nil)).and((where(ended_at: nil)).or(where("ended_at > ?", Time.current))) }
end
