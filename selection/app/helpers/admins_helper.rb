module AdminsHelper

  def status_string(status)
    status.gsub('_', ' ').capitalize
  end

  def status_button(applicant)
    if (applicant.cv && applicant.cv.upload_state == 'approval_pending') ||
       (applicant.profile_picture && applicant.profile_picture.upload_state == 'approval_pending')
        link_to 'Check', applicant_admin_path(id: applicant.id), class: 'btn btn-primary'
    elsif applicant.status == 'drt'
      content_tag(:div, 'Add result', class: 'btn btn-primary')
    end
  end
end
