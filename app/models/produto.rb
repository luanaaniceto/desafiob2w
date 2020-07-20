class Produto
  include Mongoid::Document
  include Elasticsearch::Model 
  include Elasticsearch::Model::Callbacks 
  
  attr_reader :attributes

  def initialize(attributes={})
    @attributes = attributes
  end

  def to_hash
    @attributes
  end

  index_name "repository"

  field :sku, type: String
  field :nome, type: String
  field :descricao, type: String
  field :quantidade, type: Integer
  field :preco, type: Float

  after_save :clear_cache
  after_update :clear_cache
  after_destroy :clear_cache

  def clear_cache
    $redis.del "produtos"
  end
  def as_indexed_json(options={})
    as_json()
  end
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          "match_all": {}
        }
      }
    )
  end
end
