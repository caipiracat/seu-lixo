class LocalidadesController < ApplicationController
  # GET /localidades
  # GET /localidades.json
  def index
    @localidades = Localidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localidades }
    end
  end

  # GET /localidades/1
  # GET /localidades/1.json
  def show
    @localidade = Localidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localidade }
    end
  end

  # GET /localidades/new
  # GET /localidades/new.json
  #def new
  #  @localidade = Localidade.new
#
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @localidade }
  #  end
  #end

  # GET /localidades/1/edit
  #def edit
   # @localidade = Localidade.find(params[:id])
  #end

  # POST /localidades
  # POST /local###idades.json
  #def create
   # @localidade = Localidade.new(params[:localidade])

    ##respond_to do |format|
    ##  if @localidade.save
    ##    format.html { redirect_to @localidade, notice: 'Localidade was successfully created.' }
    ##    format.json { render json: @localidade, status: :created, location: @localidade }
    ##  else
    ##    format.html { render action: "new" }
    ##    format.json { render json: @localidade.errors, status: :unprocessable_entity }
    ##  end
    ##end
  ##end

  # PUT /localidades/1
  # PUT /localidades/1.json
 ### def update
    ###@localidade = Localidade.find(params[:id])
###
 ###   respond_to do |format|
  ###    if @localidade.update_attributes(params[:localidade])
  ###      format.html { redirect_to @localidade, notice: 'Localidade was successfully updated.' }
  ###      format.json { head :no_content }
  ###    else
  ###      format.html { render action: "edit" }
  ###      format.json { render json: @localidade.errors, status: :unprocessable_entity }
  ###    end
  ###  end
  ###end

  # DELETE /localidades/1
  # DELETE /localidades/1.json
  def destroy
    @localidade = Localidade.find(params[:id])
    @localidade.destroy

    respond_to do |format|
      format.html { redirect_to localidades_url }
      format.json { head :no_content }
    end
  end
end
