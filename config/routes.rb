Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'
  resources :password_resets, only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#frontpage'
  resources :sessions, only: [:new, :create, :destroy]
  get '/sessions/view/:id', to: 'sessions#view', as: 'view_public_playlist'
  get '/playlists/:id/playlist_broadcast', to: 'playlists#playlist_broadcast', as: 'playlist_broadcast'
  get '/playlists/:id/next_song', to: 'playlists#next_song', as: 'next_song'
  get '/playlists/:id/guestlist', to: 'playlists#guestlist', as: 'guestlist'
  get '/playlists/:playlist_id/suggestedsongs/access_token', to: 'suggestedsongs#access_token', as: 'access_token'
  get '/playlists/:playlist_id/suggestedsongs/get_album', to: 'suggestedsongs#get_album', as: 'get_album'
  get '/playlists/:playlist_id/suggestedsongs/get_artist', to: 'suggestedsongs#get_artist', as: 'get_artist'
  get '/playlists/:id/update_song/', to: 'playlists#update_song', as: 'update_song'
  get '/playlists/:id/update_song_playing/', to: 'playlists#update_song_playing', as: 'update_song_playing'
  get '/playlists/join', to: 'playlists#join', as: 'join'
  get '/playlists/player', to: 'playlists#player'
  post '/playlists/add_guest', to: 'playlists#add_guest', as: 'add_guest'
  post 'playlists/:id/update_authorization', to: 'playlists#update_authorization', as: 'update_authorization'
  post '/playlists/:id/update_publicity', to: 'playlists#update_publicity', as: 'update_publicity'
  resources :account_activations, only: [:edit]

  mount ActionCable.server => '/cable'
  get '/auth/deezer/callback', to: 'sessions#frontpage'

  resources :users
  resources :playlists do
    resources :suggestedsongs do
      resources :votes
    end
  end

end
