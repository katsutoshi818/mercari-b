class CategoriesController < ApplicationController
  before_action :set_category_brand, only: [:show, :new]

  def index
    # @categories = Category.where("category_name LIKE(?)", "#{params[:value]}")
    # ancestryのアソシエーションっぽい機能を使って、もらったカテゴリーの子カテゴリーを検索して配列に入れる。
    category_id = params[:value]
    @parent = Category.find(category_id)
    @children = @parent.children
    respond_to do |format|
      format.json { render 'index', formats: 'json', handlers: 'jbuilder' }
    end
  end

  def new
  end

  def show
    @category = Category.find(params[:id])
    if @category.children.empty?
      @item = @category
    else
      @children = @category.children
    end

  end

  def search
    
  end


  private

  def set_category_brand
    @brands = Brand.all
    @parents = Category.where(ancestry: nil)
    @parent = Category.find_by('category_name LIKE(?)', "%#{params[:keyword]}%")
    @children = @parent.children
    respond_to do |format|
      format.json
      format.html
    end
  end

end
