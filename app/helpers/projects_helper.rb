module ProjectsHelper

  def status_indicator(status)
    case status
    when "green"
      status_class = "alert alert-success"
    when "yellow"
      status_class = "alert"
    else
      status_class = "alert alert-error"
      status = "red" if status.nil?
    end
    
    return content_tag(:span, status.humanize, class: "status " + status_class)
  end

end
