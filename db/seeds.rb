# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Playlist.destroy_all
SuggestedSong.destroy_all

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password',
  )
end

50.times do
  Playlist.create!(
    name: Faker::App.name,
    description: "Let's Party!",
    theme: ['Pop', 'Alternative', 'Dance', 'Folk', 'Instrumental', 'Chill', 'Party', 'Blues', 'House/EDM', 'Rock', 'Rap', 'Hip-Hop', 'R&B', 'Electronic', 'Indie', 'Jazz', 'Reggae', 'Country', 'Other'].sample,
    access_code: Playlist.create_access_code,
    song_limit: 1000,
    public: true,
  )
end

500.times do
  song = SuggestedSong.random_song
  SuggestedSong.create!(
    song_id: rand(3135500..3136000),
    playlist_id: rand(1..50),
    user_id: rand(1..10),
    name: Faker::Name.title,
    net_vote: rand(1..10),
    artist: Faker::RockBand.name,
    user_name: Faker::Name.first_name,
    status: 'que',
  )
end
