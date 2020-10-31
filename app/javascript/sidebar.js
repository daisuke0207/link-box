function sideStatus() {
  if (document.URL.match(/boxes/)) {
    const sideBtn = document.getElementById("side-view");
    if (sideBtn.getAttribute("data-load") != null ) {
      return null;
    }
    sideBtn.setAttribute("data-load", "true");
    let bool = false;
    sideBtn.addEventListener("click", () => {
      const side_status = document.getElementById("side-bar");
      if (bool) {
        side_status.className="side-bar";
        bool = false;
      } else {
        side_status.className="side-exit";
        bool = true;
      }
    });
  }
}
setInterval(sideStatus, 1000);