class BooksController < ApplicationController
    #before_action :set_book, only: [:index]

    def index
        @books = Book.all
        #res.render('index', locals: { books: @books })
        render :index
    end

    def create 
        @book = Book.new(book_params)
        if @book.save
          redirect_to @book
        else
          # This line overrides the default rendering behavior, which
          # would have been to render the "create" view.
          render "new"      
        end
    end

     def show
        @book = set_book
     end

    def edit
        @book = set_book
    end
     
    def update
        @book =set_book
        if @book.update(book_params)
        redirect_to(@book)
        else
        render "edit"
        end
    end

    def destroy
        @book=set_book
        @book.destroy
        redirect_to ("/books")
    end

     private 
     def book_params
        params.require(:book).permit(:title, :price, :subject_id, :description)
     end

     def set_book
        @book = Book.find(params[:id])
      end
end
