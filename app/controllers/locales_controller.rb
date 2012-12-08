class LocalesController < ApplicationController
  # GET /locales
  # GET /locales.json
  def index
    @locales = Locale.all
    
    @data = Locale.includes(:idhs, :garbages).order('garbages.total DESC').limit(10).collect do |locale|
      { name: locale.name, garbage: (locale.garbages.first.try(:total) || 0).round(0), garbage_per_capita: ( ( (locale.garbages.first.try(:total) || 0).to_f / locale.population.try(:to_f) ) * 1000 ).round(2) } # TODO: Colocar os dados calculados aqui
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locales }
    end
  end

  # GET /locales/1
  # GET /locales/1.json
  def show
    city = params[:locale].match(/(.*), (.*)/)[1]
    state = params[:locale].match(/(.*), (.*)/)[2]

    @locale = Locale.where(name: city, state: state).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @locale }
    end
  end

  # GET /locales/new
  # GET /locales/new.json
  def new
    @locale = Locale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @locale }
    end
  end

  # GET /locales/1/edit
  def edit
    @locale = Locale.find(params[:id])
  end

  # POST /locales
  # POST /locales.json
  def create
    @locale = Locale.new(params[:locale])

    respond_to do |format|
      if @locale.save
        format.html { redirect_to @locale, notice: 'Locale was successfully created.' }
        format.json { render json: @locale, status: :created, location: @locale }
      else
        format.html { render action: "new" }
        format.json { render json: @locale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locales/1
  # PUT /locales/1.json
  def update
    @locale = Locale.find(params[:id])

    respond_to do |format|
      if @locale.update_attributes(params[:locale])
        format.html { redirect_to @locale, notice: 'Locale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @locale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locales/1
  # DELETE /locales/1.json
  def destroy
    @locale = Locale.find(params[:id])
    @locale.destroy

    respond_to do |format|
      format.html { redirect_to locales_url }
      format.json { head :no_content }
    end
  end
end
