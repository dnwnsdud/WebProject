// 좋아요 기능
function Likefunction(imageElement) {
  var likes = parseInt(imageElement.getAttribute("data-likes"), 10);
  var isLiked = imageElement.src.includes("like_2.png");

  if (isLiked) {
    imageElement.src = "../img/like_1.png";
    likes--;
  } else {
    imageElement.src = "../img/like_2.png";
    likes++;
  }
  imageElement.setAttribute("data-likes", likes);
  imageElement.nextElementSibling.textContent = likes;
}

// 댓글 등록
function postComment() {
  var input = document.getElementById("commentInput");
  var commentText = input.value.trim();

  if (commentText) {
    var commentsList = document.getElementById("commentsList");
    var newComment = document.createElement("li");
    newComment.innerHTML = commentText.replace(/\n/g, "<br>");
    commentsList.appendChild(newComment);

    input.value = "";
  }
}
function Endterkey(event) {
  if (event.key === "Enter") {
    postComment();
  }
}

// 리뷰 팝업창
function toggleReviewPopup() {
  var popup = document.getElementById("reviewPopup");
  var overlay = document.getElementById("reviewOverlay");

  var isPopupVisible = popup.style.display === "block";
  popup.style.display = isPopupVisible ? "none" : "block";
  overlay.style.display = isPopupVisible ? "none" : "block";
}

// 댓글 팝업창
function CommentsPopup(reviewId) {
  var popup = document.getElementById("commentsPopup");
  var overlay = document.getElementById("commentsOverlay");

  var currentReviewId = popup.getAttribute("data-review-id");
  if (reviewId && currentReviewId !== reviewId) {
    popup.setAttribute("data-review-id", reviewId);
  } else {
    popup.removeAttribute("data-review-id");
  }
  var isPopupVisible = popup.style.display === "block";
  popup.style.display = isPopupVisible ? "none" : "block";
  overlay.style.display = isPopupVisible ? "none" : "block";
}

function submitReview() {
  var title = document.getElementById("reviewTitleInput").value.trim();
  var rating = document.getElementById("reviewRatingInput").value;
  var content = document.getElementById("reviewContentInput").value.trim();

  var formattedContent = content.replace(/\n/g, "<br>");

  if (title && content) {
    var reviewId = "review-" + Date.now();
    var newReview = document.createElement("div");
    newReview.classList.add("review");
    newReview.setAttribute("id", reviewId);
    newReview.innerHTML = `
      <h2><a href="#"><img src="../img/person.png" alt="Icon" class="person-icon"></a>${title}</h2>
      <div class="review-star">별점: ${
        "★".repeat(rating) + "☆".repeat(5 - rating)
      }</div>
      <p class="review-content">${formattedContent}</p>
      <div class="interaction-bar">
        <img src="../img/like_1.png" class="like-icon" onclick="Likefunction(this)" alt="Like" data-likes="0">
        <span class="like-count">0</span>
        <span class="comment" onclick="CommentsPopup('${reviewId}')">댓글</span>
      </div>
    `;

    var reviewList = document.getElementById("reviewList");
    reviewList.appendChild(newReview);

    document.getElementById("reviewTitleInput").value = "";
    document.getElementById("reviewRatingInput").selectedIndex = 0;
    document.getElementById("reviewContentInput").value = "";
    toggleReviewPopup();
  }
}

function init() {
  document.querySelectorAll(".review").forEach((review) => {
    const commentButton = review.querySelector(".comment");
    if (commentButton) {
      commentButton.onclick = function () {
        const reviewId = review.getAttribute("id");
        CommentsPopup(reviewId);
      };
    }
  });
  document.getElementById("reviewOverlay").onclick = closePopups;
  document.getElementById("commentsOverlay").onclick = closePopups;
}

function closePopups() {
  var reviewPopup = document.getElementById("reviewPopup");
  var commentsPopup = document.getElementById("commentsPopup");
  var reviewOverlay = document.getElementById("reviewOverlay");
  var commentsOverlay = document.getElementById("commentsOverlay");

  reviewPopup.style.display = "none";
  commentsPopup.style.display = "none";
  reviewOverlay.style.display = "none";
  commentsOverlay.style.display = "none";
}

window.onload = init;

function toggleComments() {
  var commentsPopup = document.getElementById("commentsPopup");
  var commentsOverlay = document.getElementById("commentsOverlay");

  var isPopupVisible = commentsPopup.style.display === "block";
  commentsPopup.style.display = isPopupVisible ? "none" : "block";
  commentsOverlay.style.display = isPopupVisible ? "none" : "block";
} // 좋아요 기능
function Likefunction(imageElement) {
  var likes = parseInt(imageElement.getAttribute("data-likes"), 10);
  var isLiked = imageElement.src.includes("like_2.png");

  if (isLiked) {
    imageElement.src = "../img/like_1.png";
    likes--;
  } else {
    imageElement.src = "../img/like_2.png";
    likes++;
  }
  imageElement.setAttribute("data-likes", likes);
  imageElement.nextElementSibling.textContent = likes;
}

// 댓글 등록
function postComment() {
  var input = document.getElementById("commentInput");
  var commentText = input.value.trim();

  if (commentText) {
    var commentsList = document.getElementById("commentsList");
    var newComment = document.createElement("li");
    newComment.innerHTML = commentText.replace(/\n/g, "<br>");
    commentsList.appendChild(newComment);

    input.value = "";
  }
}
function Endterkey(event) {
  if (event.key === "Enter") {
    postComment();
  }
}

// 리뷰 팝업창
function toggleReviewPopup() {
  var popup = document.getElementById("reviewPopup");
  var overlay = document.getElementById("reviewOverlay");

  var isPopupVisible = popup.style.display === "block";
  popup.style.display = isPopupVisible ? "none" : "block";
  overlay.style.display = isPopupVisible ? "none" : "block";
}

// 댓글 팝업창
function CommentsPopup(reviewId) {
  var popup = document.getElementById("commentsPopup");
  var overlay = document.getElementById("commentsOverlay");

  var currentReviewId = popup.getAttribute("data-review-id");
  if (reviewId && currentReviewId !== reviewId) {
    popup.setAttribute("data-review-id", reviewId);
  } else {
    popup.removeAttribute("data-review-id");
  }
  var isPopupVisible = popup.style.display === "block";
  popup.style.display = isPopupVisible ? "none" : "block";
  overlay.style.display = isPopupVisible ? "none" : "block";
}

function submitReview() {
  var title = document.getElementById("reviewTitleInput").value.trim();
  var rating = document.getElementById("reviewRatingInput").value;
  var content = document.getElementById("reviewContentInput").value.trim();

  var formattedContent = content.replace(/\n/g, "<br>");

  if (title && content) {
    var reviewId = "review-" + Date.now();
    var newReview = document.createElement("div");
    newReview.classList.add("review");
    newReview.setAttribute("id", reviewId);
    newReview.innerHTML = `
      <h2><a href="#"><img src="../img/person.png" alt="Icon" class="person-icon"></a>${title}</h2>
      <div class="review-star">별점: ${
        "★".repeat(rating) + "☆".repeat(5 - rating)
      }</div>
      <p class="review-content">${formattedContent}</p>
      <div class="interaction-bar">
        <img src="../img/like_1.png" class="like-icon" onclick="Likefunction(this)" alt="Like" data-likes="0">
        <span class="like-count">0</span>
        <span class="comment" onclick="CommentsPopup('${reviewId}')">댓글</span>
      </div>
    `;

    var reviewList = document.getElementById("reviewList");
    reviewList.appendChild(newReview);

    document.getElementById("reviewTitleInput").value = "";
    document.getElementById("reviewRatingInput").selectedIndex = 0;
    document.getElementById("reviewContentInput").value = "";
    toggleReviewPopup();
  }
}

function init() {
  document.querySelectorAll(".review").forEach((review) => {
    const commentButton = review.querySelector(".comment");
    if (commentButton) {
      commentButton.onclick = function () {
        const reviewId = review.getAttribute("id");
        CommentsPopup(reviewId);
      };
    }
  });
  document.getElementById("reviewOverlay").onclick = closePopups;
  document.getElementById("commentsOverlay").onclick = closePopups;
}

function closePopups() {
  var reviewPopup = document.getElementById("reviewPopup");
  var commentsPopup = document.getElementById("commentsPopup");
  var reviewOverlay = document.getElementById("reviewOverlay");
  var commentsOverlay = document.getElementById("commentsOverlay");

  reviewPopup.style.display = "none";
  commentsPopup.style.display = "none";
  reviewOverlay.style.display = "none";
  commentsOverlay.style.display = "none";
}

window.onload = init;

function toggleComments() {
  var commentsPopup = document.getElementById("commentsPopup");
  var commentsOverlay = document.getElementById("commentsOverlay");

  var isPopupVisible = commentsPopup.style.display === "block";
  commentsPopup.style.display = isPopupVisible ? "none" : "block";
  commentsOverlay.style.display = isPopupVisible ? "none" : "block";
}
