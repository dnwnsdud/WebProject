document.addEventListener("DOMContentLoaded", function () {
  refreshBoard();
  document
    .getElementById("genreOptions")
    .addEventListener("change", filterPosts);
});

function addPost() {
  var title = document.getElementById("title").value.trim();
  var moviename = document.getElementById("moviename").value.trim();
  var location = document.getElementById("location").value.trim();
  var genreSelect = document.getElementById("commentOptions");
  var selectedGenre = genreSelect.options[genreSelect.selectedIndex].value;
  var memo = document.getElementById("memo").value.trim();

  if (!title || !moviename || !location) {
    alert("제목, 영화 이름, 지역은 필수 입력 항목입니다.");
    return;
  }

  var posts = JSON.parse(localStorage.getItem("posts")) || [];
  posts.push({ title, moviename, location, genre: selectedGenre, memo });
  localStorage.setItem("posts", JSON.stringify(posts));

  refreshBoard();
}

function refreshBoard() {
  filterPosts();
}

function filterPosts() {
  var selectedGenre = document.getElementById("genreOptions").value;
  var board = document.querySelector(".board-details");
  board.innerHTML = "";

  var posts = JSON.parse(localStorage.getItem("posts")) || [];
  var filtered =
    selectedGenre === "all-genre"
      ? posts
      : posts.filter((post) => post.genre === selectedGenre);

  filtered.forEach(function (post) {
    var postDiv = document.createElement("div");
    postDiv.classList.add("post");
    postDiv.innerHTML = `<h3>${post.title}</h3><p>영화 이름: ${
      post.moviename
    }</p><p>지역: ${post.location}</p><p>장르: ${genreToKorean(
      post.genre
    )}</p><p>메모: ${post.memo}</p>`;
    board.appendChild(postDiv);
  });
}

function genreToKorean(genre) {
  var genres = {
    action: "액션",
    comedy: "코미디",
    drama: "드라마",
    romance: "로맨스",
    thriller: "스릴러",
  };
  return genres[genre] || genre;
}
