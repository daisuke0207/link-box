// DOM操作
function getBtn() {
  const openBtn = document.getElementById("all-open-id");
  openBtn.addEventListener("click", allOpen);
}

// すべてのリンクを開く
function allOpen() {
  let allItems = document.querySelectorAll(".link-title");
  allItems.forEach(a => {
    window.open(a);
  });
}
setInterval(getBtn, 1000);