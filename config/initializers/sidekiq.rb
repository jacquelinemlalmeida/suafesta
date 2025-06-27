require 'sidekiq'
require 'sidekiq-cron'

redis_url = ENV.fetch("REDIS_URL", "redis://localhost:6379/0")

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }

  schedule = {
    'enviar_relatorio' => {
      'cron' => '0 9 */3 * *',
      'class' => 'RelatorioJob'
    }
  }
  Sidekiq::Cron::Job.load_from_hash(schedule)
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end
