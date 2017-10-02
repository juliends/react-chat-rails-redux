class Api::V1::MessagesController < ApplicationController
  
  before_action :set_channel
  
  def index
    @messages = Message.select(['id', 'created_at'])
                       .joins(:channel).select('name')
                       .where(channel: @channel)
                       .joins(:user).select(['email as author, content'])
    render json: @messages
  end

  def create
    @message = Message.create(content: params[:content], channel: @channel, user: current_user)
    @json = @message.as_json
    @json["channel"] = @channel.name
    @json["author"] = current_user.email
    render json: @json
  end

  private

  def set_channel
    @channel = Channel.find_by_name(params['channel_id'])
  end
end
