package com.jsp.system;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.*;

public class Ajax {
	
	public static JSONObject readFile(String filename) {
		String url = "resources/"+filename;
		String a = Ajax.GET(url);
		JSONObject jsonMovie = Ajax.JsonTObj(a);
		return jsonMovie;
	}
	
	public static JSONObject JsonTObj(String json) {
		return new JSONObject(json);
	}
	
	public static String GET(String url) {
		url = "http://localhost:4885/"+url;
		System.out.println(url);
		String result="";
		try{
//			String fullurl = URLEncoder.encode(url, "UTF-8");
//			fullurl = fullurl.replaceAll("%3A", ":").replaceAll("%2F", "/").replaceAll("%3F", "?").replaceAll("%3D", "=").replaceAll("%26", "&");
//			System.out.println(fullurl);
//			URL to = new URL(fullurl);
			URL to = new URL(url);
			HttpURLConnection con = (HttpURLConnection)to.openConnection();
			con.setRequestMethod("GET");
			try(BufferedReader file = 
				new BufferedReader(new InputStreamReader(con.getInputStream()));) {
				String line;
				while((line = file.readLine()) !=null) {
					result +=line;
				}
			}catch(Exception e) {}
		}catch(Exception e) {}
			return result.toString();
	}
	public static String GETO(String url) {
		String result="";
		try{
//			String fullurl = URLEncoder.encode(url, "UTF-8");
//			fullurl = fullurl.replaceAll("%3A", ":").replaceAll("%2F", "/").replaceAll("%3F", "?").replaceAll("%3D", "=").replaceAll("%26", "&");
//			System.out.println(fullurl);
//			URL to = new URL(fullurl);
			URL to = new URL(url);
			HttpURLConnection con = (HttpURLConnection)to.openConnection();
			con.setRequestMethod("GET");
			try(BufferedReader file = 
				new BufferedReader(new InputStreamReader(con.getInputStream()));) {
				String line;
				while((line = file.readLine()) !=null) {
					result +=line;
				}
			}catch(Exception e) {}
		}catch(Exception e) {}
			return result.toString();
	}

}   