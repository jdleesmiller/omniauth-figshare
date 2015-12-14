require 'omniauth-oauth'

#
# Fix a minor non-conformity in the figshare API: from request_token, it should
# return
#   oauth_callback_confirmed=true
# (small t on true) but it returns
#   oauth_callback_confirmed=True
# (big T on True). This is enough to cause omniauth-oauth not to pass the
# oauth_verifier back to access_token, which breaks authentication.
#
module OAuth
  class RequestToken
    def figshare_callback_confirmed?
      params[:oauth_callback_confirmed].casecmp("true") == 0
    end

    alias_method :original_callback_confirmed?, :callback_confirmed?
    alias_method :callback_confirmed?, :figshare_callback_confirmed?
  end
end

module OmniAuth
  module Strategies
    class Figshare < OmniAuth::Strategies::OAuth
      option :name, 'figshare'
      
      option :client_options, {
        :site => 'https://api.figshare.com/v1/pbl'
      }

      uid {
        access_token.params['xoauth_figshare_id']
      }
    end
  end
end
