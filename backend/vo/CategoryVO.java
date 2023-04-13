package vo;

public class CategoryVO {
	private String category_id;
	private String category_name;
	
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	@Override
	public String toString() {
		return "CategoryVO [category_id=" + category_id + ", category_name=" + category_name + ", getCategory_id()="
				+ getCategory_id() + ", getCategory_name()=" + getCategory_name() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
