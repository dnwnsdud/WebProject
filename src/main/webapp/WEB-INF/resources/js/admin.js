document.addEventListener("DOMContentLoaded", function () {
  const submenuData = {
    "한달간 방문한 방문자 수": "<div>한달간 방문한 방문자 수: ##명</div>",
    "한달간 가입한 회원 수": "<div>한달간 가입한 회원 수: ##명</div>",
    "리뷰 반응": "<div>긍정 리뷰: ##개, 부정 리뷰: ##개</div>",
    "문의 내역": "<div>미해결 문의: ##개, 해결된 문의: ##개</div>",
  };
  function loadContent(title) {
    const contentArea = document.querySelector(".main-content");
    contentArea.innerHTML = `<h1>${title}</h1>${
      submenuData[title] || "<p>데이터 없음</p>"
    }`;
  }

  document.querySelectorAll(".submenu a").forEach(function (submenuItem) {
    submenuItem.addEventListener("click", function (e) {
      e.preventDefault();
      const title = submenuItem.textContent.trim();
      loadContent(title);
    });
  });
});

document.addEventListener("DOMContentLoaded", function () {
  function setupCanvas(canvas) {
    const dpr = window.devicePixelRatio || 1;
    const displayWidth = canvas.clientWidth;
    const displayHeight = canvas.clientHeight;

    canvas.width = displayWidth * dpr;
    canvas.height = displayHeight * dpr;

    const ctx = canvas.getContext("2d");
    ctx.scale(dpr, dpr);
    return ctx;
  }

  function drawChart(canvasId, data, label) {
    const canvas = document.getElementById(canvasId);
    const ctx = setupCanvas(canvas);

    const colors = ["red", "green", "blue", "purple", "orange", "yellow"];

    data.forEach((value, index) => {
      const x =
        ((canvas.width / data.length) * index) / window.devicePixelRatio;
      const y = (canvas.height - value * 5) / window.devicePixelRatio;
      const width = (canvas.width / data.length - 20) / window.devicePixelRatio;
      const height = (value * 5) / window.devicePixelRatio;

      ctx.fillStyle = colors[index % colors.length];
      ctx.fillRect(x + 10, y, width, height);

      ctx.fillStyle = "black";
      ctx.fillText(`${label[index]}: ${value}`, x + 10, y - 10);
    });
  }

  const membersData = [50, 60, 70, 80, 90, 100, 50, 60, 70, 80, 90, 100];
  const visitorsData = [50, 60, 70, 80, 90, 100, 50, 60, 70, 80, 90, 100];

  drawChart("visitorsChart", visitorsData, [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월",
  ]);
  drawChart("membersChart", membersData, [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월",
  ]);
});
