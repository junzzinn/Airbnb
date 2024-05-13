import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["residence"]

  connect() {
    this.activeCategory = "All"
    console.log('====================================');
    console.log("oi");
    console.log('====================================');
  }

  filter(event) {
    event.preventDefault()
    const category = event.currentTarget.dataset.category

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
