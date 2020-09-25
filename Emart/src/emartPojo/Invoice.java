package emartPojo;

// Generated Jan 18, 2020 9:22:07 PM by Hibernate Tools 5.1.10.Final


public class Invoice implements java.io.Serializable {

	private Integer iid;
	private Cart cart;
	private int amount;

	public Invoice() {
	}

	public Invoice(Cart cart, int amount) {
		this.cart = cart;
		this.amount = amount;
	}


	
	public Integer getIid() {
		return this.iid;
	}

	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public Cart getCart() {
		return this.cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
	public long getAmount() {
		return this.amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}