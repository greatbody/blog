import { Controller } from "@hotwired/stimulus"

// data-controller="code-copy"
// data-code-copy-targets="source button"
export default class extends Controller {
  static targets = ["source", "button"]

  copy() {
    const code = this.sourceTarget.textContent
    navigator.clipboard.writeText(code).then(() => {
      const original = this.buttonTarget.textContent
      this.buttonTarget.textContent = "Copied!"
      this.buttonTarget.disabled = true
      setTimeout(() => {
        this.buttonTarget.textContent = original
        this.buttonTarget.disabled = false
      }, 1600)
    }).catch(() => {
      // Fallback if clipboard API not available
      const range = document.createRange()
      range.selectNode(this.sourceTarget)
      const selection = window.getSelection()
      selection.removeAllRanges()
      selection.addRange(range)
      try { document.execCommand("copy") } catch (e) {}
      selection.removeAllRanges()
    })
  }
}
