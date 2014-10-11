require_relative 'session_actions'
require_relative 'docs_actions'
require_relative 'users_actions'

# Homepage (Root path)

get '/' do
  erb :index
end
