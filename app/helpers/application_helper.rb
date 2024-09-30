module ApplicationHelper
  def flash_class(key)
    case key
    when 'notice'
      'bg-green-100 text-green-900'
    when 'alert'
      'bg-red-100 text-red-900'
    else
      'bg-gray-100 text-gray-900'
    end
  end
end
