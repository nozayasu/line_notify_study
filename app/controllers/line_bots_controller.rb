require "line/bot"

class LineBotsController < ApplicationController
  protect_from_forgery with: :null_session

  def callback
    body = request.body.read
    signature = request.env["HTTP_X_LINE_SIGNATURE"]

    unless client.validate_signature(body, signature)
      render json: "Bad Request", status: :bad_request
      return
    end

    events = client.parse_events_from(body)
    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          Rails.logger.info(event)
          message = {
            type: "text",
            text: event.message["text"]
          }
          client.reply_message(event["replyToken"], message)
        end
      when Line::Bot::Event::Join
        Rails.logger.info(event)
        client.reply_message(event["replyToken"], {type: "text", text: "招待ありがとうございます！"})
      when Line::Bot::Event::Leave
        Rails.logger.info(event)
      when Line::Bot::Event::Follow
        Rails.logger.info(event)
        client.reply_message(event["replyToken"], {type: "text", text: "友達追加ありがとうございます！"})
      when Line::Bot::Event::Unfollow
        Rails.logger.info(event)
      end
    }

    render json: "OK"
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
end
