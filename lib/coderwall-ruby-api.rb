require 'net/http'
require 'json'

module Coderwall
	
	VERSION = "0.0.2"
	BASE_URI = "http://coderwall.com/%s.json"
	
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
			@user_data ||= JSON.parse(Net::HTTP.get(URI(BASE_URI % @username))) 
			rescue JSON::ParserError => e
				invalid_username
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