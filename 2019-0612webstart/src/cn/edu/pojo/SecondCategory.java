package cn.edu.pojo;

public class SecondCategory {
	private int id;
	private String name;
	
	private int cid;
	private String cname;
	public SecondCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SecondCategory(int id, String name, int cid, String cname) {
		super();
		this.id = id;
		this.name = name;
		this.cid = cid;
		this.cname = cname;
	}
	
	public SecondCategory(int id, String name, int cid) {
		super();
		this.id = id;
		this.name = name;
		this.cid = cid;
	}
	public SecondCategory(String name, int cid) {
		super();
		this.name = name;
		this.cid = cid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "SecondCategory [id=" + id + ", name=" + name + ", cid=" + cid + ", cname=" + cname + "]";
	}
	
}
