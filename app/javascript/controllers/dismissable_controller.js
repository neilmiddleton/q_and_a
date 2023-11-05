import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  static targets = ['node']

  close() {
    this.nodeTarget.hidden = true;
  }

}
