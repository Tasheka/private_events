module EventsHelper
  def same_as_event_creator
    puts cookies[:user_id]
    puts @event.user_id
    puts cookies[:user_id].to_i.eql?(@event.user_id.to_i)
    cookies[:user_id].to_i.eql?(@event.user_id.to_i) ? true : false
  end
end
