require "pry"
require "open-uri"
require "json"
require 'rubygems'


class PokeScript
	attr_reader :hashy_hashy
	attr_accessor :my_civic_data

	def initialize
		@final_poke_array = []
		catch_them_all
		write_txt
	end

	def catch_them_all
		current_pokemon_index = 1
		while current_pokemon_index < 151
			poke_ball_go(current_pokemon_index)
			current_pokemon_index += 1
		end
	end

	def poke_ball_go(index)
		pokeApi = "http://pokeapi.co/api/v2/pokemon/#{index}"
		pokemon_hashy = JSON.load(open(pokeApi))
		@final_poke_array << pokemon_hashy
	end

	def write_txt
		File.open("pokemon.json", "w+") do |f|
  		f.write(@final_poke_array.to_json)
		end
	end
	
end