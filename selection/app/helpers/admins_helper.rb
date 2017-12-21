module AdminsHelper

  def status_string(cv_pp_status)
    cv_pp_status.gsub('_', ' ').capitalize
  end

  def status_button(cv_pp_status)
    case cv_pp_status
    when "nothing_uploaded"
      content_tag(:div, cv_pp_status.sub('_', ' ').capitalize, class: 'btn-static btn-warning')
    when "cv_pp_approved"
      content_tag(:div, cv_pp_status.gsub('_', ' ').capitalize, class: 'btn btn-primary')
    end
  end
end
