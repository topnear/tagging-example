module ApplicationHelper
	def alert_struct(type, key=nil, message)
		content_tag :div, class: "alert alert-#{type} alert-dismissible" do 
			concat content_tag(:button, 'x', class: "close", data: {dismiss: "alert"})
			concat key ? "#{key}: #{message}" : "#{message}"
		end
	end

	def show_errors(type, error_messages)
		error_messages.each do |field_type, message|
			concat alert_struct(type, field_type, message.shift)
		end
		nil
	end

	def list_tag(instance) 
		instance.tag_list.map do |tag|
			link_to "#{tag}", tag_path(tag: tag)
		end.join(',').html_safe
	end
end
