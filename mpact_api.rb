require 'sinatra'
require 'json'

get '/' do
  'mpact api'
end

get '/guides' do
	content_type :json
	[
		{ 'key' => 'gmc', 		'image' => '', 			'title' => 'GMC \'13 Guide', 	'textLabel' => 'GMC \'13 Guide' },
		{ 'key' => 'lmc', 		'image' => '', 			'title' => 'LMC \'13 Guide', 	'textLabel' => 'LMC \'13 Guide' },
		{ 'key' => 'refuge', 	'image' => 'refuge', 	'title' => '', 					'textLabel' => 'Prayer Guide' }
	].to_json
end


# helpers do
# 	def guide
# 		@guide ||= 
# 	end
# end


# get '/entries/:guide' do
# 	content_type :json
# 	[
# 		{ 'key' => 'gmc', 		'image' => '', 			'title' => 'GMC \'13 Guide', 	'textLabel' => 'GMC \'13 Guide' },
# 		{ 'key' => 'lmc', 		'image' => '', 			'title' => 'LMC \'13 Guide', 	'textLabel' => 'LMC \'13 Guide' },
# 		{ 'key' => 'refuge', 	'image' => 'refuge', 	'title' => '', 					'textLabel' => 'Prayer Guide' }
# 	].to_json
# end
