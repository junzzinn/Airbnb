// app/javascript/controllers/category_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];

  connect() {
    this.activeCategory = "All";
    console.log("Category controller connected!");
  }

  selectCategory(event) {
    console.log("Category button clicked:", event.target.dataset.category);
    this.buttonTargets.forEach(button => button.classList.remove("active"));
    event.target.classList.add("active");

    const category = event.target.dataset.category;

    if (category === "All") {
      this.activeCategory = "All";
      this.showAllResidences();
    } else {
      this.activeCategory = category;
      this.filterResidencesByCategory(category);
    }
  }

  showAllResidences() {
    this.residenceTargets.forEach(residence => (residence.style.display = "block"));
  }

  filterResidencesByCategory(category) {
    this.residenceTargets.forEach(residence => {
      if (residence.dataset.category === category) {
        residence.style.display = "block";
      } else {
        residence.style.display = "none";
      }
    });
  }

  get residenceTargets() {
    return this.element.querySelectorAll("[data-target='category.residence']");
  }
}
