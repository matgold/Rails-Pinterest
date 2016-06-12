class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins, :dependent => :destroy
  has_many :comments
  validates :email, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
end
