require 'faker'
# require 'virtus'
require 'elasticsearch/persistence'

class Repository
  include Elasticsearch::Persistence::Repository
  include Elasticsearch::Persistence::Repository::DSL

  index_name 'players'
  document_type '_doc'
end

repository = Repository.new

puts 'Feeding ES, please wait...'

1000.times do
  repository.save(
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      nick_name: Faker::Games::Dota.player,
      team_name: Faker::Team.name,
    }
  )
end
