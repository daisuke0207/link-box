function addConnect() {
  const con_sub = document.getElementById("connect-submit-id");
  con_sub.addEventListener("click", () => {
    const title = document.getElementById("connect-title-id");
    const link = document.getElementById("connect-link-id");
    const sub = document.getElementById("connect-submit-id");
    const addBtn = document.getElementById("add-connect-id");
    title.value = "";
    link.value = "";
    title.style.display="none";
    link.style.display="none";
    sub.style.display="none";
    addBtn.style.display="block";
  });
}
window.addEventListener("load", addConnect);