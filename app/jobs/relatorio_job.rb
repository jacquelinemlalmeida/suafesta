class RelatorioJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      RelatorioMailer.with(user: user).enviar_relatorio.deliver_later
    end
  end
end
