package cn.edu.pojo;

public class Product {
	private int pid;
	private String pname;
	private double price;
	private String minphoto;
	private String maxphoto;
	private int stock;
	private int stid;
	private String name;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String pname, double price, String minphoto, String maxphoto, int stock, int stid) {
		super();
		this.pname = pname;
		this.price = price;
		this.minphoto = minphoto;
		this.maxphoto = maxphoto;
		this.stock = stock;
		this.stid = stid;
	}

	public Product(String pname, double price, String minphoto, String maxphoto, int stock, int stid, String name) {
		super();
		this.pname = pname;
		this.price = price;
		this.minphoto = minphoto;
		this.maxphoto = maxphoto;
		this.stock = stock;
		this.stid = stid;
		this.name = name;
	}

	public Product(int pid, String pname, double price, String minphoto, String maxphoto, int stock, int stid,
			String name) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.minphoto = minphoto;
		this.maxphoto = maxphoto;
		this.stock = stock;
		this.stid = stid;
		this.name = name;
	}

	public Product(int pid, String pname, double price, String minphoto, String maxphoto, int stock, int stid) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.minphoto = minphoto;
		this.maxphoto = maxphoto;
		this.stock = stock;
		this.stid = stid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getMinphoto() {
		return minphoto;
	}

	public void setMinphoto(String minphoto) {
		this.minphoto = minphoto;
	}

	public String getMaxphoto() {
		return maxphoto;
	}

	public void setMaxphoto(String maxphoto) {
		this.maxphoto = maxphoto;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getStid() {
		return stid;
	}

	public void setStid(int stid) {
		this.stid = stid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", price=" + price + ", minphoto=" + minphoto
				+ ", maxphoto=" + maxphoto + ", stock=" + stock + ", stid=" + stid + ", name=" + name + "]";
	}

}
