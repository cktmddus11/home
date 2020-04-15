package concert;

public class  CriticAspect implements CirticismEngine{
	public CriticAspect() {	}
	
	public String getCriticism() {
		int i = (int) (Math.random() * criticismPool.length);
		return criticismPool[i];
	}
	
	private String[] criticismPool;
	
	public void setCriticisPool(String [] criticismPool) {
		this.criticismPool = criticismPool;
	}
}
