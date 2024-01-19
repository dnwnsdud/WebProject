<%@page import="com.jsp.system.Ajax.Pair"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.json.*,java.util.*, java.text.SimpleDateFormat, com.jsp.system.Ajax, java.net.URLEncoder,dto.userDTO"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>detail</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link rel="stylesheet" href="/resources/anidetail.css" />
<link rel="stylesheet" href="/resources/myrest.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js" defer></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="/resources/detail.js" defer></script>
</head>
<body>
	<header class="hd">
		<nav class="mw">
			<h1 class="logo">
				<a href="/index.jsp"><svg
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 805.16 175">
              <defs>
                <style>
.cls-1 {
	fill: none;
}

.cls-2 {
	fill: #fff;
}
</style>
              </defs>
              <g id="레이어_2" data-name="레이어 2">
                <g id="WATCHA_Logo">
                  <rect class="cls-1" width="805.16" height="175" />
                  <polygon class="cls-2"
							points="0 31 31.15 31 42.34 113.74 45.94 113.5 59 31 84 31 96.53 110.14 100.15 109.9 112 0 143 0 117.07 144.05 84.75 146.2 73.07 72.5 69.93 72.5 57.97 147.98 27.5 150 0 31" />
                  <path class="cls-2"
							d="M153.16,31,133.07,144h24.2L160,125.74H182.9L185.57,144H210L189.68,31Zm9.89,74.19,7-47h3l6.88,47Z" />
                  <path class="cls-2"
							d="M479.68,31H443.16L423.07,144h24.2L450,125.74H472.9L475.57,144H500Zm-26.63,74.19,7-47h3l6.88,47Z" />
                  <path class="cls-2"
							d="M305,29.86c-22.27,0-32.94,12.1-32.94,30.82v53.64c0,18.72,10.67,30.82,32.94,30.82s32.94-12.1,32.94-30.82V94.92H313.18v21.69c0,5.93-2.27,8-8.18,8s-8.18-2.06-8.18-8V58.39c0-5.93,2.27-8,8.18-8s8.18,2.06,8.18,8V71.18h24.76V60.68C337.94,42,327.27,29.86,305,29.86Z" />
                  <polygon class="cls-2"
							points="203.3 54.51 223.7 54.51 223.7 144 248.3 144 248.3 54.51 266.3 54.51 266.3 31 203.3 31 203.3 54.51" />
                  <polygon class="cls-2"
							points="391.23 75.72 373.61 75.72 373.61 31 348.85 31 348.85 144 373.61 144 373.61 98.72 391.23 98.72 391.23 144 415.99 144 415.99 31 391.23 31 391.23 75.72" />
                  <path class="cls-2"
							d="M531,31h27c11.37,0,18.57,3.2,21.77,10.41,1.76,3.84,2.08,7.2,2.08,19.68s-.32,15.85-2.08,19.85c-3.2,7-10.4,10.24-21.77,10.24H545.73V144H531Zm23.37,46.9c6.08,0,9.92-1.12,11.69-5.12.79-1.76,1.12-3.37,1.12-12,0-9-.33-10.24-1.12-12.16-1.77-3.84-5.61-5-11.69-5h-8.64V77.9Z" />
                  <path class="cls-2"
							d="M593.1,31h41.45V44.45H607.83V77.26h26.24v13.6H607.83v39.69h26.72V144H593.1Z" />
                  <path class="cls-2"
							d="M646.56,31h25.12c14.25,0,23.53,5.44,28.17,15.53,2.56,5.92,3.36,11.36,3.36,41s-.8,35.05-3.36,41C695.21,138.56,685.93,144,671.68,144H646.56Zm23.84,99.55c8.33,0,13.13-3,15.53-8.48,1.76-3.84,2.24-7.2,2.24-34.41,0-27.53-.48-30.89-2.24-34.73-2.4-5.6-7.2-8.48-15.53-8.48h-9.12v86.1Z" />
                  <path class="cls-2" d="M717.14,31h14.72V144H717.14Z" />
                  <path class="cls-2"
							d="M786.76,121.27H759.39L755.55,144H740.82l21-113h22.57l20.8,113H790.6Zm-2.24-13L773.15,42.85h-.32l-11.2,65.46Z" />
                </g>
              </g>
            </svg> </a>
			</h1>
			<div class="gnb">
				<a href="/movie.jsp">영화</a> <a href="/animation.jsp">애니메이션</a> <a
					href="/notice_main.jsp">리뷰</a>
			</div>
			<div class="click">
				<input type="text" placeholder="콘텐츠 등을 검색해보세요!" />
				<%
				userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");
				if (loggedInUser == null) {
				%>
				<button class="log">
					<a href="./login.jsp">로그인</a>
				</button>
				<button class="join">
					<a href="./terms.html">회원가입</a>
				</button>

				<%
				}
				%>
				<%
				if (loggedInUser != null) {
				%>
				<%
				if (loggedInUser.getUserID().equals("admin")) {
				%>
				<button class="log">
					<a href="./logout.jsp">로그아웃</a>
				</button>
				<button class="log">
					<a href="./admin.jsp">관리자 페이지</a>
				</button>
				<%
				} else {
				%>

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
	<%
	JSONObject jsonAni = Ajax.JsonTObj(Ajax.GETO("http://localhost:9999/ani"));
	JSONObject ani = jsonAni.getJSONArray("anilist").getJSONObject(Integer.parseInt(request.getParameter("id")));
	//Integer.parseInt(request.getParameter("movieid"))
	%>
	<section class="con1">
		<div>
			<img
				src="<%=ani.getJSONArray("backdrops").getJSONObject(0).getString("file_path")%>"
				alt="영화메인이미지" />
		</div>
		<div class="content">
			<strong><%=ani.getString("name")%></strong><br /> <span><%=ani.getString("original_name")%></span><br />
			<span><%=ani.getJSONArray("air_year_quarter").get(0).toString()%>
				· <%
			JSONArray genres = ani.getJSONArray("genres");
			for (int i = 0; i < genres.length() - 1; i += 1) {
				out.print(genres.get(i).toString());
				out.print("/");
			}
			out.print(genres.get(genres.length() - 1));
			%> <%=ani.getString("nation")%></span><br />
			<br />
			<span>에피소드 <%=ani.getInt("number_of_episodes")%> · <%=ani.getString("content_rating")%></span><br />
		</div>
	</section>
	<div class="wrap">
		<section class="con2">
			<div class="dec">
				<ul class="st">
					<li><img src="<%=ani.getString("img_url")%>" alt="애니포스터" /></li>
				</ul>
				<ul class="summary">
					<div class="su">
						<li class="co"><%=ani.getString("overview")%></li>
					</div>
				</ul>
			</div>
		</section>
		<section class="con5">
			<p style="font-size: 2.7rem">갤러리</p>
			<div class="swiper slide1">
				<ul class="swiper-wrapper">
					<%
					JSONArray backdrops = ani.getJSONArray("backdrops");
					for (int i = 0; i < backdrops.length(); i += 1) {
					%>
					<li class="swiper-slide"><img
						src="<%=backdrops.getJSONObject(i).getString("file_path")%>"
						alt="" /></li>
					<%
					}
					%>
				</ul>
				<div class="swiper-button-next next1"></div>
				<div class="swiper-button-prev prev1"></div>
			</div>
		</section>
		<section class="con6">
			<p style="font-size: 2.7rem">연관 시리즈</p>
			<div class="swiper slide2">
				<ul class="swiper-wrapper">
					<%
					JSONArray series = ani.getJSONArray("serieslist");
					for (int i = 0; i < series.length(); i += 1) {
						JSONObject serie = series.getJSONObject(i);
						String urlf = "https://laftel.net/api/v1.0/items/";
						String urlb = "/detail/?laftel=Tejava";
						String lafid = serie.getInt("lafid") + "";
						JSONObject col1 = Ajax.JsonTObj(Ajax.GETO(urlf + lafid + urlb));
						String seimg = col1.getString("img");
					%>
					<li class="swiper-slide"><img src="<%=seimg%>" alt="" />
						<p><%=serie.getString("name")%></p>
						<p>
							<%=serie.getJSONArray("air_year_quarter").get(0).toString()%></p></li>
					<%
					}
					%>
				</ul>
				<div class="swiper-button-next next2"></div>
				<div class="swiper-button-prev prev2"></div>
			</div>

		</section>
		<section class="con7">
			<p style="font-size: 2.7rem">장르별 컬렉션</p>
			<div class="swiper slide3">
				<ul class="swiper-wrapper">
					<li class="swiper-slide">
						<%
						String url1 = "http://localhost:9999/ani?genres=%ED%8C%90%ED%83%80%EC%A7%80&genres=%EC%95%A1%EC%85%98";
						JSONObject col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						JSONArray col2 = col1.getJSONArray("anilist");
						%>
						<div class="gr">
							<%
							for (int i = 0; i < 4; i += 1) {
							%>
							<img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
							<%
							}
							%>
						</div>
						<p>액션/판타지</p> <br />
					</li>
					<li class="swiper-slide">
						<%
						url1 = "http://localhost:9999/ani?genres=%EB%AF%B8%EC%8A%A4%ED%84%B0%EB%A6%AC";
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						%>
						<div class="gr">
							<%
							for (int i = 0; i < 4; i += 1) {
							%>
							<img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
							<%
							}
							%>
						</div>
						<p>추리 미스테리</p> <br />
					</li>
					<li class="swiper-slide">
						<%
						url1 = "http://localhost:9999/ani?genres=%EC%8A%A4%ED%8F%AC%EC%B8%A0";
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						%>
						<div class="gr">
							<%
							for (int i = 0; i < 4; i += 1) {
							%>
							<img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
							<%
							}
							%>
						</div>
						<p>스포츠물</p> <br />
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
						<p>치유물</p> <br />
					</li>
					<li class="swiper-slide">
						<%
						url1 = "http://localhost:9999/ani?genres=%EC%9D%B4%EC%84%B8%EA%B3%84";
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						%>
						<div class="gr">
							<%
							for (int i = 0; i < 4; i += 1) {
							%>
							<img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
							<%
							}
							%>
						</div>
						<p>이세계 여행</p> <br />
					</li>
					<li class="swiper-slide">
						<%
						url1 = "http://localhost:9999/ani?genres=%EB%A1%9C%EB%A7%A8%EC%8A%A4&genres=%ED%8C%90%ED%83%80%EC%A7%80";
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						%>
						<div class="gr">
							<%
							for (int i = 0; i < 4; i += 1) {
							%>
							<img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
							<%
							}
							%>
						</div>
						<p>로맨스 판타지</p> <br />
					</li>
					<li class="swiper-slide">
						<%
						url1 = "http://localhost:9999/ani?genres=%EC%9D%BC%EC%83%81";
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						%>
						<div class="gr">
							<%
							for (int i = 0; i < 4; i += 1) {
							%>
							<img src="<%=col2.getJSONObject(i).getString("img_url")%>" alt="" />
							<%
							}
							%>
						</div>
						<p>일상</p> <br />
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
						<p>SF</p> <br />
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
						<p>아동</p> <br />
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
						<p>개그 로맨스</p> <br />
					</li>
				</ul>
				<div class="swiper-button-next next3"></div>
				<div class="swiper-button-prev prev3"></div>
			</div>
		</section>
		<section class="con8">
			<p style="font-size: 2.7rem">비슷한 작품</p>
			<div class="same">
				<ul>
					<%
					JSONArray tags = ani.getJSONArray("main_tags");
					Map<Integer, String> map = new LinkedHashMap<Integer, String>();
					map.put(ani.getInt("id"), ani.getString("img_url"));
					int count = 0;
					if (tags.length() >= 2) {
						List<Ajax.Pair> nuli = Ajax.getRandomNumbers(tags.length(), 6);
						for (Ajax.Pair pair : nuli) {
							int num1 = pair.first;
							int num2 = pair.second;
							System.out.println("[" + num1 + "," + num2 + "]");
							url1 = "http://localhost:9999/ani?main_tags=" + URLEncoder.encode(tags.get(num1).toString(), "UTF-8")
							+ "&main_tags=" + URLEncoder.encode(tags.get(num2).toString(), "UTF-8");
							col1 = Ajax.JsonTObj(Ajax.GETO(url1));
							col2 = col1.getJSONArray("anilist");
							for (int i = 0; i < col2.length(); i += 1) {
						if (!map.containsKey(col2.getJSONObject(i).getInt("id"))) {
							map.put(col2.getJSONObject(i).getInt("id"), col2.getJSONObject(i).getString("img_url"));
							count += 1;
						}
							}
						}
					} else if (tags.length() == 1) {
						url1 = "http://localhost:9999/ani?main_tags=" + URLEncoder.encode(tags.get(0).toString(), "UTF-8");
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						for (int i = 0; i < col2.length(); i += 1) {
							if (!map.containsKey(col2.getJSONObject(i).getInt("id"))) {
						map.put(col2.getJSONObject(i).getInt("id"), col2.getJSONObject(i).getString("img_url"));
						count += 1;
							}
						}
					}
					for (int i = 0; i < ani.getJSONArray("genres").length(); i += 1) {
						url1 = "http://localhost:9999/ani?genres="
						+ URLEncoder.encode(ani.getJSONArray("genres").get(i).toString(), "UTF-8");
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						for (int j = 0; j < col2.length(); j += 1) {
							if (!map.containsKey(col2.getJSONObject(j).getInt("id"))) {
						map.put(col2.getJSONObject(j).getInt("id"), col2.getJSONObject(j).getString("img_url"));
						count += 1;
							}
						}
						if (count >= 8)
							break;
					}
					while (count < 7) {
						String num = new Random().nextInt(0, 96) + "";
						url1 = "http://localhost:9999/ani?id=" + num;
						col1 = Ajax.JsonTObj(Ajax.GETO(url1));
						col2 = col1.getJSONArray("anilist");
						if (!map.containsKey(col2.getJSONObject(0).getInt("id"))) {
							map.put(col2.getJSONObject(0).getInt("id"), col2.getJSONObject(0).getString("img_url"));
							count += 1;
						}
					}
					List<Integer> keyList = new ArrayList<>(map.keySet());
					%>
					<%
					for (int i = 1; i < 7; i += 1) {
						JSONObject ani1 = jsonAni.getJSONArray("anilist").getJSONObject(keyList.get(i));
					%>
					<li><a
						href="<%="/anidetail.jsp?id="
		+ Integer.toString(jsonAni.getJSONArray("anilist").getJSONObject(keyList.get(i)).getInt("id"))%>">
							<img src="<%=map.get(keyList.get(i))%>" alt="" />
					</a>
						<p>
							<strong><%=ani1.getString("name")%></strong> <br />
							<span> <%
 genres = ani1.getJSONArray("genres");
 for (int j = 0; j < genres.length() - 1; j += 1) {
 	out.print(genres.get(j).toString());
 	out.print("/");
 }
 out.print(genres.get(genres.length() - 1));
 %>
							</span>
						</p></li>

					<%
					}
					%>
				</ul>
			</div>
		</section>
	</div>
	<section class="con9">
		<div></div>
	</section>
	<footer class="down_main">
		<div class="left">
			<div class="tag">
				<a class="first" href="#">서비스 이용약관</a> <a class="second" href="#">개인정보
					처리방침</a> <a href="#">회사 안내</a>
			</div>
			<div class="mail">
				<span>고객센터 | 이메일,전화번호</span><br /> <span>광고문의 | 이메일, 최신광고
					소개서</span><br /> <span>제휴 및 대외 협력 | 홈페이지 주소</span>
			</div>
			<div class="name">
				<span>회사이름 | 대표이름 | 주소</span><br /> <span>사업자 등록 번호</span>
			</div>
		</div>
		<div class="right">
			<button>한국어</button>
			<div>
				<a href="#"><svg
						xmlns="http://www.w3.org/2000/svg" height="20" width="16"
						viewBox="0 0 512 512">
              <path fill="#fff"
							,
                d="M512 256C512 114.6 397.4 0 256 0S0 114.6 0 256C0 376 82.7 476.8 194.2 504.5V334.2H141.4V256h52.8V222.3c0-87.1 39.4-127.5 125-127.5c16.2 0 44.2 3.2 55.7 6.4V172c-6-.6-16.5-1-29.6-1c-42 0-58.2 15.9-58.2 57.2V256h83.6l-14.4 78.2H287V510.1C413.8 494.8 512 386.9 512 256h0z" /></svg></a>
				<a href="#"><svg
						xmlns="http://www.w3.org/2000/svg" height="20" width="20"
						viewBox="0 0 512 512">
              <path fill="#fff"
							,
                d="M459.4 151.7c.3 4.5 .3 9.1 .3 13.6 0 138.7-105.6 298.6-298.6 298.6-59.5 0-114.7-17.2-161.1-47.1 8.4 1 16.6 1.3 25.3 1.3 49.1 0 94.2-16.6 130.3-44.8-46.1-1-84.8-31.2-98.1-72.8 6.5 1 13 1.6 19.8 1.6 9.4 0 18.8-1.3 27.6-3.6-48.1-9.7-84.1-52-84.1-103v-1.3c14 7.8 30.2 12.7 47.4 13.3-28.3-18.8-46.8-51-46.8-87.4 0-19.5 5.2-37.4 14.3-53 51.7 63.7 129.3 105.3 216.4 109.8-1.6-7.8-2.6-15.9-2.6-24 0-57.8 46.8-104.9 104.9-104.9 30.2 0 57.5 12.7 76.7 33.1 23.7-4.5 46.5-13.3 66.6-25.3-7.8 24.4-24.4 44.8-46.1 57.8 21.1-2.3 41.6-8.1 60.4-16.2-14.3 20.8-32.2 39.3-52.6 54.3z" /></svg></a>
				<a href="#"><svg
						xmlns="http://www.w3.org/2000/svg" height="20" width="20"
						viewBox="0 0 320 512">
              <path fill="#fff"
							,
                d="M64 32C28.7 32 0 60.7 0 96V256 416c0 35.3 28.7 64 64 64H192c70.7 0 128-57.3 128-128c0-46.5-24.8-87.3-62-109.7c18.7-22.3 30-51 30-82.3c0-70.7-57.3-128-128-128H64zm96 192H64V96h96c35.3 0 64 28.7 64 64s-28.7 64-64 64zM64 288h96 32c35.3 0 64 28.7 64 64s-28.7 64-64 64H64V288z" /></svg></a>
			</div>
		</div>
	</footer>
</body>
</html>
