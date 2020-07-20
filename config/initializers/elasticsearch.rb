# Elasticsearch::Model.client = Elasticsearch::Client.new host: 'http://localhost:9200'
# unless Produto.__elasticsearch__.index_exists?   
#     Produto.__elasticsearch__.create_index! force: true 
#     Produto.import 
# end