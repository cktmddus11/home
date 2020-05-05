package spittr;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class Spitter {
	@NotNull // message 속성은 사용자에게 친숙한 에러 메시지를 보여줄 수 있도록
	@Size(min=2, max=30, message="{firstName.size}")
	private String firstName;
	@NotNull
	@Size(min=2, max=30, message="{lastName.size}")
	private String lastName;
	@NotNull
	@Size(min=5, max=16, message="{username.size}")
	private String username;
	@NotNull
	@Size(min=5, max=25, message="{password.size}")
	private String password;
	
	@NotNull
	@Email(message="{email.valid}")
	private String email;
	
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
