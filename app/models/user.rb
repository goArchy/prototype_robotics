class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :active

  has_many :projects
  has_many :articles

  validates_presence_of :username
  validates_uniqueness_of :username

  def to_s
    if username
      username
    else
      "n/a"
    end
  end

end
