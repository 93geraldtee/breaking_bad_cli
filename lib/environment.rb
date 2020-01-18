# environment file that requires all of the classes we build inside the ./lib/breaking_bad_cli folder

require 'rest-client'
require 'json'
require 'pry'

require_relative "./breaking_bad_cli/version"
require_relative './breaking_bad_cli/api'
require_relative './breaking_bad_cli/character'
require_relative './breaking_bad_cli/cli'
