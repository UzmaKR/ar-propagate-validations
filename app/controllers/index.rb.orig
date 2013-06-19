get '/' do
  @events = Event.all
  erb :index
end

# start creation process
get '/events/new' do
    erb :fill_event_form
end

#save to database
post '/events/create' do
  @event = Event.new(params[:event])
  if @event.save
      redirect '/'
  else
    erb :fill_event_form
  end
end

get '/events/:id/show' do
  @event = Event.find(params[:id])
  erb :event_show
end

#start edit process
get '/event/:id/edit' do
   @event = Event.find(params[:id])
   p @event
   erb :fill_event_form
end

post '/event/:id' do 
  @event = Event.find(params[:id])
  if @event.update_attributes(params[:event])
    redirect "/events/#{@event.id}/show"
  else
    erb :fill_event_form
  end
end
