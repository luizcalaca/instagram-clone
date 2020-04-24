require 'rest-client'
require 'json'

class GithubAPI
    
    def initialize
        @url = 'https://api.github.com/search/repositories?'
        @q = 'spotcode'
        @language = 'ruby'
    end

    def self.consumeAPIGithub
        url = 'https://api.github.com/search/repositories?'
        q = 'spotcode'
        language = 'ruby'
        resp = RestClient.get "#{url}q=#{q}&language=#{language}"
        puts JSON.parse(resp.body)["items"][2]["description"]
    end

end

#puts GithubAPI::consumeAPIGithub