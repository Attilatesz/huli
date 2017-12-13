class ProfilePicture < ApplicationRecord
  dragonfly_accessor :image
  belongs_to :user
  validates_presence_of :image
  validates_size_of :image, maximum: 5000.kilobytes, message: 'Maximum file size is 5.0 megabytes'

  # Check the file extension
  validates_property :ext, of: :image, in: ['jpg', 'jpeg', 'png'], 
                      message: 'Invalid File Format: Only jpg and png formats are allowed'

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
