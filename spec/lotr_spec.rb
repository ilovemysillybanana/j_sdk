require "spec_helper"
require "vcr"
require 'webmock/rspec'

VCR.configure do |config|
    config.cassette_library_dir = "fixtures/cassettes"
    config.hook_into :webmock
    config.configure_rspec_metadata!
end

RSpec.describe JSdk::LOTR do
    let(:app) { JSdk::LOTR.new(ENV['ONE_API_KEY']) }

    describe "#get_movies()" do
        it "returns an array of movies" do
            response = VCR.use_cassette('get_movies') do
                app.get_movies()
            end
            expect(response.is_a?(Array)).to eq true
            expect(response[0].class.name).to eq "JSdk::Movie"
        end
    end

    describe "#get_movie('5cd95395de30eff6ebccde5b')" do
        it "returns a single movie's data" do
            response = VCR.use_cassette('get_movie-5cd95395de30eff6ebccde5b') do
                app.get_movie('5cd95395de30eff6ebccde5b')
            end

            expect(response.class.name).to eq "JSdk::Movie"
            expect(response.name).to eq "The Two Towers"
            expect(response.academyAwardNominations).to eq 6
            expect(response.academyAwardWins).to eq 2
            expect(response.boxOfficeRevenueInMillions).to eq 926
            expect(response.budgetInMillions).to eq 94
            expect(response.rottenTomatoesScore).to eq 96
            expect(response.runtimeInMinutes).to eq 179
        end
    end

    describe "#get_quotes(5cd95395de30eff6ebccde5b)" do
        it "returns the quotes from a given film - only works for original triology" do
            response = VCR.use_cassette("get_quotes-5cd95395de30eff6ebccde5b") do
                movie = app.get_movie('5cd95395de30eff6ebccde5b')
                app.get_quotes(movie.id)
            end

            expect(response.size).to eq 10
            expect(response[0].dialog.is_a?(String)).to eq true
            expect(response[0].movie_id).to eq '5cd95395de30eff6ebccde5b'
            expect(response[0].character_id).to eq '5cd99d4bde30eff6ebccfea0'
        end
    end

    describe "#get_quotes(5cd95395de30eff6ebccde56)" do
        it "returns an empty array for movies without quotes" do
            response = VCR.use_cassette("get_quotes-5cd95395de30eff6ebccde56") do
                movie = app.get_movie('5cd95395de30eff6ebccde56')
                app.get_quotes(movie.id)
            end

            expect(response.size).to eq 0
            expect(response).to eq []
        end
    end
end