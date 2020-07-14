json.extract! produto, :id, :sku, :nome, :descricao, :quantidade, :preco, :created_at, :updated_at
json.url produto_url(produto, format: :json)
