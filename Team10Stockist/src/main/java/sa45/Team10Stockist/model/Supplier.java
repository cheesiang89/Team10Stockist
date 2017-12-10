package sa45.Team10Stockist.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the supplier database table.
 * 
 */
@Entity
@NamedQuery(name="Supplier.findAll", query="SELECT s FROM Supplier s")
public class Supplier implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="supplier_id")
	private int supplierId;

	@Column(name="contact_number")
	private int contactNumber;

	@Column(name="supplier_name")
	private String supplierName;

	//bi-directional many-to-many association to Product
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
		name="supplier_catalog"
		, joinColumns={
			@JoinColumn(name="supplier_id")
			}
		, inverseJoinColumns={
			@JoinColumn(name="part_number")
			}
		)
	private List<Product> products;

	public Supplier() {
	}

	public int getSupplierId() {
		return this.supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getContactNumber() {
		return this.contactNumber;
	}

	public void setContactNumber(int contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getSupplierName() {
		return this.supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}