# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist? (token_file)
		# Use existing token
		File.read(token_file).chomp
	else
		#generate a new token and store it in token_file
		token= SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = 'e8533a10112b7889edb8fda676ae370ee46edd586cbf604c6c1fdb9bae7a26ab8d2525d98c6bd780a43f6f4344ea4bb5476f58283dcbf93f5e048f7012e1dfa3'
