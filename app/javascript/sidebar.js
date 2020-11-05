// サイドバー開閉操作
function sideStatus() {
  if (document.URL.match(/boxes/)) {
    const sideBtn = document.getElementById("side-view");
    if (load(sideBtn)) {
      return null;
    }
    sideBtn.setAttribute("data-load", "true");
    let bool = false;
    sideBtn.addEventListener("click", () => {
      const side = document.getElementById("side-bar");
      if (bool) {
        open(side);
        bool = false;
      } else {
        close(side);
        bool = true;
      }
    });
  }
}

function load(params) {
  if (params.getAttribute("data-load") != null) {
    return true;
  }
}

// サイドバーを開く
function open(element){
  element.className="side-bar";
}

// サイドバー閉じる
function close(element) {
  element.className="side-close";
}

setInterval(sideStatus, 1000);