class PartiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @parties = current_user.parties.order(scheduled_at: :desc)
  end

  def show
    @party = Party.find(params[:id])
    @participants = @party.participants.includes(:guests)

    @adultos = @participants.count +
              @participants.flat_map(&:guests).count { |g| g.guest_type == "adult" }

    @criancas = @participants.flat_map(&:guests).count { |g| g.guest_type == "child" }

    @resources = MealCalculation.new(adults: @adultos, children: @criancas).to_h

    @lines = @participants.flat_map do |participant|
      lines = [{
        nome: participant.full_name,
        tipo: "Participante",
        faixa: "Adulto",
        rg: participant.rg,
        updated_at: participant.updated_at
      }]

      lines += participant.guests.map do |guest|
        {
          nome: guest.name,
          tipo: "Convidado",
          faixa: guest.guest_type == "adult" ? "Adulto" : "Criança",
          rg: guest.guest_type == "adult" ? guest.rg : "--",
          updated_at: guest.updated_at
        }
      end

      lines
    end

    @lines_updated_at = @lines.map { |l| l[:updated_at] }.max
  end

  def relatorio
    @party = Party.find(params[:id])
    @linhas = []

    @party.participants.includes(:guests).find_each do |participant|
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
              template: "participants/relatorio", # ajuste conforme necessário
              formats: [:pdf],
              layout: "pdf",
              encoding: "UTF-8"
      end
    end
  end

end
