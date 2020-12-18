const clickTabFromOutside = () => {
  const clicks = document.querySelectorAll(".clickTab");
  const tab = document.getElementById("fluxo-tab");

  if ( tab) {
    clicks.forEach((clickElement) => {
      clickElement.addEventListener('click', (event) => {tab.click();});
  });
  };
}

export { clickTabFromOutside }