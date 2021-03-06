class Brand < ApplicationRecord
  belongs_to :category
  has_many :products
  validates :brand_name, presence: true, uniqueness: true

  def brand_registration(brand_input)
    # その名前のブランドが存在するか調べる。
    brand = Brand.find_by('brand_name LIKE(?)', brand_input[:brand_name])
    # 入力されたブランドが存在しない場合、テーブルにブランドを登録する
    brand ||= Brand.create(brand_name: brand_input[:brand_name], category_id: brand_input[:category_id])
    return brand[:id]
  end
end
