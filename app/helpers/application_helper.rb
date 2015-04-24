module ApplicationHelper

  def fixed_url(url)
    url.starts_with?('http://') ? url : "http://#{url}" #單括號不行！！
  end

  def time_format(original_time)
    original_time.strftime("%b/%d/%Y %I:%M%p")
  end
end
