module ApplicationHelper
  def order_time meow
    if meow < 5
      status = 'success'
    elsif meow < 10
      status = 'warning'
    else
      status = 'danger'
    end
    status.html_safe
  end
  
  def order_time_button meow
    if meow < 5
      status = 'btn btn-success'
    elsif meow < 10
      status = 'btn btn-warning'
    else
      status = 'btn btn-danger'
    end
    status.html_safe
  end
end
