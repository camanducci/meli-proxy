class Rack::Attack
  # Rack::Attack.cache.store = ActiveSupport::Cache::Memory.new

  throttle('limit logins per email', limit: 20, period: 600) do |req|
    req.path
  end

  throttle('limit logins per id', limit: 20, period: 600) do |req|
    req.ip
  end
end