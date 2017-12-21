module AdminsHelper
  def status_string(cv_pp_status)
    cv_pp_status.gsub('_', ' ').capitalize
  end
end
