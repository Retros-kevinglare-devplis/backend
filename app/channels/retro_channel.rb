class RetroChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams

    team = current_user.teams_collaborators.find_by(id: params[:team_id])
    raise StandardError, "Team #{params[:team_id]} not found" if team.blank?

    retro = team.retros.find_by(id: params[:retro_id])
    raise StandardError, "Retro #{params[:retro_id]} not found"  if retro.blank?

    stream_from "v1_team_id_#{team.id}_retro_id_#{retro.id}_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
