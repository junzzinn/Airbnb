import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = [ "checkIn", "checkOut", "totalPriceNight", "nights", "pricePerNight", "total",
  "pricePerNight", "totalPriceField", "checkInField", "checkOutField" ]

  connect() {
    flatpickr(this.checkInTarget, {  onChange: this.updateTotalPrice.bind(this) })
    flatpickr(this.checkOutTarget, {  onChange: this.updateTotalPrice.bind(this) })
    this.updateTotalPrice()
  }

  updateTotalPrice() {
    const checkInDate = new Date(this.checkInTarget.value)
    const checkOutDate = new Date(this.checkOutTarget.value)
    const pricePerNight = parseFloat(this.pricePerNightTarget.dataset.price)

    if (checkInDate && checkOutDate && checkOutDate > checkInDate) {
      const diffTime = Math.abs(checkOutDate - checkInDate)
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))

      const totalPrice = diffDays * pricePerNight

      this.nightsTarget.innerText = diffDays
      this.totalPriceNightTarget.innerText = `$${totalPrice.toFixed(2)}`
      this.totalTarget.innerText = `$${(totalPrice + 64 + 42).toFixed(2)}`

      // Update hidden fields
      this.totalPriceFieldTarget.value = totalPrice.toFixed(2)
      this.checkInFieldTarget.value = this.formatDate(checkInDate)
      this.checkOutFieldTarget.value = this.formatDate(checkOutDate)
    } else {
      this.nightsTarget.innerText = 0
      this.totalPriceNightTarget.innerText = `$0.00`
      this.totalTarget.innerText = `$0.00`

      // Clear hidden fields
      this.totalPriceFieldTarget.value = 0
      this.checkInFieldTarget.value = ''
      this.checkOutFieldTarget.value = ''
    }
  }
  formatDate(date) {
    const day = String(date.getDate()).padStart(2, '0')
    const month = String(date.getMonth() + 1).padStart(2, '0')
    const year = date.getFullYear()
    return `${year}-${month}-${day}`
  }
}
