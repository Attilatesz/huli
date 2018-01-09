class Applicant < ApplicationRecord
  has_one :cv, dependent: :destroy
  has_one :profile_picture, dependent: :destroy
  has_one :drt, dependent: :destroy

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

  before_save do
    if status == 'drt'
      throw :abort unless cv_pp_approved?
      assign_drt
    end
  end

  state_machine :status, initial: :basic do
    event :change do
      transition basic: :drt, drt: :interview
    end

    event :decline do
      transition all: :declined
    end
  end

  private

  def cv_pp_approved?
    (cv && profile_picture) &&
      cv.upload_state == 'approved' &&
      profile_picture.upload_state == 'approved'
  end

  def assign_drt
    drt = Drt.where(applicant_id: nil).first
    drt.applicant_id = id
    drt.save
  end
end
