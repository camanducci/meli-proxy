class Rack::Attack
  # Rack::Attack.cache.store = ActiveSupport::Cache::Memory.new

  #Change the limit of requests by amount of seconds made to the same path
  throttle('limit logins per email', limit: 20, period: 60) do |req|
    req.path
  end

  #Change the limit of requests by amount of seconds done by the same IP
  throttle('limit logins per id', limit: 20, period: 60) do |req|
    req.ip
  end
end