# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lady = Category.create(name:"レディース")
lady_tops = lady.children.create(name:"トップス")
lady_tops.children.create([{name:"すべて"},{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"シャツ/ブラウス（半袖/袖なし）"},
                           {name:"シャツ/ブラウス（七分/長袖）"},{name:"ポロシャツ"},{name:"キャミソール"},{name:"タンクトップ"},{name:"ホルターネック"},
                           {name:"ニット/セーター"},{name:"チュニック"},{name:"カーディガン/ボレロ"},{name:"アンサンブル"},
                           {name:"ベスト/ジレ"},{name:"パーカー"},{name:"トレーナー/スウェット"},{name:"ベアトップ/チューブトップ"},{name:"ジャージ"},{name:"その他"}])
lady_jacket_outer = lady.children.create(name:"ジャケット/アウター")
lady_jacket_outer.children.create([{name:"すべて"},{name:"テーラードジャケット"}, {name:"ノーカラージャケット"},{name:"Gジャン/デニムジャケット"},
                                   {name:"レーザージャケット"},{name:"ダウンジャケット"},{name:"ライダースジャケット"},{name:"ミリタリージャケット"},{name:"ダウンベスト"},
                                   {name:"ジャンパー/ブルゾン"},{name:"ポンチョ"},{name:"ロングコート"},{name:"トレンチコート"},
                                   {name:"ダッフルコート"},{name:"ピーコート"},{name:"チェスターコート"},{name:"モッズコート"},{name:"スタジャン"},{name:"毛皮/ファーコート"},
                                   {name:"スプリングコート"},{name:"スカジャン"},{name:"その他"}])
lady_pants = lady.children.create(name:"パンツ")
lady_pants.children.create([{name:"すべて"},{name:"デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"カジュアルパンツ"},
                            {name:"ハーフパンツ"},{name:"チノパン"},{name:"ワークパンツ/カーゴパンツ"},{name:"クロップドパンツ"},{name:"サロペット/オーバーオール"},
                            {name:"オールインワン"},{name:"サルエルパンツ"},{name:"ガチョウパンツ"},{name:"その他"}])
lady_skirt = lady.children.create(name:"スカート")
lady_skirt.children.create([{name:"すべて"},{name:"ミニスカート"}, {name:"膝丈スカート"},{name:"ロングスカート"},
                            {name:"キュロット"},{name:"その他"}])
lady_one_piece = lady.children.create(name:"ワンピース")
lady_one_piece.children.create([{name:"すべて"},{name:"ミニワンピース"},{name:"膝丈ワンピース"},{name:"ロングワンピース"},{name:"その他"}])
lady_shoes = lady.children.create(name:"靴")
lady_shoes.children.create([{name:"すべて"},{name:"ハイヒール/パンプス"},{name:"ブーツ"},{name:"サンダル"},{name:"スニーカー"},
                            {name:"ミュール"},{name:"モカシン"},{name:"ローファー/革靴"},{name:"フラットシューズ/バレエシューズ"},
                            {name:"長靴/レインシューズ"},{name:"その他"}])
lady_room_wear = lady.children.create(name:"ルームウェア/パジャマ")
lady_room_wear.children.create([{name:"すべて"},{name:"パジャマ"},{name:"ルームウエア"}])
lady_leg_wear = lady.children.create(name:"レッグウェア")
lady_leg_wear.children.create([{name:"すべて"},{name:"ソックス"},{name:"スパッツ/レギンス"},{name:"ストッキング/タイツ"},{name:"レッグウォーマー"},{name:"その他"}])
lady_cap = lady.children.create(name:"帽子")
lady_cap.children.create([{name:"すべて"},{name:"ニットキャップ/ビーニー"},{name:"ハット"},{name:"ハンチング/ベレー帽"},{name:"キャップ"},
                          {name:"キャスケット"},{name:"麦わら帽子"},{name:"その他"}])
lady_bag = lady.children.create(name:"バッグ")
lady_bag.children.create([{name:"すべて"},{name:"ハンドバッグ"},{name:"トートバッグ"},{name:"エコバッグ"},{name:"リュックバッグ/バックパック"},
                          {name:"ボストンバッグ"},{name:"スポーツバッグ"},{name:"ショルダーバッグ"},{name:"クラッチバッグ"},{name:"ポーチ/パニティ"},
                          {name:"ボディバッグ/ウェストバッグ"},{name:"マザーズバッグ"},{name:"メッセンジャーバッグ"},{name:"ビジネスバッグ"},{name:"旅行用バッグ/キャリーバッグ"},
                          {name:"ショップ袋"},{name:"和袋用バッグ"},{name:"カゴバッグ"},{name:"その他"}])
lady_accessories = lady.children.create(name:"アクセサリー")
lady_accessories.children.create([{name:"すべて"},{name:"ネックレス"},{name:"ブレスレット"},{name:"バングル/リストバンド"},{name:"リング"},
                                  {name:"ピアス(片耳用)"},{name:"ピアス(両耳用)"},{name:"イヤリング"},{name:"ブローチ/コサージュ"},
                                  {name:"チャーム"},{name:"その他"}])
lady_hair_accessories = lady.children.create(name:"ヘアアクセサリー")
lady_hair_accessories.children.create([{name:"すべて"},{name:"ヘアゴム/シュシュ"},{name:"ヘアバンド/カチューシャ"},{name:"ヘアピン"},{name:"その他"}])
lady_articl = lady.children.create(name:"小物")
lady_articl.children.create([{name:"すべて"},{name:"長財布"},{name:"折り財布"},{name:"コインケース/小銭入れ"},{name:"名刺入れ/定期入れ"},
                             {name:"キーケース"},{name:"キーホルダー"},{name:"手袋/アームカバー"},{name:"ハンカチ"},{name:"ベルト"},{name:"マフラー/ショール"},
                             {name:"ストール/スヌード"},{name:"バンダナ/スカーフ"},{name:"ネックウォーマー"},{name:"サスペンダー"},{name:"サングラス/メガネ"},
                             {name:"モバイルケース/カバー"},{name:"手帳"},{name:"イヤマフラー"},{name:"傘"},{name:"レインコート/ポンチョ"},{name:"ミラー"},
                             {name:"タバコグッズ"},{name:"その他"}])
lady_watch = lady.children.create(name:"時計")
lady_watch.children.create([{name:"すべて"},{name:"腕時計(アナログ)"},{name:"腕時計(デジタル)"},{name:"ラバーベルト"},{name:"レーザーベルト"},
                            {name:"金属ベルト"},{name:"その他"}])
lady_wig_extension = lady.children.create(name:"ウィッグ/エクステ")
lady_wig_extension.children.create([{name:"すべて"},{name:"前髪ウィッグ"},{name:"ロングストレート"},{name:"ロングカール"},{name:"ショートストレート"},
                                    {name:"ショートカール"},{name:"その他"}])
lady_summer_wear = lady.children.create(name:"浴衣/水着")
lady_summer_wear.children.create([{name:"すべて"},{name:"浴衣"},{name:"着物"},{name:"振袖"},{name:"長襦袢/半襦袢"},{name:"水着セパレード"},{name:"水着ワンピース"},
                         {name:"水着スポーツ用"},{name:"その他"}])
lady_suit_dress = lady.children.create(name:"スーツ/フォーマル/ドレス")
lady_suit_dress.children.create([{name:"すべて"},{name:"スカートスーツ上下"},{name:"パンツスーツ上下"},{name:"ドレス"},{name:"パーティーバッグ"},{name:"シューズ"},
                        {name:"ウェディング"},{name:"その他"}])
lady_maternity = lady.children.create(name:"マタニティ")
lady_other = lady.children.create(name:"その他")
lady_other.children.create([{name:"すべて"}])

men = Category.create(name:"メンズ")
men_tops = men.children.create(name:"トップス")
men_tops.children.create([{name:"すべて"},{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"シャツ"},
                          {name:"ポロシャツ"},{name:"タンクトップ"},{name:"ニット/セーター"},{name:"パーカー"},{name:"カーディガン"},
                          {name:"スウェット"},{name:"ベスト"},{name:"ジャージ"},{name:"その他"}])
men_jacket_outer = men.children.create(name:"ジャケット/アウター")
men_jacket_outer.children.create([{name:"すべて"},{name:"テーラードジャケット"}, {name:"ノーカラージャケット"},{name:"Gジャン/デニムジャケット"},
                                  {name:"レーザージャケット"},{name:"ダウンジャケット"},{name:"ライダースジャケット"},{name:"ミリタリージャケット"},{name:"ナイロンジャケット"},
                                  {name:"フライトジャケット"},{name:"ダッフルコート"},{name:"ピーコート"},{name:"ステインカラーコート"},{name:"トレンチコート"},{name:"モッズコート"},
                                  {name:"チェスターコート"},{name:"スタジャン"},{name:"スカジャン"},{name:"ブルゾン"},{name:"マウンテンパーカー"},{name:"ダウンベスト"},
                                  {name:"ポンチョ"},{name:"カバーオール"},{name:"その他"}])
men_pants = men.children.create(name:"パンツ")
men_pants.children.create([{name:"すべて"},{name:"デニム/ジーンズ"},{name:"ワークパンツ/カーゴパンツ"},{name:"スラックス"},{name:"チノパン"},
                          {name:"ショートパンツ"},{name:"ペインターパンツ"},{name:"サルエルパンツ"},{name:"オーバーオール"},{name:"その他"}])
men_shoes = men.children.create(name:"靴")
men_shoes.children.create([{name:"すべて"},{name:"スニーカー"},{name:"サンダル"},{name:"ブーツ"},{name:"モカシン"},
                           {name:"ドレス/ビジネス"},{name:"デッキシューズ"},{name:"長靴/レインシューズ"},{name:"その他"}])
men_bag = men.children.create(name:"バッグ")
men_bag.children.create([{name:"すべて"},{name:"ショルダーバッグ"},{name:"トートバッグ"},{name:"ボストンバッグ"},{name:"リュック/バックパック"},
                         {name:"ウエストポーチ"},{name:"ボディーバッグ"},{name:"ドラムバッグ"},{name:"ビジネスバッグ"},
                         {name:"トラベルバッグ"},{name:"メッセンジャーバッグ"},{name:"エコバッグ"},{name:"その他"}])
men_suit = men.children.create(name:"スーツ")
men_suit.children.create([{name:"すべて"},{name:"スーツジャケット"},{name:"スーツベスト"},{name:"スラックス"},{name:"セットアップ"},{name:"その他"}])
men_cap = men.children.create(name:"帽子")
men_cap.children.create([{name:"すべて"},{name:"キャップ"},{name:"ハット"},{name:"ニットキャップ/ビーニー"},{name:"ハンチング/ベレー帽"},{name:"キャスケット"},
                         {name:"サンバイザー"},{name:"その他"}])
men_accessories = men.children.create(name:"アクセサリー")
men_accessories.children.create([{name:"すべて"},{name:"ネックレス"},{name:"ブレスレット"},{name:"パングル/リストバンド"},{name:"リング"},{name:"ピアス(片耳用)"},
                                {name:"ピアス(両耳用)"},{name:"アンクレット"},{name:"その他"}])
men_articl = men.children.create(name:"小物")
men_articl.children.create([{name:"すべて"},{name:"長財布"},{name:"折り財布"},{name:"マネークリップ"},{name:"コインケース/小銭入れ"},{name:"名刺入れ/定期入れ"},
                            {name:"キーケース"},{name:"キーホルダー"},{name:"ネクタイ"},{name:"手袋"},{name:"ハンカチ"},{name:"ベルト"},
                            {name:"マフラー"},{name:"ストール"},{name:"バンダナ"},{name:"ネックウォーマー"},{name:"サスペンダー"},{name:"ウォレットチェーン"},
                            {name:"サングラス/メガネ"},{name:"モバイルケース/カバー"},{name:"手帳"},{name:"ストラップ"},{name:"ネクタイピン"},{name:"カフリンクス"},
                            {name:"イヤマフラー"},{name:"傘"},{name:"レインコート"},{name:"ミラー"},{name:"タバコグッズ"},{name:"その他"}])
men_watch = men.children.create(name:"時計")
men_watch.children.create([{name:"すべて"},{name:"腕時計(アナログ)"},{name:"腕時計(デジタル)"},{name:"ラバーベルト"},{name:"レーザーベルト"},{name:"金属ベルト"},{name:"その他"}])
men_summer_wear = men.children.create(name:"水着")
men_summer_wear.children.create([{name:"すべて"},{name:"一般水着"},{name:"スポーツ用"},{name:"アクセサリー"},{name:"その他"}])
men_leg_wear = men.children.create(name:"レッグウェア")
men_leg_wear.children.create([{name:"すべて"},{name:"ソックス"},{name:"レギンス/スパッツ"},{name:"レッグウォーマー"},{name:"その他"}])
men_under_wear = men.children.create(name:"アンダーウェア")
men_under_wear.children.create([{name:"すべて"},{name:"トランクス"},{name:"ボクサーパンツ"},{name:"その他"}])
men_other = men.children.create(name:"その他")
men_other.children.create([{name:"すべて"}])

baby_kids = Category.create(name:"ベビー/キッズ")
baby_lady_wear = baby_kids.children.create(name:"ベビー服(女の子用)　~95cm")
baby_lady_wear.children.create([{name:"すべて"},{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"スカート"},{name:"ワンピース"},
                                {name:"ベビードレス"},{name:"おくるみ"},{name:"下着/肌着"},{name:"パジャマ"},
                                {name:"ロンパース"},{name:"その他"}])
baby_men_wear = baby_kids.children.create(name:"ベビー服(男の子用)　~95cm")
baby_men_wear.children.create([{name:"すべて"},{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"おくるみ"},{name:"下着/肌着"},
                               {name:"パジャマ"},{name:"ロンパース"},{name:"その他"}])
baby_wear = baby_kids.children.create(name:"ベビー服(男女兼用)　~95cm")
baby_wear.children.create([{name:"すべて"},{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"おくるみ"},{name:"下着/肌着"},
                           {name:"パジャマ"},{name:"ロンパース"},{name:"その他"}])
kids_lady_wear = baby_kids.children.create(name:"キッズ服(女の子用)　~100cm")
kids_lady_wear.children.create([{name:"すべて"},{name:"コート"},{name:"ジャケット/上着"},{name:"トップス(トレーナー)"},{name:"トップス(チュニック)"},
                                {name:"トップス(タンクトップ)"},{name:"トップス(その他)"},{name:"スカート"},{name:"パンツ"},
                                {name:"ワンピース"},{name:"セットアップ"},{name:"パジャマ"},{name:"フォーマル/ドレス"},{name:"和服"},
                                {name:"浴衣"},{name:"甚平"},{name:"水着"},{name:"その他"}])
kids_men_wear = baby_kids.children.create(name:"キッズ服(男の子用)　~100cm")
kids_men_wear.children.create([{name:"すべて"},{name:"コート"},{name:"ジャケット/上着"},{name:"トップス(Tシャツ/カットソー)"},{name:"トップス(トレーナー)"},
                               {name:"トップス(その他)"},{name:"パンツ"},{name:"セットアップ"},{name:"パジャマ"},{name:"フォーマル/ドレス"},
                               {name:"和服"},{name:"浴衣"},{name:"甚平"},{name:"水着"},{name:"その他"}])
kids_wear = baby_kids.children.create(name:"キッズ服(男女兼用)　~100cm")
kids_wear.children.create([{name:"すべて"},{name:"コート"},{name:"ジャケット/上着"},{name:"トップス(Tシャツ/カットソー)"},{name:"トップス(トレーナー)"},
                           {name:"トップス(その他)"},{name:"ボトムス"},{name:"パジャマ"},{name:"その他"}])
kids_shoes = baby_kids.children.create(name:"キッズ靴")
kids_shoes.children.create([{name:"すべて"},{name:"スニーカー"},{name:"サンダル"},{name:"ブーツ"},{name:"長靴"},{name:"その他"}])
kids_fashion_articl = baby_kids.children.create(name:"キッズ靴")
kids_fashion_articl.children.create([{name:"すべて"},{name:"靴下/スパッツ"},{name:"帽子"},{name:"エプロン"},{name:"サスペンダー"},{name:"タイツ"},
                                     {name:"ハンカチ"},{name:"バンダナ"},{name:"ベルト"},{name:"マフラー"},{name:"傘"},{name:"手袋"},
                                     {name:"スタイ"},{name:"バッグ"},{name:"その他"}])
baby_kids_pants_toilet = baby_kids.children.create(name:"おむつ/トイレ/バス")
baby_kids_pants_toilet.children.create([{name:"すべて"},{name:"おむつ用品"},{name:"おまる/補助便座"},{name:"トレーニングパンツ"},{name:"ベビーバス"},
                                        {name:"お風呂用品"},{name:"その他"}])
baby_kids_outdoor = baby_kids.children.create(name:"外出/移動用品")
baby_kids_outdoor.children.create([{name:"すべて"},{name:"ベビーカー"},{name:"抱っこひも/スリング"},{name:"チャイルドシート"},{name:"その他"}])
baby_kids_foods = baby_kids.children.create(name:"授乳/食事")
baby_kids_foods.children.create([{name:"すべて"},{name:"ミルク"},{name:"ベビーフード"},{name:"ベビー用食器"},{name:"その他"}])
baby_kids_indoor = baby_kids.children.create(name:"ベビー家具/寝具/室内用品")
baby_kids_indoor.children.create([{name:"すべて"},{name:"ベッド"},{name:"布団/毛布"},{name:"椅子"},{name:"たんす"},{name:"その他"}])
baby_kids_toys = baby_kids.children.create(name:"おもちゃ")
baby_kids_toys.children.create([{name:"すべて"},{name:"お風呂のおもちゃ"},{name:"がらがら"},{name:"オルゴール"},{name:"ベビージム"},{name:"手押し車/カタカタ"},
                                {name:"知育玩具"},{name:"その他"}])
baby_kids_event = baby_kids.children.create(name:"行事/記念品")
baby_kids_event.children.create([{name:"すべて"},{name:"お宮参り用品"},{name:"お食い初め用品"},{name:"アルバム"},{name:"手形/足形"},{name:"その他"}])
baby_kids_other = baby_kids.children.create(name:"その他")
baby_kids_other.children.create([{name:"すべて"}])

interior_dwelling = Category.create(name:"インテリア・住まい・小物")
kitchin = interior_dwelling.children.create(name:"キッチン/食器")
kitchin.children.create([{name:"すべて"},{name:"食器"},{name:"調理器具"},{name:"収納/キッチン雑貨"},{name:"弁当用品"},{name:"カトラリー(スプーン等)"},
                         {name:"テーブル用品"},{name:"容器"},{name:"エプロン"},{name:"アルコールグッズ"},{name:"浄水器"},{name:"その他"}])
bed = interior_dwelling.children.create(name:"ベッド/マットレス")
bed.children.create([{name:"すべて"},{name:"セミシングルベッド"},{name:"シングルベッド"},{name:"セミダブルベッド"},{name:"ダブルベッド"},{name:"ワイドダブルベッド"},
                     {name:"クイーンベッド"},{name:"キングベッド"},{name:"脚付きマットレスベッド"},{name:"マットレス"},{name:"すのこベッド"},
                     {name:"ロフトベッド/システムベッド"},{name:"簡易ベッド/折りたたみベッド"},{name:"収納付き"},{name:"その他"}])
sofa = interior_dwelling.children.create(name:"ソファ/ソファベッド")
sofa.children.create([{name:"すべて"},{name:"ソファセット"},{name:"シングルソファ"},{name:"ラブソファ"},{name:"トリプルソファ"},{name:"オットマン"},
                      {name:"コーナーソファ"},{name:"ビーズソファ/クッション"},{name:"ローソファ/フロアソファ"},{name:"ソファベッド"},
                      {name:"応接セット"},{name:"ソファカバー"},{name:"リクライニングソファ"},{name:"その他"}])
chair = interior_dwelling.children.create(name:"椅子/チェア")
chair.children.create([{name:"すべて"},{name:"一般"},{name:"スツール"},{name:"ダイニングチェア"},{name:"ハイバックチェア"},{name:"ロッキングチェア"},
                       {name:"座椅子"},{name:"折り畳みイス"},{name:"デスクチェア"},{name:"その他"}])
table = interior_dwelling.children.create(name:"机/テーブル")
table.children.create([{name:"すべて"},{name:"こたつ"},{name:"カウンターテーブル"},{name:"サイドテーブル"},{name:"センターテーブル"},{name:"ダイニングテーブル"},
                       {name:"座卓/ちゃぶ台"},{name:"アウトドア用"},{name:"パソコン用"},{name:"事務机/学習机"},{name:"その他"}])
storage_box = interior_dwelling.children.create(name:"収納家具")
storage_box.children.create([{name:"すべて"},{name:"リビング収納"},{name:"キッチン収納"},{name:"玄関/屋外収納"},{name:"バス/トイレ収納"},{name:"本収納"},
                             {name:"本/CD/DVD収納"},{name:"洋服タンス/押入れ収納"},{name:"電話台/ファックス台"},{name:"ドレッサー/鏡台"},
                             {name:"棚/ラック"},{name:"ケース/ボックス"},{name:"その他"}])
carpet = interior_dwelling.children.create(name:"ラグ/カーペット/マット")
carpet.children.create([{name:"すべて"},{name:"ラグ"},{name:"カーペット"},{name:"ホットカーペット"},{name:"玄関/キッチンマット"},{name:"トイレ/バスマット"},
                        {name:"その他"}])
curtain = interior_dwelling.children.create(name:"カーテン/ブラインド")
curtain.children.create([{name:"すべて"},{name:"カーテン"},{name:"ブラインド"},{name:"ロールスクリーン"},{name:"のれん"},{name:"その他"}])
illumination = interior_dwelling.children.create(name:"ライト/照明")
illumination.children.create([{name:"すべて"},{name:"蛍光灯/電球"},{name:"天井照明"},{name:"フロントスタンド"},{name:"その他"}])
bedding = interior_dwelling.children.create(name:"寝具")
bedding.children.create([{name:"すべて"},{name:"布団/毛布"},{name:"枕"},{name:"シーツ/カバー"},{name:"その他"}])
interior_articl = interior_dwelling.children.create(name:"インテリア小物")
interior_articl.children.create([{name:"すべて"},{name:"ごみ箱"},{name:"ウェルカムボード"},{name:"オルゴール"},{name:"クッション"},{name:"クッションカバー"},
                                 {name:"スリッパラック"},{name:"ティッシュボックス"},{name:"バスケット/かご"},{name:"フォトフレーム"},{name:"マガジンラック"},
                                 {name:"モビール"},{name:"花瓶"},{name:"灰皿"},{name:"傘立て"},{name:"小物入れ"},{name:"置時計"},{name:"掛時計/柱時計"},
                                 {name:"鏡(立て掛け式)"},{name:"鏡(壁掛け式)"},{name:"置物"},{name:"風鈴"},{name:"植物/観葉植物"},{name:"その他"}])
season_event = interior_dwelling.children.create(name:"季節/年中行事")
season_event.children.create([{name:"すべて"},{name:"正月"},{name:"成人式"},{name:"バレンタインデー"},{name:"ひな祭り"},{name:"子どもの日"},{name:"母の日"},
                              {name:"父の日"},{name:"サマーギフト/お中元"},{name:"夏/夏休み"},{name:"ハロウィン"},{name:"敬老の日"},{name:"七五三"},
                              {name:"お歳暮"},{name:"クリスマス"},{name:"冬一般"},{name:"その他"}])
interior_dwelling_other = interior_dwelling.children.create(name:"その他")
interior_dwelling_other.children.create([{name:"すべて"}])

book_music_games = Category.create(name:"本・音楽・ゲーム")
book = book_music_games.children.create(name:"本")
book.children.create([{name:"文学/小説"},{name:"人文/社会"},{name:"ノンフィクション/教養"},{name:"地図/旅行ガイド"},{name:"ビジネス/経済"},{name:"健康/医学"},
                      {name:"コンピュータ/IT"},{name:"趣味/スポーツ/実用"},{name:"住まい/暮らし/子育て"},{name:"アート/エンタメ"},{name:"洋書"},
                      {name:"絵本"},{name:"参考書"},{name:"その他"}])
comic = book_music_games.children.create(name:"漫画")
comic.children.create([{name:"全巻セット"},{name:"少年漫画"},{name:"少女漫画"},{name:"青年漫画"},{name:"女性漫画"},{name:"同人誌"},{name:"その他"}])
magazine = book_music_games.children.create(name:"雑誌")
magazine.children.create([{name:"アート/エンタメ/ホビー"},{name:"ファッション"},{name:"ニュース/総合"},{name:"趣味/スポーツ"},{name:"その他"}])
cd = book_music_games.children.create(name:"CD")
cd.children.create([{name:"邦楽"},{name:"洋楽"},{name:"アニメ"},{name:"クラシック"},{name:"K-POP/アジア"},{name:"キッズ/ファミリー"},{name:"その他"}])
dvd = book_music_games.children.create(name:"DVD/ブルーレイ")
dvd.children.create([{name:"外国映画"},{name:"日本映画"},{name:"アニメ"},{name:"TVドラマ"},{name:"ミュージック"},{name:"お笑い/バラエティ"},
                     {name:"ミュージック"},{name:"スポーツ/フィットネス"},{name:"キッズ/ファミリー"},{name:"その他"}])
record = book_music_games.children.create(name:"レコード")
record.children.create([{name:"邦楽"},{name:"洋楽"},{name:"その他"}])
tv_game = book_music_games.children.create(name:"テレビゲーム")
tv_game.children.create([{name:"家庭用ゲーム本体"},{name:"家庭用ゲームソフト"},{name:"携帯用ゲーム本体"},{name:"携帯用ゲームソフト"},{name:"PCゲーム"},{name:"その他"}])
book_music_games_other = book_music_games.children.create(name:"その他")

toys_hobby = Category.create(name:"おもちゃ・ホビー・グッズ")
toy = toys_hobby.children.create(name:"おもちゃ")
toy.children.create([{name:"キャラクターグッズ"},{name:"ぬいぐるみ"},{name:"小物/アクセサリー"},{name:"模型/プラモデル"},{name:"ミニカー"},{name:"トイラジコン"},
                     {name:"プラモデル"},{name:"ホビーラジコン"},{name:"鉄道模型"},{name:"その他"}])
talent = toys_hobby.children.create(name:"タレントグッズ")
talent.children.create([{name:"アイドル"},{name:"ミュージシャン"},{name:"タレント/お笑い芸人"},{name:"スポーツ選手"},{name:"その他"}])
comic_anime = toys_hobby.children.create(name:"コミック/アニメグッズ")
comic_anime.children.create([{name:"ストラップ"},{name:"キーホルダー"},{name:"バッジ"},{name:"カード"},{name:"クリアファイル"},{name:"ポスター"},{name:"タオル"},{name:"その他"}])
trading_card = toys_hobby.children.create(name:"トレーディングカード")
trading_card.children.create([{name:"遊戯王"},{name:"マジック：ザ・ギャザリング"},{name:"ポケモンカードゲーム"},{name:"デュエルマスターズ"},{name:"バトルスピリッツ"},
                              {name:"プリパラ"},{name:"アイカツ"},{name:"カードファイト‼︎ ヴァンガード"},{name:"ヴァイスシュヴァルツ"},{name:"プロ野球オーナーズリーグ"},
                              {name:"ベースボールヒーローズ"},{name:"ドラゴンボール"},{name:"スリーブ"},{name:"その他"}])
figure = toys_hobby.children.create(name:"フィギュア")
figure.children.create([{name:"コミック/アニメ"},{name:"特撮"},{name:"ゲームキャラクター"},{name:"SF/ファンタジー/ホラー"},{name:"アメコミ"},{name:"スポーツ"},{name:"ミリタリー"},{name:"その他"}])
instrument = toys_hobby.children.create(name:"楽器/器材")
instrument.children.create([{name:"エレキギター"},{name:"アコースティックギター"},{name:"ベース"},{name:"エフェクター"},{name:"アンプ"},{name:"弦楽器"},{name:"管楽器"},{name:"鍵盤楽器"},{name:"打楽器"},
                            {name:"和楽器"},{name:"楽譜/スコア"},{name:"レコーディング/PA機器"},{name:"DJ機器"},{name:"DTM/DAW"},{name:"その他"}])
collection= toys_hobby.children.create(name:"コレクション")
collection.children.create([{name:"武具"},{name:"使用済切手/官製はがき"},{name:"旧貨幣/金貨/銀貨/記念硬貨"},{name:"印刷物"},{name:"ノベルティグッズ"},{name:"その他"}])
military = toys_hobby.children.create(name:"ミリタリー")
military.children.create([{name:"トイガン"},{name:"個人装備"},{name:"その他"}])
art_product = toys_hobby.children.create(name:"美術品")
art_product.children.create([{name:"陶芸"},{name:"ガラス"},{name:"漆芸"},{name:"金属工芸"},{name:"絵画/タペストリ"},{name:"版画"},{name:"彫刻/オブジェクト"},{name:"書"},{name:"写真"},{name:"その他"}])
art_supplies = toys_hobby.children.create(name:"アート用品")
art_supplies.children.create([{name:"画材"},{name:"額縁"},{name:"その他"}])
toys_hobby_other = toys_hobby.children.create(name:"その他")
toys_hobby_other.children.create([{name:"トランプ/UNO"},{name:"カルタ/百人一首"},{name:"ダーツ"},{name:"ビリヤード"},{name:"麻雀"},{name:"パズル/ジグソーパズル"},{name:"囲碁/将棋"},{name:"オセロ/チェス"},
                                  {name:"人生ゲーム"},{name:"野球/サッカーゲーム"},{name:"スポーツ"},{name:"三輪車/乗り物"},{name:"ヨーヨー"},{name:"模型製作用品"},{name:"鉄道"},{name:"航空機"},{name:"アマチュア無線"},
                                  {name:"パチンコ/パチスロ"},{name:"その他"}])

beauty_product = Category.create(name:"コスメ・香水・美容")
bese_make = beauty_product.children.create(name:"ベースメイク")
bese_make.children.create([{name:"ファンデーション"},{name:"化粧下地"},{name:"コントロールカラー"},{name:"BBクリーム"},{name:"CCクリーム"},{name:"コンシーラー"},{name:"フェイスパウダー"},{name:"トライアルセット/サンプル"},
                        {name:"その他"}])
make_up = beauty_product.children.create(name:"メイクアップ")
make_up.children.create([{name:"アイシャドウ"},{name:"口紅"},{name:"リップグロス"},{name:"リップライナー"},{name:"チーク"},{name:"フェイスカラー"},{name:"マスカラ"},{name:"アイライナー"},{name:"つけまつげ"},{name:"アイブロウペンシル"},
                         {name:"パウダーアイブロウ"},{name:"眉マスカラ"},{name:"トライアルセット/サンプル"},{name:"メイク道具/化粧小物"},{name:"美顔用品/美顔ローラー"},{name:"その他"}])
nail_care = beauty_product.children.create(name:"ネイルケア")
nail_care.children.create([{name:"ネイルカラー"},{name:"カラージェル"},{name:"ネイルベースコート/トップコート"},{name:"ネイルアート用品"},{name:"ネイルパーツ"},{name:"ネイルチップ/付け爪"},{name:"手入れ用具"},{name:"除光液"},{name:"その他"}])
perfume = beauty_product.children.create(name:"香水")
perfume.children.create([{name:"香水(女性用)"},{name:"香水(男性用)"},{name:"ユニセックス"},{name:"ボディミスト"},{name:"その他"}])
skin_care = beauty_product.children.create(name:"スキンケア/基礎化粧品")
skin_care.children.create([{name:"化粧水/ローション"},{name:"乳液/ミルク"},{name:"美容液"},{name:"フェイスクリーム"},{name:"洗顔料"},{name:"クレンジング/メイク落とし"},{name:"パック/フェイスマスク"},{name:"ジェル/ゲル"},{name:"ブースター/導入液"},
                           {name:"アイケア"},{name:"リップケア"},{name:"トライアルセット/サンプル"},{name:"洗顔グッズ"},{name:"その他"}])
hair_care = beauty_product.children.create(name:"ヘアケア")
hair_care.children.create([{name:"化粧水/ローション"},{name:"乳液/ミルク"},{name:"美容液"},{name:"フェイスクリーム"},{name:"洗顔料"},{name:"クレンジング/メイク落とし"},{name:"パック/フェイスマスク"},{name:"ジェル/ゲル"},{name:"ブースター/導入液"},
                           {name:"アイケア"},{name:"リップケア"},{name:"トライアルセット/サンプル"},{name:"洗顔グッズ"},{name:"その他"}])
body_care = beauty_product.children.create(name:"ボディケア")
body_care.children.create([{name:"オイル/クリーム"},{name:"ハンドクリーム"},{name:"ローション"},{name:"日焼け止め/サンオイル"},{name:"ボディソープ"},{name:"入浴剤"},{name:"制汗/デオドラント"},{name:"フットケア"},{name:"その他"}])
oral_care = beauty_product.children.create(name:"オーラルケア")
oral_care.children.create([{name:"口臭防止/エチケット用品"},{name:"歯ブラシ"},{name:"その他"}])
relaxation = beauty_product.children.create(name:"リラックゼーション")
relaxation.children.create([{name:"エッセンシャルオイル"},{name:"芳香器"},{name:"お香/香炉"},{name:"キャンドル"},{name:"リラクゼーショングッズ"},{name:"その他"}])
diet = beauty_product.children.create(name:"ダイエット")
diet.children.create([{name:"ダイエット食品"},{name:"エクササイズ用品"},{name:"体重計"},{name:"体脂肪計"},{name:"その他"}])
beauty_product_other = beauty_product.children.create(name:"その他")
beauty_product_other.children.create([{name:"健康用品"},{name:"看護/介護用品"},{name:"救急/衛生用品"},{name:"その他"}])

appliances = Category.create(name:"家電・スマホ・カメラ")
smart_phone = appliances.children.create(name:"スマートフォン/携帯電話")
smart_phone.children.create([{name:"スマートフォン本体"},{name:"バッテリー/充電器"},{name:"携帯電話本体"},{name:"PHS本体"},{name:"その他"}])
smart_phone_accessory = appliances.children.create(name:"スマホアクセサリー")
smart_phone_accessory.children.create([{name:"Android用ケース"},{name:"iPhone用ケース"},{name:"カバー"},{name:"イヤホンジャック"},{name:"ストラップ"},{name:"フィルム"},{name:"自撮り棒"},{name:"その他"}])
pc_tablet = appliances.children.create(name:"PC/タブレット")
pc_tablet.children.create([{name:"タブレット"},{name:"ノートPC"},{name:"デスクトップ型PC"},{name:"ディスプレイ"},{name:"電子ブックリーダー"},{name:"PC周辺機器"},{name:"PCパーツ"},{name:"その他"}])
camera = appliances.children.create(name:"カメラ")
camera.children.create([{name:"デジタルカメラ"},{name:"ビデオカメラ"},{name:"レンズ(単焦点)"},{name:"レンズ(ズーム)"},{name:"フィルムカメラ"},{name:"防犯カメラ"},{name:"その他"}])
tv_video_equipment = appliances.children.create(name:"テレビ/映像機器")
tv_video_equipment.children.create([{name:"テレビ"},{name:"プロジェクター"},{name:"ブルーレイレコーダー"},{name:"DVDレコーダー"},{name:"ブルーレイプレーヤー"},{name:"DVDプレーヤー"},{name:"映像用ケーブル"},{name:"その他"}])
audio_equipment = appliances.children.create(name:"オーディオ機器")
audio_equipment.children.create([{name:"ポータブルプレーヤー"},{name:"イヤフォン"},{name:"ヘッドフォン"},{name:"アンプ"},{name:"スピーカー"},{name:"ケーブル/シールド"},{name:"ラジオ"},{name:"その他"}])
health = appliances.children.create(name:"美容/健康")
health.children.create([{name:"ヘアドライヤー"},{name:"ヘアアイロン"},{name:"美容機器"},{name:"電気シェーバー"},{name:"電動歯ブラシ"},{name:"その他"}])
refrigerator_conditoning= appliances.children.create(name:"冷蔵庫/空調")
refrigerator_conditoning.children.create([{name:"エアコン"},{name:"空気清浄器"},{name:"加湿器"},{name:"扇風機"},{name:"除湿機"},{name:"ファンヒーター"},{name:"電気ヒーター"},{name:"オイルヒーター"},{name:"ストーブ"},
                                          {name:"ホットカーペット"},{name:"こたつ"},{name:"電気毛布"},{name:"その他"}])
household_appliances = appliances.children.create(name:"生活家電")
household_appliances.children.create([{name:"冷蔵庫"},{name:"洗濯機"},{name:"炊飯器"},{name:"電子レンジ/オーブン"},{name:"調理機器"},{name:"アイロン"},{name:"掃除機"},{name:"エスプレッソマシン"},{name:"コーヒーメーカー"},
                                      {name:"衣類乾燥機"},{name:"その他"}])
appliances_other = appliances.children.create(name:"その他")
appliances_other.children.create([{name:"すべて"}])

sports = Category.create(name:"スポーツ・レジャー")
golf = sports.children.create(name:"ゴルフ")
golf.children.create([{name:"クラブ"},{name:"ウエア(男性用)"},{name:"ウエア(女性用)"},{name:"バッグ"},{name:"シューズ(男性用)"},{name:"シューズ(女性用)"},{name:"アクセサリー"},{name:"その他"}])
fishing = sports.children.create(name:"フィッシング")
fishing.children.create([{name:"ロッド"},{name:"リール"},{name:"ルアー用品"},{name:"ウエア"},{name:"釣り糸/ライン"},{name:"その他"}])
bicycle = sports.children.create(name:"自転車")
bicycle.children.create([{name:"自転車本体"},{name:"ウエア"},{name:"パーツ"},{name:"アクセサリー"},{name:"バッグ"},{name:"工具/メンテナンス"},{name:"その他"}])
traning_exercise = sports.children.create(name:"トレーニング/エクササイズ")
traning_exercise.children.create([{name:"ランニング"},{name:"ウォーキング"},{name:"ヨガ"},{name:"トレーニング用品"},{name:"その他"}])
base_ball = sports.children.create(name:"野球")
base_ball.children.create([{name:"ウェア"},{name:"シューズ"},{name:"グローブ"},{name:"バット"},{name:"アクセサリー"},{name:"防具"},{name:"練習機器"},{name:"記念グッズ"},{name:"応援グッズ"},{name:"その他"}])
football = sports.children.create(name:"サッカー/フットボール")
football.children.create([{name:"ウェア"},{name:"シューズ"},{name:"ボール"},{name:"アクセサリー"},{name:"記念グッズ"},{name:"応援グッズ"},{name:"その他"}])
tennis = sports.children.create(name:"テニス")
tennis.children.create([{name:"ラケット(硬式用)"},{name:"ラケット(軟式用)"},{name:"シューズ"},{name:"ボール"},{name:"アクセサリー"},{name:"記念グッズ"},{name:"応援グッズ"},{name:"その他"}])
snow_board = sports.children.create(name:"スノーボード")
snow_board.children.create([{name:"ボード"},{name:"バインディング"},{name:"ブーツ(男性用)"},{name:"ブーツ(女性用)"},{name:"ブーツ(子ども用)"},{name:"ウエア/装備(男性用)"},{name:"ウエア/装備(女性用)"},
                            {name:"ウエア/装備(子ども用)"},{name:"アクセサリー"},{name:"バッグ"},{name:"その他"}])
skiing = sports.children.create(name:"スキー")
skiing.children.create([{name:"板"},{name:"ブーツ(男性用)"},{name:"ブーツ(女性用)"},{name:"ブーツ(子ども用)"},{name:"ビンディング"},{name:"ウエア(男性用)"},{name:"ウエア(女性用)"},
                        {name:"ウエア(子ども用)"},{name:"ストック"},{name:"その他"}])
other_sports = sports.children.create(name:"その他スポーツ")
other_sports.children.create([{name:"ダンス/バレエ"},{name:"サーフィン"},{name:"バスケットボール"},{name:"バドミントン"},{name:"バレーボール"},{name:"スケートボード"},{name:"陸上競技"},{name:"ラグビー"},
                              {name:"アメリカンフットボール"},{name:"ボクシング"},{name:"ボウリング"},{name:"その他"}])
outdoor_sports = sports.children.create(name:"アウトドア")
outdoor_sports.children.create([{name:"テント/タープ"},{name:"ライト/ランタン"},{name:"寝袋/寝具"},{name:"テーブル/チェア"},{name:"ストーブ/コンロ"},{name:"調理器具"},{name:"食器"},
                                {name:"登山用品"},{name:"その他"}])
sports_other = sports.children.create(name:"その他")
sports_other.children.create([{name:"すべて"}])

hand_made = Category.create(name:"ハンドメイド")
accessory_ledy = hand_made.children.create(name:"アクセサリー(女性用)")
accessory_ledy.children.create([{name:"ピアス"},{name:"イヤリング"},{name:"ネックレス"},{name:"ブレスレット"},{name:"リング"},{name:"チャーム"},{name:"ヘアゴム"},
                                {name:"アンクレット"},{name:"その他"}])
fashion_articl = hand_made.children.create(name:"ファッション/小物")
fashion_articl.children.create([{name:"バッグ(女性用)"},{name:"バッグ(男性用)"},{name:"財布(女性用)"},{name:"財布(男性用)"},{name:"ファッション雑貨"},{name:"その他"}])
accessory_watch = hand_made.children.create(name:"アクセサリー/時計")
accessory_watch.children.create([{name:"アクセサリー(男性用)"},{name:"時計(女性用)"},{name:"時計(男性用)"},{name:"その他"}])
necessities_interior = hand_made.children.create(name:"日用品/インテリア")
necessities_interior.children.create([{name:"キッチン用品"},{name:"家具"},{name:"文房具"},{name:"アート/写真"},{name:"アロマ/キャンドル"},{name:"フラワー/ガーデン"},{name:"その他"}])
hobby_toys = hand_made.children.create(name:"趣味/おもちゃ")
hobby_toys.children.create([{name:"クラフト/布製品"},{name:"おもちゃ/人形"},{name:"その他"}])
kids_baby = hand_made.children.create(name:"キッズ/べイビー")
kids_baby.children.create([{name:"ファッション雑貨"},{name:"スタイ/よだれかけ"},{name:"外出用品"},{name:"ネームタグ"},{name:"その他"}])
material = hand_made.children.create(name:"素材/材料")
material.children.create([{name:"各種パーツ"},{name:"生地/糸"},{name:"型紙/パターン"},{name:"その他"}])
secondary_creation = hand_made.children.create(name:"二次創作物")
secondary_creation.children.create([{name:"Ingress"},{name:"クリエイターズ宇宙兄弟"},{name:"シンデレラガールズCPグッズ"},{name:"その他"}])
hand_made_other = hand_made.children.create(name:"その他")
hand_made_other.children.create([{name:"すべて"}])

ticket = Category.create(name:"チケット")
ticket_music = ticket.children.create(name:"音楽")
ticket_music.children.create([{name:"男性アイドル"},{name:"女性アイドル"},{name:"韓流"},{name:"国内アーティスト"},{name:"海外アーティスト"},{name:"音楽フェス"},
                              {name:"声優/アニメ"},{name:"その他"}])
ticket_sports = ticket.children.create(name:"スポーツ")
ticket_sports.children.create([{name:"サッカー"},{name:"野球"},{name:"テニス"},{name:"格闘技/プロレス"},{name:"相撲/武道"},{name:"ゴルフ"},{name:"バレーボール"},{name:"バスケットボール"},
                               {name:"モータースポーツ"},{name:"ウィンタースポーツ"},{name:"その他"}])
ticket_theater = ticket.children.create(name:"演劇/芸能")
ticket_theater.children.create([{name:"ミュージカル"},{name:"演劇"},{name:"伝統芸能"},{name:"落語"},{name:"お笑い"},{name:"オペラ"},{name:"サーカス"},{name:"バレエ"},{name:"その他"}])
ticket_event = ticket.children.create(name:"イベント")
ticket_event.children.create([{name:"声優/アニメ"},{name:"キッズ/ファミリー"},{name:"トークショー/講演会"},{name:"その他"}])
ticket_movie = ticket.children.create(name:"映画")
ticket_movie.children.create([{name:"邦画"},{name:"洋画"},{name:"その他"}])
ticket_facility = ticket.children.create(name:"施設利用権")
ticket_facility.children.create([{name:"遊園地/テーマパーク"},{name:"美術館/博物館"},{name:"スキー場"},{name:"ゴルフ場"},{name:"フィットネスクラブ"},{name:"プール"},{name:"ボウリング場"},{name:"水族館"},
                                 {name:"動物園"},{name:"その他"}])
ticket_preferential_discount = ticket.children.create(name:"優待券/割引券")
ticket_preferential_discount.children.create([{name:"ショッピング"},{name:"レストラン/食事券"},{name:"フード/ドリンク券"},{name:"宿泊券"},{name:"その他"}])
ticket_other = ticket.children.create(name:"その他")
ticket_other.children.create([{name:"すべて"}])

car_motorcycle = Category.create(name:"自動車・オートバイ")
car = car_motorcycle.children.create(name:"自動車本体")
car.children.create([{name:"国内自動車本体"},{name:"外国自動車本体"},{name:"その他"}])
car_wheel = car_motorcycle.children.create(name:"自動車タイヤ/ホイール")
car_wheel.children.create([{name:"タイヤ/ホイールセット"},{name:"タイヤ"},{name:"ホイール"},{name:"その他"}])
car_parts = car_motorcycle.children.create(name:"自動車パーツ")
car_parts.children.create([{name:"サスペンション"},{name:"ブレーキ"},{name:"外装、エアロパーツ"},{name:"ライト"},{name:"内装品、シート"},{name:"ステアリング"},{name:"マフラー・排気系"},{name:"エンジン、過給器、冷却装置"},
                           {name:"クラッチ、ミッション、駆動系"},{name:"電装品"},{name:"補強パーツ"},{name:"汎用パーツ"},{name:"外国自動車用パーツ"},{name:"その他"}])
car_accessory = car_motorcycle.children.create(name:"自動車アクセサリー")
car_accessory.children.create([{name:"車内アクセサリー"},{name:"カーナビ"},{name:"カーオーディオ"},{name:"車外アクセサリー"},{name:"メンテナンス用品"},{name:"チャイルドシート"},{name:"ドライブレコーダー"},{name:"レーダー探知機"},
                               {name:"カタログ/マニュアル"},{name:"セキュリティ"},{name:"ETC"},{name:"その他"}])
motorcycle = car_motorcycle.children.create(name:"オートバイ車体")
motorcycle.children.create([{name:"すべて"}])
motorcycle_parts = car_motorcycle.children.create(name:"オートバイパーツ")
motorcycle_parts.children.create([{name:"タイヤ"},{name:"マフラー"},{name:"エンジン、冷却装置"},{name:"カウル、フェンダー、外装"},{name:"サスペンション"},{name:"ホイール"},{name:"シート"},{name:"ブレーキ"},
                                  {name:"タンク"},{name:"ライト、ウィンカー"},{name:"チェーン、スプロケット、駆動系"},{name:"メーター"},{name:"電装系"},{name:"ミラー"},{name:"外国オートバイ用パーツ"},{name:"その他"}])
motorcycle_accessory = car_motorcycle.children.create(name:"オートバイアクセサリー")
motorcycle_accessory.children.create([{name:"ヘルメット/シールド"},{name:"バイクウェア/装備"},{name:"アクセサリー"},{name:"メンテナンス"},{name:"カタログ/マニュアル"},{name:"その他"}])

other = Category.create(name:"その他")
bulk_sale = other.children.create(name:"まとめ売り")
bulk_sale.children.create([{name:"すべて"}])
other_pet_supplies = other.children.create(name:"ペット用品")
other_pet_supplies.children.create([{name:"ペットフーズ"},{name:"犬用品"},{name:"猫用品"},{name:"魚用品/水草"},{name:"小動物用品"},{name:"爬虫類/両生類用品"},{name:"かご/おり"},{name:"鳥用品"},{name:"虫類用品"},{name:"その他"}])
other_foods = other.children.create(name:"食品")
other_foods.children.create([{name:"菓子"},{name:"米"},{name:"野菜"},{name:"果物"},{name:"調味料"},{name:"魚介類(加工食品)"},{name:"肉類(加工食品)"},{name:"その他"}])
other_drink = other.children.create(name:"飲料/酒")
other_drink.children.create([{name:"コーヒー"},{name:"ソフトドリンク"},{name:"ミネラルウォーター"},{name:"茶"},{name:"ウイスキー"},{name:"ワイン"},{name:"ブランデー"},{name:"焼酒"},{name:"日本酒"},{name:"ビール、発酵酒"},{name:"その他"}])
other_necessities_lifegoods_travel = other.children.create(name:"日用品/生活雑貨/旅行")
other_necessities_lifegoods_travel.children.create([{name:"タオル/バス用品"},{name:"日用品/生活雑貨"},{name:"洗剤/柔軟剤"},{name:"旅行用品"},{name:"防災関連グッズ"},{name:"その他"}])
other_collection = other.children.create(name:"アンティーク/コレクション")
other_collection.children.create([{name:"雑貨"},{name:"工芸品"},{name:"家具"},{name:"印刷物"},{name:"その他"}])
other_stationery = other.children.create(name:"文房具/事務用品")
other_stationery.children.create([{name:"筆記具"},{name:"ノート/メモ帳"},{name:"テープ/マスキングテープ"},{name:"カレンダー/スケジュール"},{name:"アルバム/スクラップ"},{name:"ファイル/バインダー"},{name:"はさみ/カッター"},{name:"カードホルダー/名刺管理"},
                                  {name:"のり/ホッチキス"},{name:"その他"}])
other_office_supplies = other.children.create(name:"事務/店舗用品")
other_office_supplies.children.create([{name:"オフィス用品一般"},{name:"オフィス家具"},{name:"店舗用品"},{name:"OA機器"},{name:"ラッピング/包装"},{name:"その他"}])
other_other = other.children.create(name:"その他")
other_other.children.create([{name:"すべて"}])


category_list = Category.create(name:"カテゴリー一覧")

chanel = Brand.create(name:"シャネル")
nike = Brand.create(name:"ナイキ")
louis_vitton = Brand.create(name:"ルイヴィトン")
supreme = Brand.create(name:"シュプリーム")
addidas = Brand.create(name:"アディダス")
brand_list = Brand.create(name:"ブランド一覧")