class RelatorioMailer < ApplicationMailer
  def enviar_relatorio
    @user = params[:user]
    @linhas = gerar_dados_do_relatorio(@user)

    attachments["relatorio.pdf"] = render_to_string(
      pdf: "relatorio",
      template: "participants/relatorio",
      formats: [:pdf],
      locals: { linhas: @linhas }
    )


    mail(to: @user.email, subject: "Relatório da FestaVIP")
  end

  private

  def gerar_dados_do_relatorio(user)
    user.participants.includes(:guests).flat_map do |participant|
      linhas = [{
        nome: participant.full_name,
        tipo: "Participante",
        faixa: "Adulto",
        rg: participant.rg
      }]

      linhas += participant.guests.map do |guest|
        {
          nome: guest.name,
          tipo: "Convidado",
          faixa: guest.guest_type == "adult" ? "Adulto" : "Criança",
          rg: guest.guest_type == "adult" ? guest.rg : "--"
        }
      end

      linhas
    end
  end
end
