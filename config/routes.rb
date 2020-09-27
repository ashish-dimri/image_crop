Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'image_crop#index'

  get 'image_crop/index'
  post 'image_crop/create'
  get 'image_crop/new'
  get 'image_crop/:id' => 'image_crop#show', as: 'image_crop'

  get 'cropper/index'
  post 'cropper/create'
  get 'cropper/new'

end
