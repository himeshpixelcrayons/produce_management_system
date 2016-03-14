module ApplicationHelper
	def active_class(controller, action = nil)
    ((controller.include?(controller_name) and action.blank?) || (controller_name == controller and action_name == action)) ? 'active' : ''
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, id: key, class: "flash #{key}"
    end.join.html_safe
  end
end
