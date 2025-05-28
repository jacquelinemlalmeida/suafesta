Rails.application.config.assets.paths << Rails.root.join("app/assets/builds")
Rails.application.config.assets.precompile += %w[application.js application.css]
Rails.application.config.assets.configure do |env|
  if env.respond_to?(:unregister_processor)
    env.unregister_processor 'text/css', Sprockets::SassProcessor rescue nil
  end
end
