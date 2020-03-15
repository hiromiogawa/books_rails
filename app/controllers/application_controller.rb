class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def read(result)
    title = result['title']
    author = result['author']
    isbn = result['isbn']
    genre = result['booksGenreId']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      title: title,
      author: author,
      isbn: isbn,
      genre: genre,
      image_url: image_url,
    }
  end
end