require 'net/http'
require 'json'

# frozen_string_literal: true

require_relative "j_sdk/version"
require_relative "j_sdk/quote"
require_relative "j_sdk/lotr"
require_relative "j_sdk/movie"

module JSdk
  class Error < StandardError; end
  # Your code goes here...
end
