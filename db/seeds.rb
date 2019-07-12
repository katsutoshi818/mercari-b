# coding: utf-8

user1 = User.create(nickname: '仮太郎', email: 'test1@gmail.com', password: 12345678, phone_number: "1122223333")
user2 = User.create(nickname: '金太郎', email: 'test2@gmail.com', password: 12345678, phone_number: "1111111111")
user3 = User.create(nickname: '子太郎', email: 'test3@gmail.com', password: 12345678, phone_number: "1122222222")
User.create(nickname: '花子', email: 'test4@gmail.com', password: 12345678, phone_number: "1133333333")
User.create(nickname: '菊子', email: 'test5@gmail.com', password: 12345678, phone_number: "1144444444")
User.create(nickname: '幸子', email: 'test6@gmail.com', password: 12345678, phone_number: "1155555555")
profile1 = Profile.create(user_id: 1, first_name: '仮', last_name: '太郎', first_name_katakana: 'カリ', last_name_katakana: 'タロウ', birthday: 20000101, postal_code: 1112222, prefecture_id: 1, city: '名古屋市', address: '栄4-5', building: "", introduction: 'こんにちは', avatar: 'https://pbs.twimg.com/profile_images/1068067146201149441/mdA4ZSRj_400x400.jpg', point: 200)
Profile.create(user_id: 2, first_name: '金', last_name: '太郎', first_name_katakana: 'キン', last_name_katakana: 'タロウ', birthday: 20000101, postal_code: 1112222, prefecture_id: 7, city: '松本市', address: '松本城', building: "天守閣", introduction: 'こんにちは', avatar: 'https://stat.ameba.jp/user_images/20190114/14/hiackl-4/25/57/p/o0320024014338711118.png?caw=800', point: 0)
profile3 = Profile.create(user_id: 3, first_name: '子', last_name: '太郎', first_name_katakana: 'コ', last_name_katakana: 'タロウ', birthday: 20000101, postal_code: 1112222, prefecture_id: 31, city: '熊本市', address: '熊本城', building: "正門守衛室", introduction: 'こんにちは', avatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx2ZdpsC676bWEko3mavn7HnqPlVHtJvxzERaq6GKFSgUoRaUbWQ', point: 50)
Profile.create(user_id: 4, first_name: '花', last_name: '子', first_name_katakana: 'ハナ', last_name_katakana: 'コ', birthday: 20000101, postal_code: 1112222, prefecture_id: 15, city: '那覇市', address: '首里城', building: "駐車場", introduction: 'こんにちは', avatar: 'https://appmedia.jp/wp-content/uploads/2017/04/62e15f764088afdec8cca5ad44ede73a.jpg', point: 1000)
Profile.create(user_id: 5, first_name: '菊', last_name: '子', first_name_katakana: 'キク', last_name_katakana: 'コ', birthday: 20000101, postal_code: 1112222, prefecture_id: 7, city: '弘前市', address: '弘前城', building: "客間", introduction: 'こんにちは', avatar: 'https://gamewith.akamaized.net/article/thumbnail/rectangle/36550.png', point: 150)
Profile.create(user_id: 6, first_name: '幸', last_name: '子', first_name_katakana: 'サチ', last_name_katakana: 'コ', birthday: 20000101, postal_code: 1112222, prefecture_id: 22, city: '姫路市', address: '姫路城', building: "中央広場", introduction: 'こんにちは', avatar: 'https://images-fe.ssl-images-amazon.com/images/I/41PMAH6kJGL._SX300_QL70_.jpg', point: 0)
Addressee.create(user_id: 1, first_name: '仮', last_name: '太郎', first_name_katakana: 'カリ', last_name_katakana: 'タロウ', postal_code: "1112222", prefecture_id: 1, city: '名古屋市', address: '栄4-5', building: "中日ビル", phonenumber: "1111111111")
Addressee.create(user_id: 2, first_name: '金', last_name: '太郎', first_name_katakana: 'キン', last_name_katakana: 'タロウ', postal_code: "1112222", prefecture_id: 7, city: '松本市', address: '松本城', building: "天守閣", phonenumber: "1122222222")
Addressee.create(user_id: 3, first_name: '子', last_name: '太郎', first_name_katakana: 'コ', last_name_katakana: 'タロウ', postal_code: "1112222", prefecture_id: 31, city: '熊本市', address: '熊本城', building: "正門守衛室", phonenumber: "1133333333")
Addressee.create(user_id: 4, first_name: '花', last_name: '子', first_name_katakana: 'ハナ', last_name_katakana: 'コ', postal_code: "1112222", prefecture_id: 15, city: '那覇市', address: '首里城', building: "駐車場", phonenumber: "1144444444")
Addressee.create(user_id: 5, first_name: '菊', last_name: '子', first_name_katakana: 'キク', last_name_katakana: 'コ', postal_code: "1112222", prefecture_id: 7, city: '弘前市', address: '弘前城', building: "客間", phonenumber: "1155555555")
Addressee.create(user_id: 6, first_name: '幸', last_name: '子', first_name_katakana: 'サチ', last_name_katakana: 'コ', postal_code: "1112222", prefecture_id: 22, city: '姫路市', address: '姫路城', building: "中央広場", phonenumber: "1166666666")
lady = Category.create(category_name: "レディース")
men = Category.create(category_name: "メンズ")
kids = Category.create(category_name: "ベビー・キッズ")
interior = Category.create(category_name: "インテリア・住まい・小物")
Category.create(category_name: "インテリア・住まい・小物")
Category.create(category_name: "本・音楽・ゲーム")
Category.create(category_name: "コスメ・香水・美容")
Category.create(category_name: "家電・スマホ・カメラ")
Category.create(category_name: "スポーツ・レジャー")
Category.create(category_name: "ハンドメイド")
Category.create(category_name: "チケット")
Category.create(category_name: "自動車・オートバイ")
Category.create(category_name: "その他")
lady_tops = lady.children.create(category_name: "トップス")
lady_outer = lady.children.create(category_name: "ジャケット/アウター")
lady_pants = lady.children.create(category_name: "パンツ")
lady_scart = lady.children.create(category_name: "スカート")
lady_onepeace = lady.children.create(category_name: "ワンピース")
lady_shoes = lady.children.create(category_name: "靴")
lady_bag = lady.children.create(category_name: "バッグ")
lady_acce = lady.children.create(category_name: "アクセサリー")
lady_komono = lady.children.create(category_name: "小物")
lady_t_shirt = lady_tops.children.create(category_name: "Tシャツ/カットソー(七分/長袖)")
lady_t_shirt2 = lady_tops.children.create(category_name: "Tシャツ/カットソー(半袖/袖なし)")
lady_shirt = lady_tops.children.create(category_name: "シャツ/ブラウス(七分/長袖)")
lady_shirt2 = lady_tops.children.create(category_name: "シャツ/ブラウス(七分/長袖)")
lady_poro_shirt = lady_tops.children.create(category_name: "ポロシャツ")
lady_nit = lady_tops.children.create(category_name: "ニット/セーター")
lady_parkar = lady_tops.children.create(category_name: "パーカー")
lady_jersey = lady_tops.children.create(category_name: "ジャージ")
lady_other = lady_tops.children.create(category_name: "その他")
lady_t_jacket = lady_outer.children.create(category_name: "テーラードジャケット")
lady_n_jacket = lady_outer.children.create(category_name: "ノーカラージャケット")
lady_g_jacket = lady_outer.children.create(category_name: "Gジャン/デニムジャケット")
lady_l_jacket = lady_outer.children.create(category_name: "レザージャケット")
lady_coat = lady_outer.children.create(category_name: "コート")
lady_outer_other = lady_outer.children.create(category_name: "その他")
lady_d_pant = lady_pants.children.create(category_name: "デニム")
lady_s_pant = lady_pants.children.create(category_name: "ショートパンツ")
lady_w_pant = lady_pants.children.create(category_name: "ワークパンツ")
lady_c_pant = lady_pants.children.create(category_name: "チノパン")
lady_o_pant = lady_pants.children.create(category_name: "オーバーオール")
lady_pant_other = lady_pants.children.create(category_name: "その他")
lady_m_scart = lady_scart.children.create(category_name: "ミニスカート")
lady_h_scart = lady_scart.children.create(category_name: "ひざ丈スカート")
lady_l_scart = lady_scart.children.create(category_name: "ロングスカート")
lady_k_scart = lady_scart.children.create(category_name: "キュロット")
lady_scart_other = lady_scart.children.create(category_name: "その他")
lady_m_onepeace = lady_onepeace.children.create(category_name: "ミニワンピース")
lady_h_onepeace = lady_onepeace.children.create(category_name: "ひざ丈ワンピース")
lady_l_onepeace = lady_onepeace.children.create(category_name: "ロングワンピース")
lady_onepeace_other = lady_onepeace.children.create(category_name: "その他")
lady_h_shoes = lady_shoes.children.create(category_name: "ハイヒール/パンプス")
lady_b_shoes = lady_shoes.children.create(category_name: "ブーツ")
lady_s_shoes = lady_shoes.children.create(category_name: "スニーカー")
lady_sn_shoes = lady_shoes.children.create(category_name: "サンダル")
lady_shoes_other = lady_shoes.children.create(category_name: "その他")
lady_h_bag = lady_bag.children.create(category_name: "ハンドバック")
lady_t_bag = lady_bag.children.create(category_name: "トートバック")
lady_b_bag = lady_bag.children.create(category_name: "ボストンバック")
lady_r_bag = lady_bag.children.create(category_name: "リュックサック")
lady_bag_other = lady_bag.children.create(category_name: "その他")
lady_n_acce = lady_acce.children.create(category_name: "ネックレス")
lady_b_acce = lady_acce.children.create(category_name: "ブレスレット")
lady_p_acce = lady_acce.children.create(category_name: "ピアス")
lady_e_acce = lady_acce.children.create(category_name: "イヤリング")
lady_acce_other = lady_acce.children.create(category_name: "その他")
lady_n_komono = lady_komono.children.create(category_name: "長財布")
lady_o_komono = lady_komono.children.create(category_name: "折りたたみ財布")
lady_c_komono = lady_komono.children.create(category_name: "コインケース")
lady_komono_other = lady_komono.children.create(category_name: "その他")
kitchin = interior.children.create(category_name: "キッチン/食器")
shokki = kitchin.children.create(category_name: "食器")
kigu = kitchin.children.create(category_name: "調理器具")
shuno = kitchin.children.create(category_name: "収納/キッチン雑貨")
bento = kitchin.children.create(category_name: "弁当用品")
kitchin_other = kitchin.children.create(category_name: "その他")
bed = interior.children.create(category_name: "ベッド/寝具")
s_size = bed.children.create(category_name: "シングル")
sd_size = bed.children.create(category_name: "セミダブル")
d_size = bed.children.create(category_name: "ダブル")
q_size = bed.children.create(category_name: "クイーン")
k_size = bed.children.create(category_name: "キング")
bed_other = bed.children.create(category_name: "その他")
sofa = interior.children.create(category_name: "ソファー/椅子")
s_sofa = sofa.children.create(category_name: "シングルサイズ")
d_sofa = sofa.children.create(category_name: "ダブルサイズ")
t_sofa = sofa.children.create(category_name: "トリプルサイズ")
sofa_other = sofa.children.create(category_name: "その他")
brand_n = Brand.create(category_id: lady_t_shirt.id, brand_name: "ナイキ")
brand_a = Brand.create(category_id: lady_t_shirt.id, brand_name: "アシックス")
brand_m = Brand.create(category_id: s_sofa.id, brand_name: "マリメッコ")
Brand.create(category_id: lady_parkar.id, brand_name: "ナイキ")
Brand.create(category_id: lady_jersey.id, brand_name: "ナイキ")
Brand.create(category_id: lady_s_shoes.id, brand_name: "ナイキ")
product1 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_n.id, category_id: brand_n.category_id, product_name: "ナイキのTシャツ",introduction: "ナイキのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 1000, trade_state: 0, way_to_ship: 0)
ProductImage.create!(product_id: product1.id, image: open("https://sc3.locondo.jp/contents/commodity/shop/SALP0482D/commodity/NI/NI1757EW17931_1_l.jpg"))
ProductImage.create(product_id: product1.id, image: open("https://sc3.locondo.jp/contents/commodity/shop/SALP0482D/commodity/NI/NI1757EW17931_1_l.jpg"))
ProductImage.create(product_id: product1.id, image: open("https://sc3.locondo.jp/contents/commodity/shop/SALP0482D/commodity/NI/NI1757EW20405_1_l.jpg"))
product2 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_n.id, category_id: brand_n.category_id, product_name: "Tシャツ",introduction: "ナイキのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 600, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product2.id, image: open("https://sc3.locondo.jp/contents/commodity/shop/SALP0482D/commodity/NI/NI1757EW20405_1_l.jpg"))
ProductImage.create(product_id: product2.id, image: open("https://tshop.r10s.jp/apworld/cabinet/cm/201905/aj8122_001.jpg?fitin=275:275"))
ProductImage.create(product_id: product2.id, image: open("https://cdn.thumb.shop-list.com/res/up/shoplist/shp/__basethum900__/birigo/birigo/cabinet/toppage/puma/kids/puma-824828.jpg"))
ProductImage.create(product_id: product2.id, image: open("https://item-shopping.c.yimg.jp/i/j/elephant_846469"))
ProductImage.create(product_id: product2.id, image: open("https://ic4-a.wowma.net/mis/gr/114/image.wowma.jp/41182128/1904/bq3709_1.jpg"))
ProductImage.create(product_id: product2.id, image: open("https://images-na.ssl-images-amazon.com/images/I/71BlaTe2azL._UX385_.jpg"))
product3 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_n.id, category_id: brand_n.category_id, product_name: "カットソー",introduction: "ナイキのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 800, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product3.id, image: open("https://sc3.locondo.jp/contents/commodity/shop/SALP0482D/commodity/NI/NI1757EW17931_1_l.jpg"))
product4 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_n.id, category_id: brand_n.category_id, product_name: "Tシャツ(ナイキ)",introduction: "ナイキのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 450, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product4.id, image: open("https://sc3.locondo.jp/contents/commodity/shop/SALP0482D/commodity/NI/NI1757EW20405_1_l.jpg"))
product5 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_n.id, category_id: brand_n.category_id, product_name: "ナイキ(Tシャツ)",introduction: "ナイキのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 1070, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product5.id, image: open("https://tshop.r10s.jp/apworld/cabinet/cm/201905/aj8122_001.jpg?fitin=275:275"))
product6 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_n.id, category_id: brand_n.category_id, product_name: "ただのTシャツ",introduction: "ナイキのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 670, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product6.id, image: open("https://cdn.thumb.shop-list.com/res/up/shoplist/shp/__basethum900__/birigo/birigo/cabinet/toppage/puma/kids/puma-824828.jpg"))
product7 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_n.id, category_id: brand_n.category_id, product_name: "ただのTシャツ",introduction: "ナイキのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 540, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product7.id, image: open("https://item-shopping.c.yimg.jp/i/j/elephant_846469"))
product8 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_a.id, category_id: brand_a.category_id, product_name: "Tシャツ",introduction: "アシックスのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 700, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product8.id, image: open("https://img.fril.jp/img/152063460/l/433042809.jpg?1528986047"))
ProductImage.create(product_id: product8.id, image: open("https://www.sports-ws.com/img/item/F123AS0/F123AS0177.jpg"))
ProductImage.create(product_id: product8.id, image: open("https://www.sports-ws.com/img/item/F123AS0/F123AS0175.jpg"))
ProductImage.create(product_id: product8.id, image: open("https://image1.shopserve.jp/volleyball-assist.com/pic-labo/llimg/2031a664.jpg"))
ProductImage.create(product_id: product8.id, image: open("http://www.asesoriaseinversion.com/images/goods/asi-xxl525.jpg"))
product9 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_a.id, category_id: brand_a.category_id, product_name: "Tシャツ",introduction: "アシックスのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 490, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product9.id, image: open("https://image1.shopserve.jp/volleyball-assist.com/pic-labo/llimg/2031a664.jpg"))
product10 = Product.create(seller_user_id: user1.id, buyer_user_id: user2.id, brand_id: brand_a.id, category_id: brand_a.category_id, product_name: "Tシャツ",introduction: "アシックスのTシャツです！ もう着ないので誰か着てください", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile1.prefecture_id, days_to_ship: 0, price: 2500, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product10.id, image: open("https://www.sports-ws.com/img/item/F123AS0/F123AS0177.jpg"))
product11 = Product.create!(seller_user_id: user3.id, buyer_user_id: user2.id, brand_id: brand_m.id, category_id: brand_m.category_id, product_name: "ソファー",introduction: "粗大ゴミです", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile3.prefecture_id, days_to_ship: 0, price: 10800, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product11.id, image: open("https://www.idc-otsuka.jp/item/3psofa/3psofa454/images/thumb_01z.jpg"))
ProductImage.create(product_id: product11.id, image: open("https://www.idc-otsuka.jp/item/3psofa/3psofa454/images/thumb_02z.jpg"))
ProductImage.create(product_id: product11.id, image: open("https://www.idc-otsuka.jp/item/3psofa/3psofa454/images/thumb_03z.jpg"))
product12 = Product.create(seller_user_id: user3.id, buyer_user_id: user2.id, brand_id: brand_m.id, category_id: brand_m.category_id, product_name: "ソファー",introduction: "粗大ゴミです", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile3.prefecture_id, days_to_ship: 0, price: 10800, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product12.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/5635015/646X1000/563501501.jpg"))
ProductImage.create(product_id: product12.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/5635015/646X1000/563501502.jpg"))
ProductImage.create(product_id: product12.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/5635015/646X1000/563501508.jpg"))
product13 = Product.create(seller_user_id: user3.id, buyer_user_id: user2.id, brand_id: brand_m.id, category_id: brand_m.category_id, product_name: "ソファー",introduction: "粗大ゴミです", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile3.prefecture_id, days_to_ship: 0, price: 10800, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product13.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/1210194/646X1000/121019401.jpg"))
ProductImage.create(product_id: product13.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/1210194/646X1000/121019402.jpg"))
ProductImage.create(product_id: product13.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/1210194/646X1000/121019403.jpg"))
product14 = Product.create(seller_user_id: user3.id, buyer_user_id: user2.id, brand_id: brand_m.id, category_id: brand_m.category_id, product_name: "ソファー",introduction: "粗大ゴミです", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile3.prefecture_id, days_to_ship: 0, price: 10800, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product14.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/1210194/646X1000/121019401.jpg"))
ProductImage.create(product_id: product14.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/1210194/646X1000/121019402.jpg"))
ProductImage.create(product_id: product14.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/1210194/646X1000/121019403.jpg"))
product15 = Product.create(seller_user_id: user3.id, buyer_user_id: user2.id, brand_id: brand_m.id, category_id: brand_m.category_id, product_name: "ソファー",introduction: "粗大ゴミです", product_size: 1, product_state: 1, who_pays_shipping_fee: 0, prefecture_id: profile3.prefecture_id, days_to_ship: 0, price: 10800, trade_state: 0, way_to_ship: 0)
ProductImage.create(product_id: product15.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/5609811/646X1000/560981101.jpg"))
ProductImage.create(product_id: product15.id, image: open("https://www.nitori-net.jp/wcsstore/ec/images/Image/catalog/5609811/646X1000/560981103.jpg"))
