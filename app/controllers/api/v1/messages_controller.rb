class Api::V1::MessagesController < ApplicationController
  
  before_action :set_channel
  
  def index
    @messages = Message.select(['id', 'created_at'])
                       .joins(:channel).select('name')
                       .joins(:user).select(['email as author, content'])
    render json: @messages
  end

  def create
  end

  private

  def set_channel
    @channel = Channel.first
  end
end
