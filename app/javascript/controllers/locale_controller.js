import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "submit" ]

  initialize() {
    this.submitTarget.style.display = 'none'
  }
}
