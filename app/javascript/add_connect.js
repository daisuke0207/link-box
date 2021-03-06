function addConnect() {
  const con_sub = document.getElementById("connect-submit-id");
  con_sub.addEventListener("click", (e) => {
    e.preventDefault();
    const con_form = document.getElementById("connect-form");
    const title = document.getElementById("connect-title-id");
    const link = document.getElementById("connect-link-id");
    const sub = document.getElementById("connect-submit-id");
    const addBtn = document.getElementById("add-connect-id");
    if (title.value == "" || link.value == "") {
      return null;
    }
    con_form.submit();
    title.style.display="none";
    link.style.display="none";
    sub.style.display="none";
    addBtn.style.display="block";
  });
  formExit();
}

function formExit() {
  const e_title = document.getElementById("connect-title-id");
  const e_link = document.getElementById("connect-link-id");
  const e_sub = document.getElementById("connect-submit-id");
  const e_addBtn = document.getElementById("add-connect-id");
  const form = document.getElementById("connect-form");
  document.addEventListener("click", (e) => {
    if ((e.target === e_addBtn) || (e.target === e_title) || (e.target === e_link) || (e.target === e_sub)) {
      return null;
    }
    e_title.style.display="none";
    e_link.style.display="none";
    e_sub.style.display="none";
    e_addBtn.style.display="block";
    e_title.value = "";
    e_link.value = "";
  });
}
setInterval(addConnect, 1000);