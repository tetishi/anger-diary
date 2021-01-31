# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :anger_records, dependent: :destroy
  has_many :success_records, dependent: :destroy

  # validates :username, presence: true
  attr_accessor :current_password

  # binding.pry
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(provider: access_token.provider,
                         uid: access_token.uid,
                         username: data["name"],
                         email: data["email"],
                         password: Devise.friendly_token[0, 20]
      )
      user.skip_confirmation!
      user.save
    end
    user

    #   where(provider: access_token.provider, uid: access_token.uid).first_or_initialize do |user|
    #     user.email = access_token.info.email
    #     user.password = Devise.friendly_token[0,20]
    #     user.username = access_token.info.username   # assuming the user model has a name
    #  end
  end
end
