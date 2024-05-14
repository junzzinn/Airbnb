import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["residence", "categoryButton"]

  connect() {
    this.activeCategory = "All"
  }

  filter(event) {
    event.preventDefault()
    const category = event.currentTarget.dataset.category

    this.categoryButtonTargets.forEach((catButton) => {
      if (catButton.dataset.category !== category){
        catButton.classList.remove("active");
      }else{
        catButton.classList.add("active")
      }
    })

    this.activeCategory = category
    this.updateResidences()
  }

  updateResidences() {
    this.residenceTargets.forEach((residence) => {
      if (this.activeCategory === "All" || residence.dataset.category === this.activeCategory) {
        residence.classList.remove("d-none")
      } else {
        residence.classList.add("d-none")
      }
    })
  }
}
