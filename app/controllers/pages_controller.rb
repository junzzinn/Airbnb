class PagesController < ApplicationController
  def home
    @residences = Residence.all
  end

  def host
  end
end
