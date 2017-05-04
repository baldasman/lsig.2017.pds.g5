class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :encrypted_password, confirmation: true
  validates :email_confirmation, presence: true
  validates :encrypted_password_confirmation, presence: true
  has_many :orders
  has_one :order_file, through: :order
  has_one :report, through: :order
end
