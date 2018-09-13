module ApplicationHelper

  def flash_class(level)
    case level
      when 'info' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'danger' then "alert alert-danger"
      when 'warning' then "alert alert-warning"
    end
  end

end
