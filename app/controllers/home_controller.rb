class HomeController < ApplicationController
  layout :false

  def index
    @data = Locale.limit(10).collect do |locale|
      { name: locale.name, garbage: 0, garbage_per_capita: 0} # TODO: Colocar os dados calculados aqui
    end
  end
end
