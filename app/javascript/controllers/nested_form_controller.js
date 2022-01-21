import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = [ "links", "template" ]
  
    connect() {
    }
    add_association(event) {
      event.preventDefault()
  
      var content = this.templateTarget.innerHTML.replace(/New_RECORD/g, new Date().getTime())
      
      this.linksTarget.insertAdjacentHTML('beforebegin', content)
    }
}  