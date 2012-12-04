require 'version'
require 'net/https'
require 'json'

module Coderwall
	
	BASE_URI = "https://coderwall.com/%s.json"
	
	class User
		def initialize(username, send_request=true)
			username.empty? ? invalid_username : @username = username.to_s
			make_http_request if send_request
		end
		def [](key)
			return @user_data[key.to_s]
		end
		private
		def method_missing(*args)
		 make_http_request
		 return @user_data[args[0].to_s] || super		
		end
		def make_http_request
			begin
			@user_data ||= JSON.parse(send_http_request) 
			rescue JSON::ParserError => e
				invalid_username
			end
		end
		def send_http_request
			uri = URI.parse(BASE_URI % @username)
			https = Net::HTTP.new(uri.host, 443)
			https.use_ssl = true
			https.verify_mode = OpenSSL::SSL::VERIFY_NONE
			https.start do
				response = https.get uri.request_uri
				return response.body
			end
		end

		def invalid_username
			raise(ArgumentError.new('invalid username'))
		end
		class << self
			def method_missing(*args)
				self.new(args[1]).send(args[0])
			end
			# Hack for Class.name
			# This method overwritten the default class method
			def name(username)
				self.new(username).name
			end
			def achievements_of(username)
				self.badges(username)
			end
			alias :achievements  :achievements_of
		end
	end
end