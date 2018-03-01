class User < ApplicationRecord
  has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  has_many :assigned_tasks, foreign_key: :assignee_id, class_name: 'Task'
  has_many :created_tasks, foreign_key: :creator_id, class_name: 'Task'

  has_many :feedbacks
end
