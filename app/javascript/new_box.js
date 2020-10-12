function new_box() {
  const plus = document.getElementById("new-box");
  plus.addEventListener("click", () => {
    let box_text = document.getElementById("box-text");
    box_text.style.display = "inline";
    box_text.focus();
    document.getElementById("submit").style.display="inline";
    document.getElementById("new-box").style.display="none";
  });

  function focus_out(){
    document.getElementById("box-text").style.display="none";
    document.getElementById("submit").style.display="none";
    document.getElementById("new-box").style.display="block";
  }
  document.getElementById("box-text").addEventListener("blur", focus_out);
}
setInterval(new_box, 1000);