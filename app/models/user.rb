class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :posts

  def self.find_for_google_oauth2(auth)
    User.where(email: auth.info.email).first ||
      User.create(
        name: auth.info.name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        token: auth.credentials.token,
        password: Devise.friendly_token
      )
  end
end
