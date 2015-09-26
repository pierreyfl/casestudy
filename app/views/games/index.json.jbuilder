json.array!(@games) do |game|
  json.extract! game, :id, :match, :type, :selection, :odds, :status
  json.url game_url(game, format: :json)
end
