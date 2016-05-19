# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ActiveRecord::Base

  before_save :downcase_email

  validates :name,  presence: true, length: { maximum: 50 }

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX = /\w+/
  has_secure_password
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  ## `has_secure_password` automatically adds validations for:
  #   - presence of password
  #   - confirmation of password (using a "password_confirmation" attribute)
  ## I used regex to reject a blank password because using `presence: true`
  # causes dupulicate error massages.

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    # Used to standardize on all lower-case addresses.
    def downcase_email
      email.downcase!
    end

end
