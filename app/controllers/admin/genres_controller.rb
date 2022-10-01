class Admin::GenresController < ApplicationController

 before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page]).per(8)

  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
      @genre.save
      @genres = Genre.all
      redirect_to admin_genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       flash[:notice] = "変更内容を更新しました。"
       redirect_to admin_genres_path
    else
       flash[:notice] = "変更内容に不備があります。"
       render edit_admin_genre_path
    end
  end

  private

	def genre_params
	  params.require(:genre).permit(:name)
	end

end
