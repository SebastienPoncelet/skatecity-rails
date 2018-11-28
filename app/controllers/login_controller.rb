class LoginController < ApplicationController

skip_before_action :verify_authenticity_token

URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

def wechat_params
  {
    appid: ENV['APP_ID'],
    secret: ENV['SECRET'],
    js_code: params[:code],
    grant_type: "authorization_code"
  }
end

def wechat_user
  @wechat_response ||= RestClient.post(URL, wechat_params)
  @wechat_user ||= JSON.parse(@wechat_response.body)
end

def login
  # Would need to extract user avatar's URL when he logs in.
  # Need to store the avatar in User instance.
  open_id = wechat_user.fetch("openid")
  puts "open_id", open_id
  @user = User.find_or_create_by(open_id: open_id)
  puts "user", @user.inspect
  render json: {
    userId: @user.id
  }
end
end
