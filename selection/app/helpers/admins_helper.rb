module AdminsHelper

  def status_string(status)
    status.gsub('_', ' ').capitalize
  end

  def status_button(status)
    case status
    when "nothing_uploaded"
      content_tag(:div, status.sub('_', ' ').capitalize, class: 'btn-static btn-warning')
    when "cv_pp_approved"
      content_tag(:div, status.gsub('_', ' ').capitalize, class: 'btn btn-primary')
    end
  end
end
