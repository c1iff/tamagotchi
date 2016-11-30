require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

get('/') do
  @monsters = Tamagotchi.all
  erb(:index)
end

get('/create_monster') do
  @current_monster = Tamagotchi.new(params.fetch('new_monster'))
  @current_monster.time_passes()
  @current_monster.save()
  @monsters = Tamagotchi.all
   erb(:index)
end

get('/monster/:doggy') do
  @monsters = Tamagotchi.all
  @monsters.each() do |monster|

    if monster.name == params.fetch('doggy')
      @@monster_to_view = monster
    end
  end
  erb(:output)
end

get('/clear') do
  @monsters = Tamagotchi.clear()
  erb(:index)
end

get('/feed_monster') do
  @@monster_to_view.feed((params.fetch("feed_monster").to_i)
  erb(:output)
end

get('/play') do
  @@monster_to_view.play(params.fetch("play_monster").to_i)
  erb(:output)
end

get('/sleep') do
  @@monster_to_view.sleep(params.fetch("sleep_monster").to_i)
  erb(:output)
end
