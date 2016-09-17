# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_sorocaba_channel' # can be dynamic
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    ActionCable.server.broadcast('room_sorocaba_channel', render_message(data))
  end

  private
  def render_message(data)
    ApplicationController.renderer.render(partial: 'rooms/message',
                                          locals: { data: data })
  end
end
