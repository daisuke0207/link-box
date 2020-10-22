function newBox() {
  const plus = document.getElementById("new-box");
  plus.addEventListener("click", () => {
    const box_text = document.getElementById("box-text");
    box_text.style.display = "block";
    box_text.focus();
    document.getElementById("box-submit-id").style.display="block";
    document.getElementById("new-box").style.display="none";
  });

  document.addEventListener('click', (e) => {
    let t = e.target;
    const submitBtn = document.getElementById("box-submit-id");
    const newBtn = document.getElementById("new-box");
    const boxText = document.getElementById("box-text");
    if (t === submitBtn || t === newBtn || t === boxText) {
      return null;
    }
    focusOut();
  });
}
function focusOut() {
  let form_text = document.getElementById("box-text");
  form_text.value = "";
  form_text.style.display="none";
  document.getElementById("box-submit-id").style.display="none";
  document.getElementById("new-box").style.display="block";
}
setInterval(newBox, 1000);