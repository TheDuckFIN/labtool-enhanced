module CoursesHelper

  def on_page?(controller, action)
    (params[:controller] == controller) and (params[:action] == action)
  end

end
