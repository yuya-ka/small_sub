class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = current_user.favorites.build(product_id: params[:product_id])
    if @favorite.save
      redirect_to products_path, notice: 'お気に入りに追加しました'
    else
      redirect_to products_path, alert: 'お気に入りに追加できませんでした'
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    if @favorite&.destroy
      redirect_to favorites_path, notice: 'お気に入りから削除しました'
    else
      redirect_to favorites_path, alert: 'お気に入りから削除できませんでした'
    end
  end
end
