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
    @message = Message.new(content: params[:content])
    @message.channel = @channel
    @message.user = current_user
    @message.save
    render json: message
  end

  private

  def set_channel
    @channel = Channel.find_by_name(params['channel_id'])
  end
end
