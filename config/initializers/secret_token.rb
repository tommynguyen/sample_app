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
	token_file = Rails.root.join('secret')
	if File.exist?(token_file)
		#Use the existing token
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token
#SampleApp::Application.config.secret_key_base = '0fea6232f09033513f2646ef65842bf867b3daf36e223f3bb533a8b0c7011ee86aaf3024e6aefa37fe4641a11fb5a7a4ac060a71722146879184fb62a0619854'
