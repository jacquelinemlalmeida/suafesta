class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @participant.guests.build
  end

  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to new_participant_path, notice: "Presença confirmada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def relatorio
    @linhas = []

    Participant.includes(:guests).find_each do |participant|
      @linhas << {
        nome: participant.full_name,
        tipo: "Participante",
        faixa: "Adulto",
        rg: participant.rg,
        updated_at: participant.updated_at
      }

      participant.guests.each do |guest|
        @linhas << {
          nome: guest.name,
          tipo: "Convidado",
          faixa: guest.guest_type == "adult" ? "Adulto" : "Criança",
          rg: guest.guest_type == "adult" ? guest.rg : "--",
          updated_at: guest.updated_at
        }
      end
    end

    @linhas_updated_at = @linhas.map { |l| l[:updated_at] }.max

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "relatorio_presenca",
              template: "participants/relatorio",
              formats: [:pdf],
              layout: "pdf",
              encoding: "UTF-8"
      end
    end
  end

  private

  def participant_params
    params.require(:participant).permit(
      :full_name, :phone, :rg,
      guests_attributes: [:id, :name, :rg, :age, :guest_type, :_destroy]
    )
  end
end
