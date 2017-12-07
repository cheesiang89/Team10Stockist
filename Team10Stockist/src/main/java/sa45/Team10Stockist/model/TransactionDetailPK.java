package sa45.Team10Stockist.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the transaction_details database table.
 * 
 */
@Embeddable
public class TransactionDetailPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="trans_detail_id")
	private int transDetailId;

	@Column(name="part_number", insertable=false, updatable=false)
	private int partNumber;

	public TransactionDetailPK() {
	}
	public int getTransDetailId() {
		return this.transDetailId;
	}
	public void setTransDetailId(int transDetailId) {
		this.transDetailId = transDetailId;
	}
	public int getPartNumber() {
		return this.partNumber;
	}
	public void setPartNumber(int partNumber) {
		this.partNumber = partNumber;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof TransactionDetailPK)) {
			return false;
		}
		TransactionDetailPK castOther = (TransactionDetailPK)other;
		return 
			(this.transDetailId == castOther.transDetailId)
			&& (this.partNumber == castOther.partNumber);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.transDetailId;
		hash = hash * prime + this.partNumber;
		
		return hash;
	}
}