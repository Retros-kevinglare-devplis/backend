class RetroChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_name
  end

  def speak(data)
    message = data.fetch('message')
    channel = channel_name

    CreateOrUpdateComponentsJob.perform_async(retro_id: retro.id, message:)

    stream_for channel, message
  end

  def unsubscribed
    stop_all_streams
  end

  private

  def user
    @user ||= User.find_by!(id: current_user)
  end

  def team
    @team ||= user.teams_collaborators.find_by!(id: params[:team_id])
  end

  def retro
    @retro ||= team.retros.find_by!(id: params[:retro_id])
  end

  def channel_name
    "retro:#{retro.id}"
  end
end
