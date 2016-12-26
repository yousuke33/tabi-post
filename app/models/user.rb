class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :owner, dependent: :destroy
  has_one :guest, dependent: :destroy
  has_many :plan, dependent: :destroy
end
