package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {
	// 현재 등록된 게시물 번호 중 최대값을 리턴
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<BoardMapper> cls = BoardMapper.class;

	// 최대 게시물 번호
	public int maxnum() {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(cls).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int boardCount(String column, String find, String mem_id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			if (column != null) {
				String col[] = column.split(",");
				map.put("col1", col[0]);
				if (col.length == 2) {
					map.put("col2", col[1]);
				}
				map.put("find", find);
			}
			if(mem_id != "") {
				map.put("mem_id", mem_id);
			}else {
				map.put("mem_id", null);
			}
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Board> list(int pageNum, int limit, String column, String find, String mem_id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum - 1) * limit);
			map.put("limit", limit);
			
			if (column != null) {
				String[] col = column.split(",");
				map.put("col1", col[0]);
				if (col.length == 2) {
					map.put("col2", col[1]);
				}
				map.put("find", find);
			}
			if(mem_id != "") {
				map.put("mem_id", mem_id);
			}else {
				map.put("mem_id", null);
			}
			
			System.out.println(map);
			
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean insert(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(cls).insert(board);
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public Board selectOne(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	// 조회수 증가
	public void readcntadd(int num) {
		SqlSession session = DBConnection.getConnection();

		try {
			session.getMapper(cls).readcntadd(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}

	}
	public boolean update(Board b) {
		SqlSession session = DBConnection.getConnection();
	
		try {
			return session.getMapper(cls).update(b);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean delete(int num) {
		SqlSession session = DBConnection.getConnection();

		try {
			session.getMapper(cls).delete3(num);
			session.getMapper(cls).delete2(num);
			int result = session.getMapper(cls).delete(num);
			
			
			if(result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;

	}

	public boolean insert2(int num, String mem_id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("mem_id", mem_id);
			int result = session.getMapper(cls).insert2(map);
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public int upselect(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			
			int result = session.getMapper(cls).upselect(num);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int selectmax() {
		SqlSession session = DBConnection.getConnection();
		try {
			
			int result = session.getMapper(cls).selectmax();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public boolean insertcomment(Comment c) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(cls).insertcomment(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public List<Comment> commentselect(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			
			return session.getMapper(cls).commentselect(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean selectinfo(int num, String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("mem_id", login);
			int result = session.getMapper(cls).selectinfo(map);
			if (result > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public boolean commentdelete(int comment_num) {
		SqlSession session = DBConnection.getConnection();
		try {
			int result = session.getMapper(cls).commentdelete(comment_num);
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	
	
	
}
