class UsersController < ApplicationController
    before_action :authenticate_user!
    def profile
        @user = current_user
        @books = @user.books.where(status: 1)
    end
    
    def status0
        @user = current_user
        @book = Book.find(params[:id])
        respond_to do |format|
          if @book.update(user: nil, status: 0)
            @books = @user.books.where(status: 1)
            format.js { render nothing: true, notice: "Book was successfully reserverd." }
            format.html { redirect_to @book, notice: "Book was successfully updated." }
            format.json { render :show, status: :ok, location: @book }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @book.errors, status: :unprocessable_entity }
          end
        end
      end
end
