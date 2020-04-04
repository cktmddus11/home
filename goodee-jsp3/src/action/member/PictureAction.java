package action.member;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

public class PictureAction implements Action {
// 1. ���� ���ε� - java ����
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") + "model2/member/picture";
		//System.out.println(path);
		String fname = null; // application ��ü : getServletContext
		try {
			File f = new File(path);
			if (!f.exists()) { // ��ο� ������ �������� ������
				f.mkdirs(); // picture���� ����
			}
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			fname = multi.getFilesystemName("picture"); // pictureForm name �Ӽ� picture �Ķ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}
