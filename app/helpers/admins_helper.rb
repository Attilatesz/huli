module AdminsHelper

  def status_string(status)
    status.gsub('_', ' ').capitalize
  end

  def status_button(applicant)
    if (applicant.cv && applicant.cv.upload_state == 'approval_pending') ||
       (applicant.profile_picture && applicant.profile_picture.upload_state == 'approval_pending')
      link_to 'Check', admins_applicant_path(id: applicant.id), class: 'btn btn-primary'
    elsif applicant.status == 'video' && applicant.video.status == 'approval_pending'
      link_to 'Add video result', edit_admins_video_path(applicant.video), class: 'btn btn-primary'
    elsif applicant.status == 'drt'
      content_tag(:div, 'Add Drt result', class: 'btn btn-primary')
    elsif applicant.status == 'interview' && applicant.interview.status == 'unscheduled'
      link_to 'Schedule interview', edit_admins_interview_path(applicant.interview), class: 'btn btn-primary'
    elsif applicant.status == 'simulation' && applicant.simulation.status == 'approval_pending'
      link_to 'Add Simulation Result', edit_admins_simulation_path(applicant.simulation), class: 'btn btn-primary'
    elsif applicant.status == 'contract' && applicant.contract.status == 'unsigned'
      link_to 'Upload Signed Contract', edit_admins_contract_path(applicant.contract), class: 'btn btn-primary'
    end
  end
end
