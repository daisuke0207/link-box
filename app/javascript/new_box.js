function newBox() {
  const plus = document.getElementById("new-box");
  plus.addEventListener("click", () => {
    let box_text = document.getElementById("box-text");
    box_text.style.display = "block";
    box_text.focus();
    document.getElementById("box-submit").style.display="block";
    document.getElementById("new-box").style.display="none";
  });

  document.addEventListener('click',function(e){
    let t = e.target;
    const item1 = document.getElementById("box-submit");
    const item2 = document.getElementById("new-box");
    const item3 = document.getElementById("box-text");
    if (t.id === item1.id || t.id === item2.id || t.id === item3.id) {
      return null;
    }
    focus_out();
  });
}

function focus_out() {
  let form_text = document.getElementById("box-text");
  form_text.value = "";
  form_text.style.display="none";
  document.getElementById("box-submit").style.display="none";
  document.getElementById("new-box").style.display="block";
}
setInterval(newBox, 1000);