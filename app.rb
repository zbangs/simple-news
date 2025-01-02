require "sinatra"
require "sinatra/reloader"

require "dotenv/load"
require "http"
require "json"

news_api_key = ENV.fetch("NEWS_API_KEY")
news_api_url = "https://newsapi.org/v2"

set :public_folder, __dir__ + '/'

get("/") do
  redirect("/top-headlines")
end

get("/top-headlines") do
  news_api_url += "/top-headlines?"

  erb(:top_headlines)
end

get("/random") do
  erb(:random_result)
end

get("/search-result") do
  news_api_url += "/everything?"

  erb(:search_result)
end
