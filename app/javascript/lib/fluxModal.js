
const modalFlux = () => {
  const fluxModal = document.getElementById("fluxModal")
  if (fluxModal) {
    document.querySelectorAll(".stageModal").forEach((modalLink) => {
      modalLink.addEventListener("click", (event) => {
        fluxModal.querySelector(".modal-body");
      })
    })
  }
}

export { modalFlux }
