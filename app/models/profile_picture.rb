class ProfilePicture < ApplicationRecord
  # this is required for singular resources to work properly with forms
  # when only specifying the model
  model_name.instance_variable_set(:@route_key, 'profile_picture')

  belongs_to :applicant
  has_many :comments, as: :commentable
  dragonfly_accessor :image
  validates_presence_of :image, message: I18n.t('uploads.blank')
  validates_size_of :image, maximum: 5000.kilobytes,
                            message: I18n.t('uploads.size', size: 5)

  # Check the file extension
  validates_property :ext, of: :image, in: ['jpg', 'jpeg', 'png'],
                     message: I18n.t('uploads.format', formats: 'jpg, jpeg, png')

  after_save do
    applicant.next if upload_state == 'approved'
  end

  state_machine :upload_state, initial: :awaiting_upload do
    event :upload do
      transition awaiting_upload: :approval_pending, declined: :approval_pending
    end

    event :approve do
      transition approval_pending: :approved
    end

    event :decline do
      transition approval_pending: :declined
    end
  end
end
