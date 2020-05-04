package spittr.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import spittr.Spittle;
@Repository
public class SpittleRepositoryImpl implements SpittleRepository {
	@Override
	public
	List<Spittle> findSpittles(long max, int count) {
		List<Spittle> list = createSpittleList(50);
		return list;
	}

	@Override
	public Spittle findOne(long spittleId) {
		Spittle expectedSpittle = new Spittle("Hello", new Date());
		return expectedSpittle;
	}

	private List<Spittle> createSpittleList(int count) {
		List<Spittle> spittles = new ArrayList<Spittle>();
		for(int i = 0;i<count;i++) {
			spittles.add(new Spittle("spittle " + i, new Date(), 0d,0d));
		}
		return spittles;
	}

}
