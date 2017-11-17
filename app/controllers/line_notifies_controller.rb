class LineNotifiesController < ApplicationController
    def auth
        uri = 'https://notify-bot.line.me/oauth/authorize' + \
            '?response_type=code' + \
            '&client_id=' + ENV["LINE_NOTIFY_CLIENT_ID"] + \
            '&redirect_uri=' + ENV["LINE_NOTIFY_REDIRECT_URI"] + \
            '&scope=notify' + \
            '&state=' + form_authenticity_token() + \
            '&response_mode=form_post'

        return redirect_to(uri);
    end

    def callback
        Rails.logger.info(params)
    end
end
