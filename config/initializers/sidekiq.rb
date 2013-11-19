redis_config = {
  url: 'redis://localhost:6379/12',
  namespace: "Packor-#{Rails.env}"
}

Sidekiq.configure_server do |config|
  config.redis = redis_config
  config.server_middleware do |chain|
    chain.remove Sidekiq::Middleware::Server::RetryJobs
  end
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end

