class ChannelsController < ApplicationController
  def show
    @channels = JSON.generate(Channel.all.pluck("name"))
  end
end
