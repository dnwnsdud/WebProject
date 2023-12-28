<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
</head>
<body>
	<video controls></video>
	<script>
		let vd = document.querySelector("video");
		if(Hls.isSupported()){
			let hls = new Hls();
			hls.loadSource("/resource/m3u8/output.m3u8");
			hls.attachMedia(vd);
			console.log("성공");
		}
		else if(vd.canPlayType('application/vnd.apple.mpegurl')){
			vd.src = "/resource/m3u8/output.m3u8";
			console.log("실패");
		}
	</script>
</body>
</html>