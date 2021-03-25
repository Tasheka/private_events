module EventsHelper
  def same_as_event_creator(event_user_id)
    cookies[:user_id].to_i.eql?(event_user_id.to_i) ? true : false
  end
end
