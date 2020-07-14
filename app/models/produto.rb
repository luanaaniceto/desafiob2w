class Produto
  include Mongoid::Document
  field :sku, type: String
  field :nome, type: String
  field :descricao, type: String
  field :quantidade, type: Integer
  field :preco, type: Float
end
