package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

@Mapper
public interface BoardDAO {

	// MySql vs Oracle
	
	@Select("select * from boardlist where title like '%${title}%'")
	public List<Board> getBoardByTitle(@Param("title") String title);
	
	@Select("select * from boarduser where name = #{id} and password = #{pw}")
	public BoardUser getBoardUserCheck(@Param("id") String id, @Param("pw") String pw);
	@Delete("delete from boardlist where id = #{id}")
	public void deleteBoard(@Param("id") int id);
	@Insert("insert into boardlist values(seqbd.nextval, #{title}, #{id})")
	public void insertBoard(@Param("title") String title, @Param("id") int author_id);
	
	@Insert("insert into boarduser values(seqbu.nextval, #{id}, #{pw})")
	public void insertBoardUser(@Param("id") String id, @Param("pw") String pw);
	@Select("select * from boarduser")
	public List<BoardUser> getBoardUserAll();
	@Select("select * from boarduser where id = #{id}")
	public BoardUser getBoardUserById(@Param("id") int id);
	@Select("select * from boarduser where name = #{name}")
	public BoardUser getBoardUserByName(@Param("name") String name);
	@Results( id = "Board",value = {
		@Result(property="id", column="id"),
		@Result(property="title", column="title"),
		@Result(property="user", column="author_id", one=@One(select="getBoardUserById"))
	})
	@Select("select * from boardlist order by id desc")
	public List<Board> getBoardAll();

	@Select("select x.id, x.title, x.author_id from (select ROWNUM as num, result.* from (select * from boardlist order by id desc) result) x where num <= #{limit}")
	public List<Board> getBoardLimit(@Param("limit") int limit);
	
	@Select("select x.id, x.title, x.author_id from (select ROWNUM as num, result.* from (select * from boardlist order by id desc) result) x where num between #{limit} * #{page} + 1 and #{limit} * (#{page} + 1)")
	public List<Board> getBoardPage(@Param("limit") int limit, @Param("page")  int page);
}



















