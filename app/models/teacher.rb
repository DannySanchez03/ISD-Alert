class Teacher < ApplicationRecord
  validates :teacher_id, presence: true, numericality: { greater_than_or_equal_to: 100000, less_than_or_equal_to: 999999, only_integer: true, message: "must be an id within 100000-999999"}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :encrypted_password, presence: true, length: { minimum: 8, message: "must be at least 8 characters long" }
  validates :name, presence: {message: "a name is required"}
  validates :administrator_id, presence: {message: "administrator id is required"}
  belongs_to :administrator
  
end
