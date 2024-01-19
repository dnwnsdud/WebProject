<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.*,java.util.*, java.text.SimpleDateFormat, com.jsp.system.Ajax, java.net.URLEncoder,dto.userDTO"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AniMain</title>

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="/resources/index.js" defer></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <link rel="stylesheet" href="/resources/myrest.css" />
    <link rel="stylesheet" href="/resources/common.css" />
    <script src="/resources/login.js" defer></script>
  </head>
<%
userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");
JSONObject jsonAni = Ajax.JsonTObj(Ajax.GETO("http://localhost:9999/ani"));
%>
  <body>
    <header class="hd">
      <nav class="mw">
        <h1 class="logo">
          <a href="./index.jsp"
            ><img src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" />
          </a>
        </h1>
        <div class="gnb">
          <a href="./movie.jsp">영화</a>
          <a href="./animation.jsp">애니메이션</a>
          <a href="./notice_main.jsp">리뷰</a>
        </div>
  <div class="click">
				<input type="text" placeholder="콘텐츠 등을 검색해보세요!" />
				<%
				if (loggedInUser == null) {
				%>
				<button class="log">
					<a href="./login.jsp">로그인</a>
				</button>
				<button class="join">
					<a href="./terms.html">회원가입</a>
				</button>
				
				<%} %>
				<%if(loggedInUser != null){ %>
					<%if(loggedInUser.getUserID().equals("admin")){%>
				<button class="log">
					<a href="./logout.jsp">로그아웃</a>
				</button>
				<button class="log">
					<a href="./admin.jsp">관리자 페이지</a>
				</button><%}else{ %>
				
				<button class="log">
					<a href="./logout.jsp">로그아웃</a>
				</button>
				<%
				}
				%>
				<%
				}
				%>
				
			</div>

       
      </nav>
    </header>

    <div class="wrap">
      	
      <section class="con2">
        <h2>현지 인기 Top 10 </h2>
        <%
        List<Integer> recoli1 = new ArrayList<Integer>();
        recoli1.add(1);
        recoli1.add(0);
        recoli1.add(3);
        recoli1.add(37);
        recoli1.add(2);
        recoli1.add(13);
        recoli1.add(7);
        recoli1.add(84);
        recoli1.add(12);
        recoli1.add(15);

        %>
        <div class="swiper slide1">
          <ul class="swiper-wrapper">
        
          	<%for(int reco : recoli1) { %>
            <li class="swiper-slide">
            	<a href="<%="/anidetail.jsp?id=" + Integer.toString(jsonAni.getJSONArray("anilist").getJSONObject(reco).getInt("id"))%>">
            	<img src="<%=jsonAni.getJSONArray("anilist").getJSONObject(reco).getString("img_url")%>" alt="" />
            	</a>
            </li>
          	<%} %>
          </ul>
          <div class="swiper-button-next next1"></div>
          <div class="swiper-button-prev prev1"></div>
        </div>
      </section>
      <section class="con3">
        <h2>한국 인기 Top 25</h2>
        <%
        List<Integer> recoli2 = new ArrayList<Integer>();
        recoli2.add(1);
        recoli2.add(78);
        recoli2.add(2);
        recoli2.add(0);
        recoli2.add(7);
        recoli2.add(5);
        recoli2.add(13);
        recoli2.add(36);
        recoli2.add(69);
        recoli2.add(76);
        recoli2.add(16);
        recoli2.add(42);
        recoli2.add(9);
        recoli2.add(3);
        recoli2.add(35);
        recoli2.add(15);
        recoli2.add(33);
        recoli2.add(50);
        recoli2.add(47);
        recoli2.add(12);
        recoli2.add(32);
        recoli2.add(37);
        recoli2.add(18);
        recoli2.add(20);
        recoli2.add(4);

        %>
        <div class="swiper slide2">
          <ul class="swiper-wrapper">
        
          	<%for(int reco : recoli2) { %>
            <li class="swiper-slide">
            	<a href="<%="/anidetail.jsp?id=" + Integer.toString(jsonAni.getJSONArray("anilist").getJSONObject(reco).getInt("id"))%>">
            	<img src="<%=jsonAni.getJSONArray("anilist").getJSONObject(reco).getString("img_url")%>" alt="" />
            	</a>
            </li>
          	<%} %>
          </ul>
          <div class="swiper-button-next next2"></div>
          <div class="swiper-button-prev prev2"></div>
        </div>
      </section>
      <section class="con4">
        <h2>왓챠 피디아 컬렉션</h2>
        <div class="swiper slide3">
          <ul class="swiper-wrapper">
            <li class="swiper-slide">
            <%
            String url1 = "http://localhost:9999/ani?genres=%ED%8C%90%ED%83%80%EC%A7%80&genres=%EC%95%A1%EC%85%98";
            JSONObject col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            JSONArray col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
              	<%for(int i = 0; i < 4; i+=1) {%>
                <img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
              <%} %>
              </div>
              <br />
            </li>
            <li class="swiper-slide">
            <%
            url1 = "http://localhost:9999/ani?genres=%EB%AF%B8%EC%8A%A4%ED%84%B0%EB%A6%AC";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
              	<%for(int i = 0; i < 4; i+=1) {%>
                <img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
              <%} %>
              </div>
              <br />
            </li>
            <li class="swiper-slide">
              <%
            url1 = "http://localhost:9999/ani?genres=%EC%8A%A4%ED%8F%AC%EC%B8%A0";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
              	<%for(int i = 0; i < 4; i+=1) {%>
                <img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
              <%} %>
              </div>
              <br />
            </li>
            <li class="swiper-slide">
            <%
            url1 = "http://localhost:9999/ani?genres=%EC%B9%98%EC%9C%A0";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
                <img src="<%=col2.getJSONObject(0).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(1).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(2).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(4).getString("img_url")%>" alt="" />
                </div>
              <br />
            </li>
            <li class="swiper-slide">
               <%
            url1 = "http://localhost:9999/ani?genres=%EC%9D%B4%EC%84%B8%EA%B3%84";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
              	<%for(int i = 0; i < 4; i+=1) {%>
                <img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
              <%} %>
              </div>
              <br />
            </li>
            <li class="swiper-slide">
              <%
            url1 = "http://localhost:9999/ani?genres=%EB%A1%9C%EB%A7%A8%EC%8A%A4&genres=%ED%8C%90%ED%83%80%EC%A7%80";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
                <%for(int i = 0; i < 4; i+=1) {%>
                <img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
              <%} %>
                </div>
              <br />
            </li>
            <li class="swiper-slide">
                            <%
            url1 = "http://localhost:9999/ani?genres=%EC%9D%BC%EC%83%81";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
              	<%for(int i = 0; i < 4; i+=1) {%>
                <img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
              <%} %>
              </div>
              <br />
            </li>
            <li class="swiper-slide">
              <%
            url1 = "http://localhost:9999/ani?genres=SF";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
                <img src="<%=col2.getJSONObject(0).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(1).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(3).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(6).getString("img_url")%>" alt="" />
                </div>
              <br />
            </li>
            <li class="swiper-slide">
              <%
            url1 = "http://localhost:9999/ani?genres=%EC%95%84%EB%8F%99";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
                <img src="<%=col2.getJSONObject(0).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(1).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(2).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(5).getString("img_url")%>" alt="" />
                </div>
              <br />
            </li>
            <li class="swiper-slide">
              <%
            url1 = "http://localhost:9999/ani?genres=%EB%A1%9C%EB%A7%A8%EC%8A%A4&genres=%EA%B0%9C%EA%B7%B8";
            col1 = Ajax.JsonTObj(Ajax.GETO(url1));
            col2 = col1.getJSONArray("anilist");
            %>
              <div class="gr">
                <img src="<%=col2.getJSONObject(1).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(2).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(3).getString("img_url")%>" alt="" />
                <img src="<%=col2.getJSONObject(5).getString("img_url")%>" alt="" />
                </div>
              <br />
            </li>
          </ul>
          <div class="swiper-button-next next3"></div>
          <div class="swiper-button-prev prev3"></div>
        </div>
      </section>
    </div>
    <section class="con5">
      <div class="visited">
        <script language="javascript">
          expireDate = new Date(); // 현재 날짜 객체를 생성
          expireDate.setMonth(expireDate.getMonth() + 3); //현재 월에 3개월 더함
          hitCt = eval(cookieVal("pageHit")); // 방문 카운트 변수
          hitCt++; // 방문 카운트 +1
          document.cookie =
            "pageHit=" + hitCt + ";expires=" + expireDate.toGMTString(); // 쿠키 갱신
          function cookieVal(cookieName) {
            thisCookie = document.cookie.split("; ");
            for (i = 0; i < thisCookie.length; i++) {
              if (cookieName == thisCookie[i].split("=")[0]) {
                return thisCookie[i].split("=")[1];
              }
            }
            return 0;
          }
        </script>
        <script language="javascript" type="text/javascript">
          document.write(
            "<font color=white>현재 홈페이지에 <span class='num'>" +
              hitCt +
              "</span> 번째 방문자입니다!!"
          ); // 여기 고민해보기
          console.log(typeof hitCt);
        </script>
      </div>
    </section>
    <footer>
      <div class="left">
        <div class="tag">
          <a class="first" href="#">서비스 이용약관</a>
          <a class="second" href="#">개인정보 처리방침</a>
          <a href="#">회사 안내</a>
        </div>
        <div class="mail">
          <span>고객센터 | 이메일,전화번호</span><br />
          <span>광고문의 | 이메일, 최신광고 소개서</span><br />
          <span>제휴 및 대외 협력 | 홈페이지 주소</span>
        </div>
        <div class="name">
          <span>회사이름 | 대표이름 | 주소</span><br />
          <span>사업자 등록 번호</span>
        </div>
      </div>
      <div class="right">
        <button>한국어</button>
        <div>
          <a href="https://www.facebook.com/"
            ><svg
              xmlns="http://www.w3.org/2000/svg"
              height="20"
              width="20"
              viewBox="0 0 512 512"
            >
              <path
                fill="#fff"
                ,
                d="M512 256C512 114.6 397.4 0 256 0S0 114.6 0 256C0 376 82.7 476.8 194.2 504.5V334.2H141.4V256h52.8V222.3c0-87.1 39.4-127.5 125-127.5c16.2 0 44.2 3.2 55.7 6.4V172c-6-.6-16.5-1-29.6-1c-42 0-58.2 15.9-58.2 57.2V256h83.6l-14.4 78.2H287V510.1C413.8 494.8 512 386.9 512 256h0z"
              /></svg
          ></a>
          <a href="https://twitter.com/?lang=ko"
            ><svg
              xmlns="http://www.w3.org/2000/svg"
              height="20"
              width="20"
              viewBox="0 0 512 512"
            >
              <path
                fill="#fff"
                ,
                d="M459.4 151.7c.3 4.5 .3 9.1 .3 13.6 0 138.7-105.6 298.6-298.6 298.6-59.5 0-114.7-17.2-161.1-47.1 8.4 1 16.6 1.3 25.3 1.3 49.1 0 94.2-16.6 130.3-44.8-46.1-1-84.8-31.2-98.1-72.8 6.5 1 13 1.6 19.8 1.6 9.4 0 18.8-1.3 27.6-3.6-48.1-9.7-84.1-52-84.1-103v-1.3c14 7.8 30.2 12.7 47.4 13.3-28.3-18.8-46.8-51-46.8-87.4 0-19.5 5.2-37.4 14.3-53 51.7 63.7 129.3 105.3 216.4 109.8-1.6-7.8-2.6-15.9-2.6-24 0-57.8 46.8-104.9 104.9-104.9 30.2 0 57.5 12.7 76.7 33.1 23.7-4.5 46.5-13.3 66.6-25.3-7.8 24.4-24.4 44.8-46.1 57.8 21.1-2.3 41.6-8.1 60.4-16.2-14.3 20.8-32.2 39.3-52.6 54.3z"
              /></svg
          ></a>
          <a href="https://brunch.co.kr/"
            ><svg
              xmlns="http://www.w3.org/2000/svg"
              height="20"
              width="20"
              viewBox="0 0 320 512"
            >
              <path
                fill="#fff"
                ,
                d="M64 32C28.7 32 0 60.7 0 96V256 416c0 35.3 28.7 64 64 64H192c70.7 0 128-57.3 128-128c0-46.5-24.8-87.3-62-109.7c18.7-22.3 30-51 30-82.3c0-70.7-57.3-128-128-128H64zm96 192H64V96h96c35.3 0 64 28.7 64 64s-28.7 64-64 64zM64 288h96 32c35.3 0 64 28.7 64 64s-28.7 64-64 64H64V288z"
              /></svg
          ></a>
        </div>
      </div>
    </footer>
  </body>
</html>
