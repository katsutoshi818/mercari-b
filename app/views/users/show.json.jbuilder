json.array! @children do |children|
  json.id children.id
  json.category_name children.category_name
  json.ancestry children.ancestry
end

json.array! @grandchildren do |grandchildren|
  json.id grandchildren.id
  json.category_name grandchildren.category_name
  json.ancestry grandchildren.ancestry
end

json.products @products.length