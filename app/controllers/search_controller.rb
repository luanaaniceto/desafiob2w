class SearchController < ApplicationController
    def search
        if params[:term].nil?
          @produtos = []
        else
          @produtos = Produto.search params[:term]
        end
      end
end
