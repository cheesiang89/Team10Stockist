package sa45.Team10Stockist.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the product database table.
 * 
 */
@Entity
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="part_number")
	private Integer partNumber;

	private String color;

	private String description;

	private String dimension;

	private String manufacturer;

	@Column(name="minimum_inventory_quantity")
	private Integer minimumInventoryQuantity;

	@Column(name="minimum_reorder_quantity")
	private Integer minimumReorderQuantity;

	private String name;

	@Column(name="shelf_location")
	private String shelfLocation;

	@Column(name="stock_quantity")
	private Integer stockQuantity;

	@Column(name="unit_price")
	private Double unitPrice;

	//bi-directional many-to-many association to Supplier
	@ManyToMany(mappedBy="products")
	private List<Supplier> suppliers;

	//bi-directional many-to-one association to TransactionDetail
	@OneToMany(mappedBy="product",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private List<TransactionDetail> transactionDetails;

	public Product() {
	}

	public Integer getPartNumber() {
		return this.partNumber;
	}

	public void setPartNumber(Integer partNumber) {
		this.partNumber = partNumber;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDimension() {
		return this.dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}

	public String getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Integer getMinimumInventoryQuantity() {
		return this.minimumInventoryQuantity;
	}

	public void setMinimumInventoryQuantity(Integer minimumInventoryQuantity) {
		this.minimumInventoryQuantity = minimumInventoryQuantity;
	}

	public Integer getMinimumReorderQuantity() {
		return this.minimumReorderQuantity;
	}

	public void setMinimumReorderQuantity(Integer minimumReorderQuantity) {
		this.minimumReorderQuantity = minimumReorderQuantity;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShelfLocation() {
		return this.shelfLocation;
	}

	public void setShelfLocation(String shelfLocation) {
		this.shelfLocation = shelfLocation;
	}

	public Integer getStockQuantity() {
		return this.stockQuantity;
	}

	public void setStockQuantity(Integer stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public Double getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public List<Supplier> getSuppliers() {
		return this.suppliers;
	}

	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}

	public List<TransactionDetail> getTransactionDetails() {
		return this.transactionDetails;
	}

	public void setTransactionDetails(List<TransactionDetail> transactionDetails) {
		this.transactionDetails = transactionDetails;
	}

	public TransactionDetail addTransactionDetail(TransactionDetail transactionDetail) {
		getTransactionDetails().add(transactionDetail);
		transactionDetail.setProduct(this);

		return transactionDetail;
	}

	public TransactionDetail removeTransactionDetail(TransactionDetail transactionDetail) {
		getTransactionDetails().remove(transactionDetail);
		transactionDetail.setProduct(null);

		return transactionDetail;
	}

}