class Applicant < ApplicationRecord
  validates_presence_of :first_name, :last_name,
                        :email_address, :phone_number,
                        :highest_education, :english_knowledge,
                        message: "This field can't be blank"

  validates_length_of :first_name, :last_name,
                      allow_blank: true,
                      minimum: 3, maximum: 35,
                      too_short: 'Minimum 3 characters'

  validates_length_of :phone_number,
                      allow_blank: true, in: 10..15,
                      too_short: 'Minimum 3 characters'

  validates_presence_of :english_class, :payment_option,
                        message: 'Please choose one of the options'

  validates_format_of :first_name, :last_name,
                      allow_blank: true, with: /\A[a-zA-Z]+\z/,
                      message: 'Only letters allowed'

  validates_numericality_of :phone_number,
                            allow_blank: true, only_integer: true,
                            message: 'Only numbers allowed'

  validates_format_of :email_address,
                      allow_blank: true,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      message: "The format of the e-mail address isn't correct"
end
