package sa45.Team10Stockist.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the supplier_catalog database table.
 * 
 */
@Embeddable
public class SupplierCatalogPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="supplier_id")
	private int supplierId;

	@Column(name="part_number")
	private int partNumber;

	public SupplierCatalogPK() {
	}
	public int getSupplierId() {
		return this.supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
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
		if (!(other instanceof SupplierCatalogPK)) {
			return false;
		}
		SupplierCatalogPK castOther = (SupplierCatalogPK)other;
		return 
			(this.supplierId == castOther.supplierId)
			&& (this.partNumber == castOther.partNumber);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.supplierId;
		hash = hash * prime + this.partNumber;
		
		return hash;
	}
}