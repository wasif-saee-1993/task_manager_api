class Task < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  belongs_to :assignee, foreign_key: :assignee_id, class_name: 'User'

  has_many :feedbacks
end
