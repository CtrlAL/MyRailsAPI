class Report < ApplicationRecord
  validates :rep_user_id, presence: true
  validates :report_text, presence: true
  belongs_to :post
  belongs_to :user
end
