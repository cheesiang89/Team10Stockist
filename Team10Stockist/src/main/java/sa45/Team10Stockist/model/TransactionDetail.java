package sa45.Team10Stockist.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the transaction_details database table.
 * 
 */
@Entity
@Table(name="transaction_details")
@NamedQuery(name="TransactionDetail.findAll", query="SELECT t FROM TransactionDetail t")
public class TransactionDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private TransactionDetailPK id;

	private int quantity;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="part_number")
	private Product product;

	//bi-directional many-to-one association to Transaction
	@ManyToOne
	@JoinColumn(name="trans_id", insertable=false, updatable=false)
	private Transaction transaction;

	public TransactionDetail() {
	}

	public TransactionDetailPK getId() {
		return this.id;
	}

	public void setId(TransactionDetailPK id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Transaction getTransaction() {
		return this.transaction;
	}

	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}

}