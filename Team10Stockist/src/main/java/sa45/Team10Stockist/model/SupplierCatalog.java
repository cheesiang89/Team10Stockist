package sa45.Team10Stockist.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the supplier_catalog database table.
 * 
 */
@Entity
@Table(name="supplier_catalog")
@NamedQuery(name="SupplierCatalog.findAll", query="SELECT s FROM SupplierCatalog s")
public class SupplierCatalog implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private SupplierCatalogPK id;

	public SupplierCatalog() {
	}

	public SupplierCatalogPK getId() {
		return this.id;
	}

	public void setId(SupplierCatalogPK id) {
		this.id = id;
	}

}