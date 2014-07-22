require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './environments'

class Guide < ActiveRecord::Base
	has_many :entries
end

class Entry < ActiveRecord::Base
	belongs_to :guide
end

get '/' do
  'mpact api'
end

get '/guides' do
	Guide.limit(5).to_json
end


helpers do
	def guide_entries
		@guide_entries ||= Entry.where('"entries"."guideKey" = ?', params[:key]) || halt(404)
	end
end


get '/guide/:key/entries' do
	guide_entries.to_json
end


# get a single entry for "today" functionality (per guide)
get '/guide/:key/entries/today' do

	start_date = Date.new(2014, 7, 21)
	today = Date.today
	diff = (today-start_date).to_i
	idx = diff % guide_entries.length

	#production
	guide_entries[idx-1].to_json

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
