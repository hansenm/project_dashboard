module ProjectsHelper

  def overall_status_indicator(status)
    case status
    when "green"
      return "alert alert-success"
    when "yellow"
      return "alert"
    else
      return "alert alert-error"
    end
  end

end
