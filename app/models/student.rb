class Student < ApplicationRecord
  validates :student_id, presence: true, numericality: { greater_than_or_equal_to: 100000, less_than_or_equal_to: 999999, only_integer: true, message: "must be an id within 100000-999999"}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :encrypted_password, presence: true, length: { minimum: 8, message: "must be at least 8 characters long" }
  validates :class_period, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8, only_integer: true, message: "must be an number within 1-8"}
  validates :name, presence: {message: "a name is required"}
  validates :teacher_id, presence: {message: "teacher id is required"}
  belongs_to :teacher
end
