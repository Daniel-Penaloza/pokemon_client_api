module WebServices
  class PokemonConnection
    def client(read_timeout = 30)
      Faraday.new(url: 'https://pokeapi.co/api/v2/') do |conn|
        conn.options.open_timeout = 10
        conn.options.read_timeout = read_timeout
        conn.request :json
        conn.response :logger, nil, { headers: false, bodies: false, errors: false }
        conn.response :json
        conn.adapter :net_http
      end
    end

    def get_pokemon(pokemon_name:)
      response = client.get("pokemon/#{pokemon_name}")
      return create_pokemon(response.body)
    rescue Faraday::Error => e
      { 'error' => e }
    end

    private

    def create_pokemon(body)
      {
        'name': body['name'],
        'weight': body['weight'],
        'types': type(body['types']),
        'stats': stats(body['stats'])
      }
    end

    def stats(stats)
      stats.each_with_object([]) do |stat, array|
        array << "#{stat.dig('stat', 'name')}: #{stat['base_stat']}"
      end
    end

    def type(types)
      types = types.map { |type| type.dig('type', 'name') }
    end
  end
end
