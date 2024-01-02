
package com.jsp.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.annotations.*;
import com.jsp.dto.*;

public interface UserDAO {

	@Select("select * from USER2")
	public List<User> getuserAll();

	@Insert("insert into USER2 values(seqnext.nextval, #{id}, #{pw},#{name},#{nickname},#{email},#{resist})")
	public void insertUser(@Param("id") String id, @Param("pw") String pw, @Param("name") String name,@Param("nickname")String nickName,@Param("email")String email,@Param("resist")String resist);

	@Select("SELECT userPassword FROM USER2 WHERE userID = #{id} and userPassword = #{pwd}")
	public String getPwd(@Param("id") String id, @Param("pwd") String pwd);
	
	
//	https://green333.tistory.com/28
}
