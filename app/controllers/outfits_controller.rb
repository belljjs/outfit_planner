class OutfitsController < ApplicationController
  require 'httparty'
  require 'date'
  require 'time'

  def create
      w = Weather.where("created_at > ?", Date.today).last
      outfit = Outfit.new
      outfit.date = Date.today
      outfit.weather = w
      outfit.high_temp = w.high_temp
      outfit.user = current_user
      outfit.item_ids = outfit_params[:item_ids]
      ids = outfit.items
      if outfit.save
          flash[:success] = "An outfit is created!"
           redirect_to items_path
      else
          flash[:danger] = "Outfit is not created!"
           redirect_to items_path
      end
  end

  def start
      @weather = Weather.where("created_at >= ?", Time.now - 1.hour).last
      if @weather.blank?
          forecast = fetch_weather["DailyForecasts"]
          @weather = Weather.new(
              high_temp: forecast[0]["Temperature"]["Maximum"]["Value"],
              low_temp: forecast[0]["Temperature"]["Minimum"]["Value"],
              description: forecast[0]["Day"]["IconPhrase"],
              name: forecast[0]["Day"]["IconPhrase"],
              icon: forecast[0]["Day"]["Icon"]
          )
          @weather.icon_src = weatherImage(@weather.icon)
          if !@weather.save
              @weather = false     
          end       
      end
      getOutfit()
      checkItem()
  end

  def index
      @outfits = Outfit.where("user_id = ?", current_user).order("created_at desc").limit(10) 
  end

  def destroy
      outfit = Outfit.find params[:id]
      joints = Joint.where("outfit_id = :current_outfit", {current_outfit: outfit})
      joints.each do |j|
          j.destroy
      end
      outfit.destroy
      redirect_to outfits_path
  end

  private

  def fetch_weather
      city = 'Vancouver'
      country = 'ca'
      url = "http://dataservice.accuweather.com/forecasts/v1/daily/1day/53286?apikey=#{ENV["WEATHER_API_KEY"]}&metric=true"
      forecast = HTTParty.get(url,:headers =>{'Content-Type' => 'application/json'})
  end

  def getOutfit
      w = Weather.where("created_at > ?", Date.today).last
      @outfit = Outfit.where("user_id = :current AND high_temp >= :low AND high_temp <= :high", {current: current_user, high: w.high_temp + 4, low: w.high_temp - 4 }).last
  end

  def checkItem
      @item = Item.where("user_id = :current", {current: current_user }).last
  end

  def outfit_params
      params.require(:outfit).permit( :item_ids => [])
  end

  def weatherImage(icon)
      src=""
      case icon
      when 1, 2, 3
          src="sunny.png"
      when 4, 5, 6
          src="partly_cloudy.png"
      when 7, 8, 11
          src="cloud.png"
      when 12, 15, 18
          src="rain_light.png"
      when 13, 14, 16, 17
          src="rain_s_cloudy.png"
      when 19,20,21, 22, 23
          src="snowy.icon.png"
      else
          src="nothing"
      end
  end
end
