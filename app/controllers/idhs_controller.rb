class IdhsController < ApplicationController
  # GET /idhs
  # GET /idhs.json
  def index
    @idhs = Idh.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @idhs }
    end
  end

  # GET /idhs/1
  # GET /idhs/1.json
  def show
    @idh = Idh.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idh }
    end
  end

  # GET /idhs/new
  # GET /idhs/new.json
  def new
    @idh = Idh.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idh }
    end
  end

  # GET /idhs/1/edit
  def edit
    @idh = Idh.find(params[:id])
  end

  # POST /idhs
  # POST /idhs.json
  def create
    @idh = Idh.new(params[:idh])

    respond_to do |format|
      if @idh.save
        format.html { redirect_to @idh, notice: 'Idh was successfully created.' }
        format.json { render json: @idh, status: :created, location: @idh }
      else
        format.html { render action: "new" }
        format.json { render json: @idh.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /idhs/1
  # PUT /idhs/1.json
  def update
    @idh = Idh.find(params[:id])

    respond_to do |format|
      if @idh.update_attributes(params[:idh])
        format.html { redirect_to @idh, notice: 'Idh was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idh.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idhs/1
  # DELETE /idhs/1.json
  def destroy
    @idh = Idh.find(params[:id])
    @idh.destroy

    respond_to do |format|
      format.html { redirect_to idhs_url }
      format.json { head :no_content }
    end
  end
end
