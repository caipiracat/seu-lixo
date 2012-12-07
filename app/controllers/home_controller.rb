class HomeController < ApplicationController
  layout :false

  def index
    @data = Locale.includes(:idhs, :garbages).order('garbages.total desc').limit(10).collect do |locale|
      { name: locale.name, garbage: locale.garbages.first.total.round(0), garbage_per_capita: ( ( locale.garbages.first.total.to_f / locale.population.to_f ) * 1000 ).round(2) } # TODO: Colocar os dados calculados aqui
    end
  end
end
