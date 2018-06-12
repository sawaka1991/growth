class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  soft_deletable

  # Deviseを使うと、問答無用でemailがユニーク扱いになる。
  # それだと論理削除した際に再登録できないので、一旦emailに関する検証を削除する
  _validators.delete(:email)
  _validate_callbacks.each do |callback|
    if callback.raw_filter.respond_to? :attributes
      callback.raw_filter.attributes.delete :email
    end
  end

  # emailのバリデーションを定義し直す
  validates :email, presence: true
  validates_format_of :email, with: Devise.email_regexp, if: :email_changed?
  validates_uniqueness_of :email, scope: :soft_destroyed_at, if: :email_changed?

  def self.find_for_authentication(warden_conditions)
    without_soft_destroyed.where(email: warden_conditions[:email]).first
  end

   has_many :friends, dependent: :destroy
   has_many :memories, through: :friends
   has_many :reviews, dependent: :destroy
   has_many :likes, through: :friends
   has_many :histories, dependent: :destroy
   has_many :items, through: :reviews
   has_one :cart

   validates :first_name,:last_name,
            :kana_first_name,
            :kana_last_name,
            :zipcode,
            :tel,
            :address,
            :nickname,
            presence: true
end
