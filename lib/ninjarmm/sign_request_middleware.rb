require 'time'
require 'base64'

module NinjaRMM
  SignRequestMiddleware = Struct.new(:app, :access_id, :secret_key) do
    def call(env)
      # establish necessary variables
      http_method        = env[:method].to_s.upcase
      time_stamp         = Time.now.httpdate
      canonical_resource = env[:url].to_s.delete_prefix(Client::BASE_URL)

      # define our required string format
      string = "#{http_method}\n\n\n#{time_stamp}\n#{canonical_resource}"

      # process string
      string_base64 = Base64.strict_encode64(string)
      string_hash   = OpenSSL::HMAC.digest('SHA1', secret_key, string_base64)
      hash_base64   = Base64.strict_encode64(string_hash)

      # add processed string and time to request headers
      env[:request_headers].merge!(
        Authorization: "NJ #{access_id}:#{hash_base64}",
        Date:          time_stamp.to_s
      )

      app.call env
    end
  end
end