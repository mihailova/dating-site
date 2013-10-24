class User < ActiveRecord::Base
  GENDER = %w(male female)
  SEARCH_FOR = %w(sex relationship marriage communication)
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :gender, inclusion: { in: GENDER }
  validates :search_for, inclusion: { in: SEARCH_FOR }
  validates :name, presence: true
  validates :location, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :search_for, presence: true


   def mailboxer_email(object)
   	self.email
   end

  def age
    now = Date.today
    now.year - self.birth_date.year - (self.birth_date.change(:year => now.year) > now ? 1 : 0)
  end
end
