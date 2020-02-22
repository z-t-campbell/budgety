class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :experiences
  has_many :organisations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
