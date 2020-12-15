
const modalDecision = () => {
  const decisionModal = document.getElementById("decisionModal")
  if (decisionModal) {
    document.querySelectorAll(".stepModal").forEach((modalLink) => {
      modalLink.addEventListener("click", (event) => {
        decisionModal.querySelector(".modal-body").innerText = modalLink.dataset.decisionText;
      })
    })
  }
}

export { modalDecision }
