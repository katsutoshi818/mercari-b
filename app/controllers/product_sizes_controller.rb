class ProductSizesController < ApplicationController
  def index
    # paramsのsize_typeに基づいて、sizeテーブルからsize_typeが一致するレコードを取得する。
    category_type = Category.find(params[:low_category])[:size_type]
    respond_to do |format|
      format.json { @sizes = ProductSize.where("size_type LIKE(?)", category_type) }
    end
  end

  def new
    @sizes = ProductSize.where(size_type: params[:value])
    respond_to do |format|
    format.json { @sizes }
    end
  end

end
