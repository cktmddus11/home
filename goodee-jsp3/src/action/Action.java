package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 
 * ����� ������ ��û�� ����  �ٷ� jsp �������� ���� ���� �ƴ� 
 * Action �̶�� �ϴ� �ڹ������� �����ϰ� �� 
 * - ��� ����Ͻ� ����(�α���, �����Ͱ�������, ����ó��, ��ȿ���˻� ���)
 * �� �����ϰ� ��(jsp)���� �ʿ��� �����͸� jsp�������� �Ѱ���
 * 
 * ����� ��û�� ��Ʈ�ѷ������� �ش� Action �� ���ν�Ű�� ���� 
 * �ش� ���� ������ ����ִ� properties����(������ �ؽ�Ʈ����)�� �а�
 * �ش� Ŭ������ ����� �� �ְԲ� ���ص� �ش� Ŭ������ ������.
 * */
public interface Action {
	// �߻� �޼��� ����
	// �߻�޼��� ���� �ڷ��� ActionForward 
	ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
