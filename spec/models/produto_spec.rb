require 'rails_helper'

RSpec.describe Produto, type: :model do
  context 'validations' do
    it "ensures the new Produto" do
        produto = Produto.new(sku: "abcd-efgh", 
                              nome: "Luana Oliveira",
                              descricao: "TDD",
                              quantidade: 2,
                              preco: 1,
                              codigo_barra: 12345678).save
        expect(produto).to eq(true)
    end   
    it "ensures the SKU - a-z|A-Z|-" do
        produto = Produto.new(sku: "abcd-1234",
                              nome: "Luana Oliveira",
                              descricao: "TDD",
                              quantidade: 2,
                              preco: 1,
                              codigo_barra: 12345678).save
        expect(produto).to eq(false)
      end
    it "ensures the presence of nome" do
        produto = Produto.new(sku: "abcd-efgh",
                              nome: "",
                              descricao: "TDD",
                              quantidade: 2,
                              preco: 1,
                              codigo_barra: 12345678).save
      expect(produto).to eq(false)
    end
    it "ensures the length of codigo barra - min 8" do
        produto = Produto.new(sku: "abcd-efgh",
                              nome: "Luana Oliveira",
                              descricao: "TDD",
                              quantidade: 2,
                              preco: 1,
                              codigo_barra: 1234567).save
        expect(produto).to eq(false)
    end
    it "ensures the length of codigo barra - max 13" do
        produto = Produto.new(sku: "abcd-efgh",
                              nome: "Luana Oliveira",
                              descricao: "TDD",
                              quantidade: 2,
                              preco: 1,
                              codigo_barra: 12345678901234).save
        expect(produto).to eq(false)
    end
    it "ensures the preco > 0" do
        produto = Produto.new(sku: "abcd-efgh",
                              nome: "Luana Oliveira",
                              descricao: "TDD",
                              quantidade: 2,
                              preco: 0,
                              codigo_barra: 12345678).save
        expect(produto).to eq(false)
    end
  end
end
