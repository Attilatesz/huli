class ProfilePicture < ApplicationRecord
  dragonfly_accessor :image
  belongs_to :user
  validates :image_uid, format: { with: /\.(jpg|png|jpeg)\z/,
                                  message: 'Only pdf and jpg file formats are allowed' }

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
