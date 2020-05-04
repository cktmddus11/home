package spittr.data;

import java.util.List;

import spittr.Spittle;

public interface SpittleRepository {
	List<Spittle> findSpittles(long max, int count);
	// max : 리턴되어야하는 Spittle의 최대 Id값
	// count : Spittle 최대 객체 총 개수
	Spittle findOne(long spittleId);
	
}
