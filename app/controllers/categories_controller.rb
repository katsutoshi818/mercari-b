class CategoriesController < ApplicationController

  def index
    # @categories = Category.where("category_name LIKE(?)", "#{params[:value]}")
    # ancestryのアソシエーションっぽい機能を使って、もらったカテゴリーの子カテゴリーを検索して配列に入れる。
    category_id = params[:value]
    @children = Category.find(category_id).children
    respond_to do |format|
      format.json { render 'index', formats: 'json', handlers: 'jbuilder' }
    end
  end
end
