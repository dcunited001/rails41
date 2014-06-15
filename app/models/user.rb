class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #TODO: :confirmable
         :recoverable, :rememberable, :trackable, :validatable,
         :async # mail sent through resque

  validates :username, length: { in: 4..20 }, uniqueness: true, presence: true
  validates :email, format: /@/, uniqueness: true, presence:true

  #TODO: login with email or username
  #TODO: add remember_me
end
