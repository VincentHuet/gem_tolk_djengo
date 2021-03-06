# == Schema Information
#
# Table name: translators
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  locale_id              :integer
#  password               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#
module TolkEngine
  class Translator < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email
    attr_accessible :password
    attr_accessible :password_confirmation
    attr_accessible :remember_me
    attr_accessible :locale_id
    attr_accessible :name
    attr_accessible :admin

    has_many :translations
    belongs_to :locale, :dependent => :destroy
  end
end