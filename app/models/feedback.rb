class Feedback < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  belongs_to :task
end
