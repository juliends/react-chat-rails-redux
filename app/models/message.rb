class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  validates :content, presence: true

  after_create :broadcast_message
  
  def format_for_cable
    {
      id: id,
      content: content,
      channel: channel.name,
      author: user.email
    }
  end

  def broadcast_message
    ActionCable.server.broadcast("channel_#{channel.name}", self.format_for_cable)
  end
end
