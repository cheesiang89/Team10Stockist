package team10.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the transaction database table.
 * 
 */
@Entity
@NamedQuery(name="Transaction.findAll", query="SELECT t FROM Transaction t")
public class Transaction implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="trans_id")
	private int transId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="custoemr_id")
	private Customer customer;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	//bi-directional many-to-one association to TransactionDetail
	@OneToMany(mappedBy="transaction")
	private List<TransactionDetail> transactionDetails;

	public Transaction() {
	}

	public int getTransId() {
		return this.transId;
	}

	public void setTransId(int transId) {
		this.transId = transId;
	}

	public Date getDatetime() {
		return this.datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<TransactionDetail> getTransactionDetails() {
		return this.transactionDetails;
	}

	public void setTransactionDetails(List<TransactionDetail> transactionDetails) {
		this.transactionDetails = transactionDetails;
	}

	public TransactionDetail addTransactionDetail(TransactionDetail transactionDetail) {
		getTransactionDetails().add(transactionDetail);
		transactionDetail.setTransaction(this);

		return transactionDetail;
	}

	public TransactionDetail removeTransactionDetail(TransactionDetail transactionDetail) {
		getTransactionDetails().remove(transactionDetail);
		transactionDetail.setTransaction(null);

		return transactionDetail;
	}

}