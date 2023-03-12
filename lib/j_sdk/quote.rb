module JSdk
    class Quote
        attr_reader :id, :dialog, :movie_id, :character_id, :client

        def initialize(id, dialog, movie_id, character_id, client)
            @id = id
            @dialog = dialog
            @movie_id = movie_id
            @character_id = character_id
            @client = client
        end
    end
end