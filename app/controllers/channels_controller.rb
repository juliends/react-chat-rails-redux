class ChannelsController < ApplicationController
  def show
    if params[:id].blank?
      redirect_to channel_path(Channel.first.name)
    else
      @channel = Channel.find_by_name(params[:id])
      @channels = JSON.generate(Channel.all.pluck("name"))
    end
  end
end
