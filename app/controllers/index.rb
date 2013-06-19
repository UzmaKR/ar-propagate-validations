get '/' do
  @events = Event.all
  erb :index
end

# start creation process
get '/events' do
    erb :fill_event_form
end

#save to database
post '/events' do
  @event = Event.new(params[:event])
  if @event.save
      redirect '/'
  else
    erb :fill_event_form
  end
end

#Show particular event
get '/events/:id' do
  @event = Event.find(params[:id])
  erb :event_show
end

#Start edit process
get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb :fill_event_form
end

## post updates
put '/events' do
   @event = Event.find(params[:id])
   if @event.update_attributes(params[:event])
    redirect '/'
   else
    erb :fill_event_form
   end
end

