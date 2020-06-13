package action.member.dto.response;

import java.util.List;

import action.common.dto.response.CommonResponseDTO;
import model.GradeInfo;

public class SubjectResponseDTO extends CommonResponseDTO{
	List<GradeInfo> gradeInfo;
	String semester3;
	
	
	public List<GradeInfo> getGradeInfo() {
		return gradeInfo;
	}
	public void setGradeInfo(List<GradeInfo> gradeInfo) {
		this.gradeInfo = gradeInfo;
	}
	public String getSemsete3r() {
		return semester3;
	}
	public void setSemseter3(String semseter3) {
		this.semester3 = semseter3;
	}
	
	
	
	
}
