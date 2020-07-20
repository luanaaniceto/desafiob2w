module ProdutosHelper
    def fetch_produtos
        produtos =  $redis.get("produtos")
        
        if produtos.nil?
            puts "================= MONGODB ===================== "
            produtos = Produto.all.to_json
            $redis.set("produtos", produtos)
        else
            puts "================= REDIS ===================== "
        end
        
        @produtos = JSON.load produtos
    end  
end
