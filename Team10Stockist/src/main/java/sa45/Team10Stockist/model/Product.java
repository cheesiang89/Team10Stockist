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
	private int partNumber;

	private String color;

	private String description;

	private String dimension;

	private String manufacturer;

	@Column(name="minimum_inventory_quantity")
	private int minimumInventoryQuantity;

	@Column(name="minimum_reorder_quantity")
	private int minimumReorderQuantity;

	private String name;

	@Column(name="shelf_location")
	private String shelfLocation;

	@Column(name="stock_quantity")
	private int stockQuantity;

	@Column(name="unit_price")
	private double unitPrice;

	//bi-directional many-to-one association to TransactionDetail
	@OneToMany(mappedBy="product",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private List<TransactionDetail> transactionDetails;

	public Product() {
	}

	public int getPartNumber() {
		return this.partNumber;
	}

	public void setPartNumber(int partNumber) {
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

	public int getMinimumInventoryQuantity() {
		return this.minimumInventoryQuantity;
	}

	public void setMinimumInventoryQuantity(int minimumInventoryQuantity) {
		this.minimumInventoryQuantity = minimumInventoryQuantity;
	}

	public int getMinimumReorderQuantity() {
		return this.minimumReorderQuantity;
	}

	public void setMinimumReorderQuantity(int minimumReorderQuantity) {
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

	public int getStockQuantity() {
		return this.stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public double getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
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