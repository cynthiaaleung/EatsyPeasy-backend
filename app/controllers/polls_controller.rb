require "uri"
require "net/http"

class PollsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def google
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
    result = @client.spots(43.6532, -79.3832, :types => ["restaurant"])
    render json: result.as_json
  end

  def index
    @polls = Poll.all
    render json: @polls
  end

  def create
    poll = Poll.create!(polls_params)
    render :nothing => true
  end

  def show
    if poll
      render json: poll
    else
      render json: poll.errors
    end
  end

  def update
    @poll = Poll.find_by(alpha_numeric_id: params[:alpha_numeric_id])
    # if poll
      #knowing which one was voted for, need to update corresponding vote count by 1
      restVote = params[:vote] #restaurant_{number}_votes
      @poll.increment!(restVote.to_sym,1)
      user = User.create(name: params[:name], poll_id: poll[:id], restaurant_choice: params[:vote])
      render json: @poll
      # else
    #   render json: poll.errors
    # end
  end

  def results
    poll = Poll.find_by(alpha_numeric_id: params[:alpha_numeric_id])
    users = User.where(poll_id: poll.id)
    #render json: poll
    render :json => {:users => users, 
                                  :poll => poll }
  end
  
  def resultspage
    # @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
    # result = @client.spots_by_query(params[:query])
    # render json: result.as_json
    puts "inside resultspage"
    puts params
    puts URI.encode(params[:query])
    puts `https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{URI.encode(params[:query])}#{URI.encode("&")}minprice=#{URI.encode(params[:minprice].to_s)}#{URI.encode("&")}maxprice=#{URI.encode(params[:maxprice].to_s)}#{URI.encode("&")}key=#{ENV['GOOGLE_PLACES_API_KEY']}`
    
    url = URI(`https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{URI.encode(params[:query])}#{URI.encode("&")}minprice=#{URI.encode(params[:minprice].to_s)}#{URI.encode("&")}maxprice=#{URI.encode(params[:maxprice].to_s)}#{URI.encode("&")}key=#{ENV['GOOGLE_PLACES_API_KEY']}`)
    puts url


    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    puts request

    response = https.request(request)
    puts response
    puts response.read_body
    puts "end of resultspage"
    render json: response.read_body.as_json
  end

  private

  # def vote_params
  #   params.permit(:place_id, :name, :alpha_numeric_id)
  # end

  def poll
    @poll ||= Poll.where(alpha_numeric_id: params[:alpha_numeric_id])
  end

  def polls_params
    params.permit(:restaurant_1_name,
    :restaurant_2_name,
    :restaurant_3_name,
    :restaurant_1_votes,
    :restaurant_2_votes,
    :restaurant_3_votes,
    :restaurant_1_business_hours,
    :restaurant_2_business_hours,
    :restaurant_3_business_hours,
    :restaurant_1_phone_number,
    :restaurant_2_phone_number,
    :restaurant_3_phone_number,
    :restaurant_1_website,
    :restaurant_2_website,
    :restaurant_3_website,
    :restaurant_1_maps_directions,
    :restaurant_2_maps_directions,
    :restaurant_3_maps_directions,
    :alpha_numeric_id,
    :restaurant_1_place_id,
    :restaurant_2_place_id,
    :restaurant_3_place_id)
  end
end

