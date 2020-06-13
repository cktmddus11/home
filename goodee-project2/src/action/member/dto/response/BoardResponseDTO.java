package action.member.dto.response;

import java.util.List;

import action.common.dto.response.CommonResponseDTO;
import model.Board;

public class BoardResponseDTO  extends CommonResponseDTO{
	List<Board> list3;

	public List<Board> getList3() {
		return list3;
	}

	public void setList3(List<Board> list3) {
		this.list3 = list3;
	}

}
