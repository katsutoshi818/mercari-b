crumb :root do
  link "メルカリ", root_path
end

# products/show
crumb :show_product do |product|
  link "#{
    product.product_name}", ""
parent :root
end

# categories/show
crumb :categoies_show do |category|
  link "#{category.root.category_name}  #{
    category.category_name}", ""
parent :root
end

# product/search
crumb :search_product do
  link "検索結果", ""
parent :root
end

# user/show
crumb :user_show do |user|
  link "マイページ", ""
parent :root
end

# card/index
crumb :card_index do
  link "クレジットカード情報", ""
parent :user_show
end


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