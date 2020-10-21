function boxAdd() {
  const add_box = document.getElementById("box-submit-id");
  add_box.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("box-form"));
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
      const formText = document.getElementById("box-text");
      const HTML = `<a href = "/boxes/${box.id}/connects" class ="box">${box.name}</a>`;
      list.insertAdjacentHTML("beforeend", HTML);
      document.getElementById("box-text").style.display="none";
      document.getElementById("box-submit-id").style.display="none";
      document.getElementById("new-box").style.display="block";
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", boxAdd);