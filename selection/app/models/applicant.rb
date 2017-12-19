class Applicant < ApplicationRecord
  has_one :cv, dependent: :destroy
  has_one :profile_picture, dependent: :destroy

  validates_presence_of :first_name,
                        :last_name,
                        :email_address,
                        :phone_number,
                        :highest_education,
                        :english_knowledge,
                        message: I18n.t(:blank)

  validates_length_of :first_name,
                      :last_name,
                      allow_blank: true,
                      minimum: 3,
                      maximum: 35,
                      message: I18n.t(:too_short)

  validates_length_of :phone_number,
                      allow_blank: true,
                      in: 10..15,
                      message: I18n.t(:too_short)

  validates_presence_of :english_class,
                        :payment_option,
                        message: I18n.t(:select)

  validates_format_of :first_name,
                      :last_name,
                      allow_blank: true, 
                      with: /\A[a-zA-ZÀ-ÖØ-öø-ÿ]+\z/,
                      message: I18n.t(:only_letters)

  validates_numericality_of :phone_number,
                            allow_blank: true,
                            only_integer: true,
                            message: I18n.t(:only_numbers)

  validates_format_of :email_address,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      allow_blank: true,
                      message: I18n.t(:email_format)
end
