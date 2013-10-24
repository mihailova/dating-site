class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validates :, inclusion: { in: ROLES }
  validates :name, presence: true
  validates :location, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :search_for, presence: true


   def mailboxer_email(object)
   	self.email
   end
end
