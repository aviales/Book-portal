class BooksController < ApplicationController
  def available
    @books = Book.where(status: 0)
  end

  def reserved
    @books = Book.where(status: 1)
  end

  def bought
    @books = Book.where(status: 2)
  end

  def get_book
    @book = Book.find(params[:book_id])
    @type = params[:option]
  end

  def reserve_book
    sleep 2
    @book = Book.find(params[:book_id])
    @book.status = 1
    @book.save
    @books = Book.where(status: 0)
  end

  def unreserve_book
    @book = Book.find(params[:book_id])
    @book.status = 0
    @book.save
    @books = Book.where(status: 1)
  end

  def pay_book
    @book = Book.find(params[:book][:book_id].to_i)
    if (Time.now.utc - @book.updated_at.utc).to_i > 20
      @book.status = 0
    else
      @book.status = 2
    end

    @book.save
    @books = Book.where(status: 1)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book.destroy
    @books = Book.where(status: 2)
  end
end
