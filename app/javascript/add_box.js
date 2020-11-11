function submitBtn() {
  const add_box = document.getElementById("box-submit-id");
  if (add_box.getAttribute("data-load") != null ) {
    return null;
  }
  add_box.setAttribute("data-load", "true");
  add_box.addEventListener("click", function boxAdd(e){
    const formData = new FormData(document.getElementById("box-form"));
    const name = document.getElementById("box-text").value;
    if (name == "") {
      return null;
    }
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/boxes", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const box = XHR.response.box;
      const list = document.getElementById("box-lists");
      const HTML = `<a href = "/boxes/${box.id}/connects" class ="box">${box.name}</a>`;
      list.insertAdjacentHTML("beforeend", HTML);
      const formText = document.getElementById("box-text");
      const formBtn = document.getElementById("box-submit-id");
      const newBtn = document.getElementById("new-box");
      formText.style.display="none";
      formText.value = "";
      formBtn.style.display="none";
      newBtn.style.display="block";
    };
    e.preventDefault();
  });
}
setInterval(submitBtn, 1000);