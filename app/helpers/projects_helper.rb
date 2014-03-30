module ProjectsHelper

  def status_indicator(status)
    case status
    when "green"
      status_class = "alert alert-success"
    when "yellow"
      status_class = "alert"
    else
      status_class = "alert alert-error"
    end
    
    return content_tag(:span, " ", class: "status " + status_class)
  end

end
