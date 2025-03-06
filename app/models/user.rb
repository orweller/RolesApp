class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :roles, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # @return [String]
  def initials
    if first_name?
      first_initial = first_name[0]
      last_initial = last_name[0]
      "#{first_initial}#{last_initial}".upcase
    else
      email_address[0, 2].upcase
    end
  end

  # @return [String]
  def name
    if first_name? && last_name?
      "#{first_name} #{last_name}"
    elsif first_name?
      "#{first_name}"
    elsif last_name?
      "#{last_name}"
    else
      email_address
    end
  end
end
