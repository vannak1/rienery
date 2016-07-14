class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :votes
  has_many :discussions
  enum role: [:user, :editor, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates_presence_of :name, :email, :password


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first

    if user
     return user
    else
     registered_user = User.where(:email => access_token.info.email).first
     if registered_user
       return registered_user
     else
       user = User.create(
       name: data["name"],
       email: data["email"],
       provider:access_token.provider,
       uid: access_token.uid ,
       password: Devise.friendly_token[0,20]
       )
     end
    end
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
