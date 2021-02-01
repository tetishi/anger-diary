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

  def self.from_omniauth(access_token)
    where(provider: access_token.provider, uid: access_token.uid).first_or_create do |user|
      user.username = access_token.info.name
      user.email = access_token.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
      # user.save
    end
  end
end
