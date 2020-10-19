function connectBtn() {
  const btn = document.getElementById("add-connect-id");
  btn.addEventListener("click", () => {
    const con_title = document.getElementById("connect-title-id");
    const con_link = document.getElementById("connect-link-id");
    const con_sub = document.getElementById("connect-submit-id");
    con_title.style.display="block";
    con_link.style.display="block";
    con_sub.style.display="block";
    btn.style.display="none";
  });
}
setInterval(connectBtn, 1000);