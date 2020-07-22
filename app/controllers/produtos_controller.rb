class ProdutosController < ApplicationController
  include ProdutosHelper
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = fetch_produtos
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        csv
        format.html { redirect_to @produto, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        csv
        format.html { redirect_to @produto, notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    csv
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produto_params
      params.require(:produto).permit(:sku, :nome, :descricao, :quantidade, :preco, :codigo_barra)
    end

    def csv
      report = ReportController.new
      report.csv
    end
end
