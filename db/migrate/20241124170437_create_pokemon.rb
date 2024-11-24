class CreatePokemon < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :origin
      t.string :name
      t.string :weight
      t.text :types
      t.text :stats
      t.string :consulted_at
      t.string :date

      t.timestamps
    end
  end
end
