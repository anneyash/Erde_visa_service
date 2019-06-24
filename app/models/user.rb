class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :personal_information, foreign_key: :personal_information_id
  has_many :visas, foreign_key: :visa_id
  has_many :visa_applications, foreign_key: :visa_application_id
  has_many :documents, foreign_key: :document_id
end
