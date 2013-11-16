class User < ActiveRecord::Base
  GENDER = %w(male female)
  SEARCH_FOR = %w(sex relationship marriage communication not_set)
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :gender, inclusion: { in: GENDER }
  validates :search_for, inclusion: { in: SEARCH_FOR }
  validates :name, presence: true
  validates :location, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :search_for, presence: true

  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true

   def mailboxer_email(object)
   	self.email
   end

  def age
    now = Date.today
    now.year - self.birth_date.year - (self.birth_date.change(:year => now.year) > now ? 1 : 0)
  end

  def self.find_for_facebook_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.where(email: auth.info.email).first
      if user
        user.add_fb_account(auth)
      else
        user = User.create(
          name: auth.extra.raw_info.name,
          birth_date: Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y'),
          #picture: auth.info.image,
          location: auth.info.location,
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0,20],
          gender: auth.extra.raw_info.gender,
          search_for: "not_set"
          #role: "confirmed",
          #has_password: false
        )
      end
    end
    user
  end


  def add_fb_account(auth)
    self.update({provider: auth.provider, uid: auth.uid})
    #self.update({location: auth.info.location}) unless self.location
    #self.update({picture: auth.info.image}) unless self.has_avatar? && self.has_picture?
    #self.update({role: "confirmed"}) if self.unconfirmed?
  end
end
