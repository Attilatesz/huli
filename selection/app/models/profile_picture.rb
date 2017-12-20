class ProfilePicture < ApplicationRecord
  # this is required for singular resources to work properly with forms
  # when only specifying the model
  model_name.instance_variable_set(:@route_key, 'profile_picture')

  belongs_to :applicant
  dragonfly_accessor :image
  validates_presence_of :image
  validates_size_of :image, maximum: 5000.kilobytes, message: 'Maximum file size is 5.0 megabytes'

  # Check the file extension
  validates_property :ext, of: :image, in: ['jpg', 'jpeg', 'png'], 
                      message: 'Invalid File Format: Only jpg and png formats are allowed'

  after_save do
    upload if upload_state == 'awaiting_upload'
    applicant.pp_upload if upload_state == 'approved'
  end

  state_machine :upload_state, initial: :awaiting_upload do
    event :upload do
      transition awaiting_upload: :approval_pending
    end

    event :approve do
      transition approval_pending: :approved
    end

    event :decline do
      transition approval_pending: :awaiting_upload
    end
  end
end
