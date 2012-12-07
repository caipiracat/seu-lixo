class GarbagesController < ApplicationController
  # GET /garbages
  # GET /garbages.json
  def index
    @garbages = Garbage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @garbages }
    end
  end

  # GET /garbages/1
  # GET /garbages/1.json
  def show
    @garbage = Garbage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @garbage }
    end
  end

  # GET /garbages/new
  # GET /garbages/new.json
  def new
    @garbage = Garbage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @garbage }
    end
  end

  # GET /garbages/1/edit
  def edit
    @garbage = Garbage.find(params[:id])
  end

  # POST /garbages
  # POST /garbages.json
  def create
    @garbage = Garbage.new(params[:garbage])

    respond_to do |format|
      if @garbage.save
        format.html { redirect_to @garbage, notice: 'Garbage was successfully created.' }
        format.json { render json: @garbage, status: :created, location: @garbage }
      else
        format.html { render action: "new" }
        format.json { render json: @garbage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /garbages/1
  # PUT /garbages/1.json
  def update
    @garbage = Garbage.find(params[:id])

    respond_to do |format|
      if @garbage.update_attributes(params[:garbage])
        format.html { redirect_to @garbage, notice: 'Garbage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @garbage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garbages/1
  # DELETE /garbages/1.json
  def destroy
    @garbage = Garbage.find(params[:id])
    @garbage.destroy

    respond_to do |format|
      format.html { redirect_to garbages_url }
      format.json { head :no_content }
    end
  end
end
