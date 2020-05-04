package spittr;

public class Spitter {

	private String firstName;
	private String lastName;
	private String username;
	private String password;
	private Long id;

	public Spitter() {
		super();
	}

	public Spitter(Long id, String username, String password, String firstName, String lastName) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;

	}

	public Spitter(String username, String password, String firstName, String lastName) {
		this(null, username, password, firstName, lastName);
	}

	@Override
	public String toString() {
		return "Spitter [firstName=" + firstName + ", lastName=" + lastName + ", username=" + username + ", password="
				+ password + ", id=" + id + "]";
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
