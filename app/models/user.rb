class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         #:recoverable, 
         :rememberable, :trackable, :validatable

 	attr_accessible :email, :password, :password_confirmation, :remember_me, :name
	validates_presence_of :name

has_many :pins
end


