crumb :root do
  link "メルカリ", root_path
end

crumb :item do |item|
  link item.name, item_path
end

crumb :my_item do |item|
  link item.name, item_path
end

crumb :mypage do
  link "マイページ", users_path
end

crumb :show_profile do |user|
  link user.nickname, user_path
end

crumb :notifications do
  link "お知らせ", users_path
  parent :mypage
end

crumb :todo do
  link "やることリスト", users_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_users_path
  parent :mypage
end

crumb :selling do
  link "出品した商品 - 出品中", selling_users_path
  parent :mypage
end

crumb :in_progress do
  link "出品した商品 - 取引中", in_progress_users_path
  parent :mypage
end

crumb :completed do
  link "出品した商品 - 売却済", completed_users_path
  parent :mypage
end

crumb :purchase do
  link "購入した商品 - 取引中", purchase_users_path
  parent :mypage
end

crumb :purchased do
  link "購入した商品 - 過去の取引", purchased_users_path
  parent :mypage
end

crumb :edit_profile do
  link "プロフィール", edit_profile_users_path
  parent :mypage
end

crumb :card do
  link "支払い方法", card_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :categories do
  link "カテゴリー一覧", categories_path
end

crumb :category do |category|
  link category.name, category_path(category)
  parent :categories
end


# crumb :brands do
#   link "ブランド一覧"
# end

# crumb :brand do |brand|
#   link brand.name, brand_path
#   parent :brands
# end

# crumb :areas do
#   link "出品地域一覧"
# end

# crumb :area do |area|
#   link area.name, category_path
#   parent :areas
# end

# crumb :search do |search|
#   link search
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).