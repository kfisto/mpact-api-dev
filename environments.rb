configure :development do
	set :database, 'sqlite3:dev.db'
	set :show_exceptions, true
end

configure :production do
	db = URI.parse(ENV['HEROKU_POSTGRESQL_GOLD_URL'])

	ActiveRecord::Base.establish_connection(
		:adapter => db.scheme == 'postgres' ? 'postgressql' : db.scheme,
		:host => db.host,
		:username => db.user,
		:password => db.password,
		:database => db.path[1..-1],
		:encoding => 'utf8'
	)
end