class PokemonStoreJob < ApplicationJob
  attr_reader :pokemon

  def initialize(pokemon)
    @pokemon = pokemon
  end

  def perform
    create_pokemon
  end

  private

  def create_pokemon
    Pokemon.create(
      origin: pokemon[:origin],
      name: pokemon[:name],
      weight: pokemon[:weight],
      types: pokemon[:types],
      stats: pokemon[:stats],
      consulted_at: pokemon[:consulted_at]
    )
  end
end
