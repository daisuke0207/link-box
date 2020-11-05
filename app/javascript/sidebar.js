// サイドバー開閉操作
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
        open(side_status);
        bool = false;
      } else {
        close(side_status);
        bool = true;
      }
    });
  }
}

// サイドバーを開く
function open(status){
  status.className="side-bar";
}

// サイドバー閉じる
function close(status) {
  status.className="side-close";
}

setInterval(sideStatus, 1000);