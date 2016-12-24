json.array! @messages.each do |message|
  json.(message, :id, :status, :category_name, :title, :content, :created_at)
end
# json.messages @messages do |message|
#   json.id message.id
#   json.status message.status
#   json.category_name message.category_name
#   json.title message.title
#   json.content message.content
#   json.created_at message.created_at
# end