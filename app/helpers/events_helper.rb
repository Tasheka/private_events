module EventsHelper
  def same_as_event_creator(event_user_id)
    puts cookies[:user_id]
    puts event_user_id
    puts cookies[:user_id].to_i.eql?(event_user_id.to_i)
    cookies[:user_id].to_i.eql?(event_user_id.to_i) ? true : false
  end
end
