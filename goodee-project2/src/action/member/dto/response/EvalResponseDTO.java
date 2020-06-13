package action.member.dto.response;

import java.util.List;

import action.common.dto.response.CommonResponseDTO;
import model.Subject_info2;

public class EvalResponseDTO extends CommonResponseDTO {
	List<Subject_info2> list2;

	public List<Subject_info2> getList2() {
		return list2;
	}

	public void setList2(List<Subject_info2> list2) {
		this.list2 = list2;
	}
	
}
