module ApplicationHelper
  def flash_class
    if flash[:notice]
      "alert alert-success"
    else
      "alert alert-danger"
    end
  end
end
