/* 체크 박스 전체 선택 해제 */
const agreeChkAll = document.querySelector(".dec");
agreeChkAll.addEventListener("change", (e) => {
  let agreeChk = document.querySelectorAll(".check input");
  if (e.target.checked == true) {
    for (item of agreeChk) {
      item.checked = true;
    }
  }
  for (let i = 0; i < agreeChk.length; i++) {
    agreeChk[i].checked = e.target.checked;
  }
});

/* 체크 안할시 페이지 이동 불가 */
const agreeBtn = document.querySelector(".agreeBtn");
const agreeCheck = document.querySelectorAll(".agreeCheck");
const agreeMsg = document.querySelector(".agreeMsg");

agreeMsg.style.display = "none";

agreeBtn.addEventListener("click", (e) => {
  agreeCheck.forEach((check) => {
    if (check.checked == false) {
      agreeMsg.style.display = "block";
      agreeMsg.innerHTML = "체크박스를 다시한번 확인해 주세요";
      e.preventDefault();
    }
  });
});

/* 모달 창 */
const modal = document.querySelector(".modal1");
const btnOpenModal = document.querySelector(".open_madal");
const btnCloseModal = document.querySelector(".modal_close");

btnOpenModal.addEventListener("click", () => {
  modal.style.display = "flex";
});
btnCloseModal.addEventListener("click", () => {
  modal.style.display = "none";
});

/*모달창 개인정보*/
const modal2 = document.querySelector(".modal2");
const btnOpenModal2 = document.querySelector(".open_madal2");
const btnCloseModal2 = document.querySelector(".modal_close2");

btnOpenModal2.addEventListener("click", () => {
  modal2.style.display = "flex";
});
btnCloseModal2.addEventListener("click", () => {
  modal2.style.display = "none";
});
