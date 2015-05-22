module ApplicationHelper

  def fixed_url(url)
    url.starts_with?('http://') ? url : "http://#{url}" #單括號不行！！
  end

  def time_format(date_time)
  	if logged_in? && !current_user.time_zone.blank?
  		date_time = date_time.in_time_zone(current_user.time_zone)
  	end
    date_time.strftime("%b/%d/%Y %I:%M%p %Z")
  end
end
