class PagesController < ApplicationController
  def home
    @categories = {All: "fa-solid fa-mountain-city", Apartment: "fa-solid fa-building", House: "fa-solid fa-house"}
    @residences = Residence.all
  end

  def host
  end
end
