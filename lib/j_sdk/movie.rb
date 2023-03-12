module JSdk
    class Movie
        attr_reader :id, :name, :runtimeInMinutes, :budgetInMillions, :boxOfficeRevenueInMillions, :academyAwardNominations, :academyAwardWins, :rottenTomatoesScore, :client

        def initialize(id, name, runtimeInMinutes, budgetInMillions, boxOfficeRevenueInMillions, academyAwardNominations, academyAwardWins, rottenTomatoesScore, client)
            @id = id
            @name = name
            @runtimeInMinutes = runtimeInMinutes
            @budgetInMillions = budgetInMillions
            @boxOfficeRevenueInMillions = boxOfficeRevenueInMillions
            @academyAwardNominations = academyAwardNominations
            @academyAwardWins = academyAwardWins
            @rottenTomatoesScore = rottenTomatoesScore
            @client = client
        end

        def get_quotes(limit=10, page=0)
            @client.get_quotes(self.id, limit, page)
        end
    end
end