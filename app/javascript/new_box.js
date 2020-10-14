function newBox() {
  const plus = document.getElementById("new-box");
  plus.addEventListener("click", () => {
    let box_text = document.getElementById("box-text");
    box_text.style.display = "block";
    box_text.focus();
    document.getElementById("box-submit").style.display="block";
    document.getElementById("new-box").style.display="none";
  });

  function focus_out(){
    let form_text = document.getElementById("box-text");
    form_text.value = "";
    form_text.style.display="none";
    document.getElementById("box-submit").style.display="none";
    document.getElementById("new-box").style.display="block";
  }
  document.addEventListener("click", (t) => {
    if (t.target != "box-submit") {
      document.getElementById("box-text").addEventListener("blur", focus_out);
    }
  });
}
setInterval(newBox, 1000);