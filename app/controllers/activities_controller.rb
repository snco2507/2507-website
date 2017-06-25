class ActivitiesController < ApplicationController

	include ActivitiesHelper

	def index
		@activities = Activity.all
	end

	def show
		@activity = Activity.find(params[:id])

    respond_to do |format|
      format.html
      format.png do
        kit = IMGKit.new render_to_string, width: 300, height: 300
        send_data kit.to_png, type: "image/png", disposition: "inline"
      end
    end
	end

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)
		@activity.save
		flash.notice = "Activity '#{@activity.title}' created"

=begin
  	client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    })

    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    date = @activity.activity_date
    title = @activity.title

    event = Google::Apis::CalendarV3::Event.new({
      start: Google::Apis::CalendarV3::EventDateTime.new(date: date),
      end: Google::Apis::CalendarV3::EventDateTime.new(date: date),
      summary: title
    })

    service.insert_event("2507contact@gmail.com", event)

=end

  	redirect_to activity_path(@activity)
	end

	def destroy
		@activity = Activity.find(params[:id])
		@activity.destroy
		flash.notice = "Activity '#{@activity.title}' deleted"
		redirect_to activities_path
	end

	def edit
		@activity = Activity.find(params[:id])
	end

	def update
		@activity = Activity.find(params[:id])
		@activity.update(activity_params)
		flash.notice = "Activity '#{@activity.title}' updated"
		redirect_to activity_path(@activity)
	end

	def report
    @activity = Activity.find(params[:id])
		title = params[:title]
		location = params[:location]
		date = params[:date]
		details = params[:details]
		attendees = params[:attendees]
		UserMailer.report_email(title, location, date, details, attendees).deliver_now
    flash.notice ="Post activity report sent"
    redirect_to activity_path(@activity)
	end

=begin
	def redirect
    client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url,
      grant_type: 'authorization_code'
    })

    redirect_to client.authorization_uri.to_s
  end

  def callback
    client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      redirect_uri: callback_url,
      code: params[:code],
      grant_type: 'authorization_code'
    })

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to calendars_url
  end

  def calendars
    client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    })

    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists
  end

  def events
    client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    })

    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @event_list = service.list_events(params[:calendar_id])
  end
=end
end
