package boot.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "film")
public class Film implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length = 50)
	private String name;
	@Column(length = 50)
	private String gender;
	@Column(length = 100)
	private String description;
	@Temporal(TemporalType.DATE)
	private Date date;
	private boolean existence;
	
	public Film(String name, String gender, String description, Date date, boolean existence) {
		super();
		this.name = name;
		this.gender = gender;
		this.description = description;
		this.date = date;
		this.existence = existence;
	}

	public Film() {
		this("","","",new Date(),true);
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isExistence() {
		return existence;
	}

	public void setExistence(boolean existence) {
		this.existence = existence;
	}

	@Override
	public String toString() {
		return "Film [id=" + id + ", name=" + name + ", gender=" + gender + ", description=" + description + ", date="
				+ date + ", existence=" + existence + "]";
	}
}
