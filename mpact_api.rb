require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require './environments'
# require './initializers'


class String
  def to_bool
    return true if self == true || self =~ (/^(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/^(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

class Fixnum
  def to_bool
    return true if self == 1
    return false if self == 0
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

class TrueClass
  def to_i; 1; end
  def to_bool; self; end
end

class FalseClass
  def to_i; 0; end
  def to_bool; self; end
end

class NilClass
  def to_bool; false; end
end




# use Rack::MethodOverride

set :public_folder, 'public'

class Guide < ActiveRecord::Base
	has_many :entries
end

class Note < ActiveRecord::Base
	belongs_to :entry
end

class Entry < ActiveRecord::Base
	belongs_to :guide
	has_many :notes
end




before do
	error 401 unless params[:apikey] == "1138"
end


get '/' do
  'mpact api'
end

get '/guides' do
	content_type 'application/json'
	Guide.limit(5).to_json
end


helpers do
	# def guides
	# 	@guides ||= Guide.limit(5)
	# end

	def guide_entries_all
		@guide_entries_all ||= Entry.order('entrytype ASC, name ASC').where('"entries"."guideKey" = ?', params[:key]) || halt(404)
	end

	def guide_entries
		@guide_entries ||= Entry.order('entrytype ASC, name ASC').where('"entries"."guideKey" = ?', params[:key]) || halt(404)
		# @guide_entries ||= Entry.order('entrytype ASC, name ASC').where('"entries"."guideKey" = ? AND "entries"."image" != ?', params[:key], "none") || halt(404)
		# @guide_entries ||= Entry.order('entrytype ASC, name ASC').where('"entries"."guideKey" = ? AND "entries"."image" != ? AND coalesce("entries"."image", \'\') != \'\'', params[:key], "none") || halt(404)
	end


	def entry_notes
		@entry_notes ||= Note.order('created_at ASC, updated_at ASC').where('"notes"."author" = ? AND "notes"."entry_id" = ?', params[:author], params[:entry]) || halt(404)
	end

end


get '/guide/:key/entries' do
	content_type 'application/json'

	key = params[:key]

	puts params[:debug]

	debug = params[:debug].to_bool
	puts debug ? "debug is true" : "debug is false"

	if key == "refuge"
		sorted = guide_entries.sort_by &:id
	else

		if debug == true
			puts "return all"
			sorted = guide_entries_all
		else 
			puts "return subset"
			sorted = guide_entries
		end

	end

	sorted.to_json
end


get '/guide/:key/entries/report' do

	if params[:key] == "gmc"
		erb :gmcreport
	else
		"#{params[:key]} report"
	end

end


# get a single entry for "today" functionality (per guide)
get '/guide/:key/entries/today' do
	content_type 'application/json'
	
	start_date = Date.new(2014, 7, 21)
	today = Date.today
	diff = (today-start_date).to_i
	idx = diff % guide_entries.length

	#production
	guide_entries[idx-1].to_json

end

get '/guide/:key/entries/today/random' do
	content_type 'application/json'
	
	l = guide_entries.length
	r = Random.new.rand(1..l)

	# puts "random number: " + r

	#production
	guide_entries[r-1].to_json

end



# notes
get '/entry/:entry/notes' do
	content_type 'application/json'
	#params entry, author

	entry_notes.to_json
end

post '/entry/:entry/addnote' do

	entry_idx = params[:entry]
	note_text = params[:text]
	author = params[:author]


	if entry_idx.nil? || author.nil? || note_text.nil? || note_text.empty?
		halt(400)
	else
		lastNote = Note.last
		nextid = lastNote.nil? ? 1 : lastNote.id + 1

		puts nextid

		note = Note.create(id: nextid, text: note_text, author: author, entry_id: entry_idx)

	end

end

post '/note/:id' do
	id = params[:id]
	note = Note.find(id)
	return status 404 if note.nil?

	note.delete
	status 202
end

#end notes processing



get '/guide/:key/addentry' do
	erb :add_form
end

post '/guide/:key/entry' do

	entry = nil

	name = params[:name]
	image = params[:image]
	filename = params[:datafile] if !params[:datafile].nil?
	content = params[:dfcontent]

	nextid = Entry.last.id + 1

	puts nextid.to_s

	if !name.nil?
		# puts "do stuff"
		entry = Entry.create(id: nextid, guideKey: params[:key], name: name)

		if !image.nil?
			entry.image = image
		end

		# puts content

		# if !filename.nil? && !filename.empty?
		# 	entry.data = filename[:tempfile].read
		# elseif !content.nil?
		# 	entry.data = content
		# end

		redirect '/guide/' + params[:key] + '/addentry?apikey=1138&added=' + entry.id.to_s
	else
		redirect '/guide/' + params[:key] + '/addentry?apikey=1138&error=Error adding new entry.'
	end

end

get '/guide/:key/editentries' do
	erb :db_form
end

post '/guide/:key/editentry' do

	id = params[:entry]

	Entry.update(id, { :image => params[:image], :name => params[:name], :entrytype => params[:entrytype]})

	filename = params[:datafile] if !params[:datafile].nil?
	dfcontent = params[:dfcontent]
	
	puts filename
	puts dfcontent

	if filename.nil?
		puts "leave entry alone"
	else
		if !dfcontent.nil? 
			puts "update entry with content: " + dfcontent
			Entry.update(id, :data => dfcontent)
		end

		if !filename.nil? && !filename.empty?
			puts "update entry with file"
			Entry.update(id, :data => filename[:tempfile].read)
		end
	end

	redirect '/guide/' + params[:key] + '/editentries?apikey=1138&edited=' + id.to_s
end

post '/guide/:key/deleteentry/:id' do
	id = params[:id]
	entry = Entry.find(id)
	return status 404 if entry.nil?

	entry.delete
	status 202

	redirect '/guide/' + params[:key] + '/editentries?apikey=1138&deleted=' + id.to_s

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