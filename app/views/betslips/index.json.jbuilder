json.array!(@betslips) do |betslip|
  json.extract! betslip, :id, :stake, :winnings, :total_odds, :status
  json.url betslip_url(betslip, format: :json)
end
