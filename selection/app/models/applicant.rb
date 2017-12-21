class Applicant < ApplicationRecord
  has_one :cv, dependent: :destroy
  has_one :profile_picture, dependent: :destroy

  validates_presence_of :first_name,
                        :last_name,
                        :email_address,
                        :phone_number,
                        :highest_education,
                        :english_knowledge,
                        message: I18n.t('form.blank')

  validates_length_of :first_name,
                      :last_name,
                      allow_blank: true,
                      minimum: 3,
                      maximum: 35,
                      message: I18n.t('form.length', min: 3, max: 35)

  validates_length_of :phone_number,
                      allow_blank: true,
                      in: 10..15,
                      message: I18n.t('form.length', min: 10, max: 15)

  validates_presence_of :english_class,
                        :payment_option,
                        message: I18n.t('form.select')

  validates_format_of :first_name,
                      :last_name,
                      allow_blank: true,
                      with: /\A[a-zA-ZÀ-ÖØ-öø-ÿ]+\z/,
                      message: I18n.t('form.only_letters')

  validates_numericality_of :phone_number,
                            allow_blank: true,
                            only_integer: true,
                            message: I18n.t('form.only_numbers')

  validates_format_of :email_address,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      allow_blank: true,
                      message: I18n.t('form.email_format')

  state_machine :cv_pp_state, initial: :nothing_uploaded do
    event :cv_upload do
      transition nothing_uploaded: :cv_approved, pp_approved: :cv_pp_approved
    end

    event :pp_upload do
      transition nothing_uploaded: :pp_approved, cv_approved: :cv_pp_approved
    end
  end
end
