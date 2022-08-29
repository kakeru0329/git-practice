class Admin::GenresController < ApplicationController

 before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all

  end

  def edit
    @genre = Genre.find(params[:id])
  end
end
