### Basic Setup.

1.- Run bundle install.

2.- Then rails db:setup.

3.- Lastly just rails s and make all the request that you want in your local with the following URI:

```ruby
http://localhost:3000/api/v1/pokemon?pokemon_name=your_pokemon_name
```