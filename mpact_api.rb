require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './environments'

# use Rack::MethodOverride

set :public_folder, 'public'

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
		@guide_entries.sort_by &:id
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



get '/guide/:key/editentries' do
	erb :db_form
end


post '/post/entry' do

	id = params[:entry]

	Entry.update(id, { :image => params[:image], :name => params[:name]})

	filename = params[:datafile] if !params[:datafile].nil?
	
	if !filename.nil? && !filename.empty?
		Entry.update(id, :data => filename[:tempfile].read)
	end

	"Entry #{id} updated."
end


delete 'guide/entry/:id' do

	puts params[:_method]

	entry = Entry.find(params[:id])
	return status 404 if entry.nil?
	entry.delete
	status 202
	"Entry #{id} deleted."
end




#################
# Static (image) handler

def send_static_file(path, &missing_file_block)
	file_path = File.join(File.dirname(__FILE__), 'public', path)

	File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
end

get '/images/:filename' do
	send_static_file(request.path + '.png') {404}
end