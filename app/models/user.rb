class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :owner,       dependent: :destroy
  has_one :guest,       dependent: :destroy
  has_many :plan,       dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
end
