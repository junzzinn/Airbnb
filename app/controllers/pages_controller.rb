class PagesController < ApplicationController
  def home
    @categories = {All: "fa-solid fa-mountain-city", Apartment: "fa-solid fa-building", House: "fa-solid fa-house"}
    if params[:query]
      @residences = Residence.search_by_title_and_address(params[:query])
    else
      @residences = Residence.all
    end
  end

  def host
  end
end
