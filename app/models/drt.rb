class Drt < ApplicationRecord
  belongs_to :applicant, optional: true
  dragonfly_accessor :result_pdf

  # Check the file extension
  validates_property :ext, of: :result_pdf, as: 'pdf',
                      message: I18n.t('uploads.format', formats: 'pdf')

  after_save do
    applicant.decline if status == 'declined'
  end

  state_machine :status, initial: :created do
    event :change do
      transition created: :applicant_attached,
                 applicant_attached: :result_uploaded
    end

    event :approve do
      transition result_uploaded: :approved
    end

    event :decline do
      transition result_uploaded: :declined
    end
  end
end
