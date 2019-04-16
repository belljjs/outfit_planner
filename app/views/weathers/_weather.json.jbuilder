json.extract! weather, :id, :description, :icon_src, :name, :icon, :high_temp, :low_temp, :date, :created_at, :updated_at
json.url weather_url(weather, format: :json)
