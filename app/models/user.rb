class User < ApplicationRecord
  PASSWORD_FORMAT = /\A(?=.{8,}\z)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).*\z/.freeze

  has_one :billing_address, -> { billing },
          inverse_of: :addressable, as: :addressable, class_name: 'Address', dependent: :destroy
  has_one :shipping_address, -> { shipping },
          inverse_of: :addressable, as: :addressable, class_name: 'Address', dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :password, format: { with: PASSWORD_FORMAT }, if: :password_required?
  validates :email, presence: true

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first

    user ||= User.create(email: access_token.info.email,
                         password: Devise.friendly_token[0, 20])
    user.uid = access_token.uid
    user.provider = access_token.provider
    user.skip_confirmation!
    user.save

    user
  end
end
