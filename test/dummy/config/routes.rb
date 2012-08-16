Rails.application.routes.draw do

  get "accueil/index"

  root :to => "accueil#index"

  mount TolkEngine::Engine => "/tolk_engine"


end
