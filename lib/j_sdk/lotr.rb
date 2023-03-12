module JSdk
    # @@api_token = "TOKEN_VALUE"

    # def self.token()
    #     @@api_token
    # end

    # def self.set_token(token)
    #     @@api_token = token
    # end

    class LOTR
        attr_accessor :token

        BASE_URL = "https://the-one-api.dev/v2"

        def initialize(token)
            @token = token
        end

        def get_movies()
            uri = URI("#{BASE_URL}/movie")
            res = Net::HTTP.get_response(uri, headers)
            data = JSON.parse(res.body)['docs']
            movies = data.map do |mv|
                Movie.new(
                    mv['_id'],
                    mv['name'],
                    mv['runtimeInMinutes'],
                    mv['budgetInMillions'],
                    mv['boxOfficeRevenueInMillions'],
                    mv['academyAwardNominations'],
                    mv['academyAwardWins'],
                    mv['rottenTomatoesScore'],
                    self
                )
            end
        end

        def get_movie(id)
            uri = URI("#{BASE_URL}/movie/#{id}")
            res = Net::HTTP.get_response(uri, headers)
            data = JSON.parse(res.body)['docs'][0]
            movie = Movie.new(
                data['_id'],
                data['name'],
                data['runtimeInMinutes'],
                data['budgetInMillions'],
                data['boxOfficeRevenueInMillions'],
                data['academyAwardNominations'],
                data['academyAwardWins'],
                data['rottenTomatoesScore'],
                self
            )
        end

        def get_quotes(id, limit=10, page=0)
            uri = URI("#{BASE_URL}/movie/#{id}/quote?limit=10")
            res = Net::HTTP.get_response(uri, headers)
            data = JSON.parse(res.body)['docs']
            quotes = data.map do |quote|
                Quote.new(
                    quote['id'],
                    quote['dialog'],
                    quote['movie'],
                    quote['character'],
                    self
                )
            end
        end

        private
        def headers()
            { 'Authorization' => "Bearer #{token}" }
        end
    end
end