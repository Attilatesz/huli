module AdminsHelper

  def status_string(status)
    status.gsub('_', ' ').capitalize
  end

  def status_button(applicant)
    if (applicant.cv && applicant.cv.upload_state == 'approval_pending') ||
       (applicant.profile_picture && applicant.profile_picture.upload_state == 'approval_pending')
      content_tag(:div, 'Check', class: 'btn btn-primary')
    end
  end
end
