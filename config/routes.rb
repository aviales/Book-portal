Rails.application.routes.draw do
  get 'books/available'
  get 'books/reserved'
  get 'books/bought'

  root 'books#available'

  get 'get_book/:book_id/:option', to: 'books#get_book', as: 'get_book_info'
  post 'reserve/:book_id', to: 'books#reserve_book', as: 'reserve_book'
  post 'unreserve/:book_id', to: 'books#unreserve_book', as: 'unreserve_book'
  post 'pay', to: 'books#pay_book', as: 'pay_book'
  delete 'delete/:book_id', to: 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
