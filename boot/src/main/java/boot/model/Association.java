package boot.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="association")
public class Association implements Serializable {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="term_id")
	private int termId;
	@Column(name="gene_product_id")
	private int geneProductId;
	@Column(name="is_not")
	private int isNot;
	@Column(name="role_group")
	private int roleGroup;
	@Column(name="assocdate")
	private int assocdate;
	@Column(name="source_db_id")
	private int sourceDbId;
	public Association(int termId, int geneProductId, int isNot, int roleGroup, int assocdate, int sourceDbId) {
		super();
		this.termId = termId;
		this.geneProductId = geneProductId;
		this.isNot = isNot;
		this.roleGroup = roleGroup;
		this.assocdate = assocdate;
		this.sourceDbId = sourceDbId;
	}
	public Association() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTermId() {
		return termId;
	}
	public void setTermId(int termId) {
		this.termId = termId;
	}
	public int getGeneProductId() {
		return geneProductId;
	}
	public void setGeneProductId(int geneProductId) {
		this.geneProductId = geneProductId;
	}
	public int getIsNot() {
		return isNot;
	}
	public void setIsNot(int isNot) {
		this.isNot = isNot;
	}
	public int getRoleGroup() {
		return roleGroup;
	}
	public void setRoleGroup(int roleGroup) {
		this.roleGroup = roleGroup;
	}
	public int getAssocdate() {
		return assocdate;
	}
	public void setAssocdate(int assocdate) {
		this.assocdate = assocdate;
	}
	public int getSourceDbId() {
		return sourceDbId;
	}
	public void setSourceDbId(int sourceDbId) {
		this.sourceDbId = sourceDbId;
	}
	@Override
	public String toString() {
		return "association [id=" + id + ", termId=" + termId + ", geneProductId=" + geneProductId + ", isNot=" + isNot
				+ ", roleGroup=" + roleGroup + ", assocdate=" + assocdate + ", sourceDbId=" + sourceDbId + "]";
	}
	
}
