module ApplicationHelper
	def active_class(controller, action = nil)
    ((controller_name == controller and action.blank?)) ? 'active' : ''
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, id: key, class: "#{key} text-center"
    end.join.html_safe
  end
end
