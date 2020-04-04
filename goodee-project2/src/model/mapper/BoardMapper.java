package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Comment;

public interface BoardMapper {
	@Select("select ifnull(max(num), 0) from board")
	int maxnum();

	// 리스트 출력, num으로 행 조회, 검색 내용 출력
	@Select({ "<script>"
			+ " select num,mem_id, (select mem_nickname from member where board.mem_id = member.mem_id) nickname,"
			+ " title, content, file, regdate, readcnt from board"
			+" where 1=1"
			+ "<if test='col1 != null'> "
			+ "and ${col1} like '%${find}%'"
			+ "</if> "
			+ "<if test='col2 != null'> "
			+ "OR ${col2} like '%${find}%'"
			+ "</if>"
			+"<if test='mem_id != null'>"
			+"and mem_id = #{mem_id}"
			+"</if>"
			+"<choose>"
			+ "<when test ='num !=null'> "
			+ "and num = #{num} "
			+ "</when>" 
			+"<otherwise>" 
			+"order by regdate desc limit #{start},#{limit}" 
			+"</otherwise>"
			+ "</choose>"
			+ "</script>" })

	List<Board> select(Map<String, Object> map);

	@Select({ "<script>" + 
	"select count(*) from board" + 
			" where 1=1 "+
			"<if test='col1 != null'> and ${col1} like '%${find}%'</if>"
			+ "<if test='col2 != null'> OR ${col2} like '%${find}%'</if>" 
			+"<if test='mem_id != null'>"
			+" and mem_id = #{mem_id} </if>"
			+ "</script>" })
	int boardCount(Map<String, Object> map);

	@Insert("insert into board " + "(num, mem_id, title, content, file, regdate, readcnt) "
			+ "values(#{num}, #{mem_id}, #{title}, #{content}, #{file}, now(), 0)")
	int insert(Board board);

	@Update("update board set readcnt = readcnt + 1 where num = #{num}")
	void readcntadd(@Param("num") int num);

	@Update("update board set title=#{title}, content=#{content}, file = #{file} where num = #{num}")
	boolean update(Board b);

	@Delete("delete from board where num = #{num}")
	int delete(int num);
	@Delete("delete from comment where num = #{num}")
	void delete2(int num);
	@Delete("delete from up where num = #{num}")
	void delete3(int num);
	
	@Insert("insert into up values (#{num}, #{mem_id})")
	int insert2(Map<String, Object> map);

	
	@Select("select count(*) up from up where num = #{num}")
	int upselect(int num);

	
	@Select("select ifnull(max(comment_num),0) from comment")
	int selectmax();
	
	@Select("insert into comment values(#{num}, #{comment_id}, #{content}, #{comment_num}, now())")
	void insertcomment(Comment c);

	@Select("select *, (select mem_nickname from member m where m.mem_id = comment.comment_id) nickname "
			+ "from comment where num = #{num} order by comment_date desc")
	List<Comment> commentselect(int num);

	@Select("select count(*) from board where num = #{num} and mem_id=#{mem_id}")
	int selectinfo(Map<String, Object> map);
	
	@Delete("delete from comment where comment_num = #{comment_num}")
	int commentdelete(int comment_num);

}
