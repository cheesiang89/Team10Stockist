package sa45.Team10Stockist.javabeans;

//Bean for generating the reorder report

public class ProductNSupplierBean {
	//Product Properties
	private Integer partNumber;
	private Double unitPrice;
	private Integer stockQuantity;
	private Integer minimumInventoryQuantity;
	private Integer minimumReorderQuantity;
	//Supplier Properties
	private Integer supplierId;
	private String supplierName;
	//Composite Properties
	private Integer OrderQty;
	private Double price;
	public ProductNSupplierBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductNSupplierBean(Integer partNumber, Double unitPrice, Integer stockQuantity,
			Integer minimumInventoryQuantity, Integer minimumReorderQuantity, Integer supplierId, String supplierName,
			Integer orderQty, Double price) {
		super();
		this.partNumber = partNumber;
		this.unitPrice = unitPrice;
		this.stockQuantity = stockQuantity;
		this.minimumInventoryQuantity = minimumInventoryQuantity;
		this.minimumReorderQuantity = minimumReorderQuantity;
		this.supplierId = supplierId;
		this.supplierName = supplierName;
		OrderQty = orderQty;
		this.price = price;
	}
	public Integer getPartNumber() {
		return partNumber;
	}
	public void setPartNumber(Integer partNumber) {
		this.partNumber = partNumber;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Integer getStockQuantity() {
		return stockQuantity;
	}
	public void setStockQuantity(Integer stockQuantity) {
		this.stockQuantity = stockQuantity;
	}
	public Integer getMinimumInventoryQuantity() {
		return minimumInventoryQuantity;
	}
	public void setMinimumInventoryQuantity(Integer minimumInventoryQuantity) {
		this.minimumInventoryQuantity = minimumInventoryQuantity;
	}
	public Integer getMinimumReorderQuantity() {
		return minimumReorderQuantity;
	}
	public void setMinimumReorderQuantity(Integer minimumReorderQuantity) {
		this.minimumReorderQuantity = minimumReorderQuantity;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public Integer getOrderQty() {
		return OrderQty;
	}
	public void setOrderQty(Integer orderQty) {
		OrderQty = orderQty;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ProductNSupplierBean [partNumber=" + partNumber + ", unitPrice=" + unitPrice + ", stockQuantity="
				+ stockQuantity + ", minimumInventoryQuantity=" + minimumInventoryQuantity + ", minimumReorderQuantity="
				+ minimumReorderQuantity + ", supplierId=" + supplierId + ", supplierName=" + supplierName
				+ ", OrderQty=" + OrderQty + ", price=" + price + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((partNumber == null) ? 0 : partNumber.hashCode());
		result = prime * result + ((supplierId == null) ? 0 : supplierId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductNSupplierBean other = (ProductNSupplierBean) obj;
		if (partNumber == null) {
			if (other.partNumber != null)
				return false;
		} else if (!partNumber.equals(other.partNumber))
			return false;
		if (supplierId == null) {
			if (other.supplierId != null)
				return false;
		} else if (!supplierId.equals(other.supplierId))
			return false;
		return true;
	}
	
}
