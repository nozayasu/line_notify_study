class LineNotifiesController < ApplicationController
    self.request_forgery_protection_token = :state

    def index
    end

    def auth
        auth_url = auth_client.auth_code.authorize_url(
            :redirect_uri => ENV["LINE_NOTIFY_REDIRECT_URI"],
            :scope => 'notify',
            :state => form_authenticity_token,
            :response_mode => 'form_post'
        )

        redirect_to auth_url
    end

    def callback
        code = params[:code]
        token = auth_client.auth_code.get_token(
            code,
            :redirect_uri => ENV["LINE_NOTIFY_REDIRECT_URI"],
            :headers => { "Content-Type" => "application/x-www-form-urlencoded" }
        )

        Rails.logger.info(params)
        Rails.logger.info(token.token)

        return redirect_to(root_path);
    end

    private

    def auth_client
        return OAuth2::Client.new(
            ENV["LINE_NOTIFY_CLIENT_ID"],
            ENV["LINE_NOTIFY_CLIENT_SECRET"],
            :site => 'https://notify-bot.line.me/oauth/authorize'
        )
    end
end
