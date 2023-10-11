package product;

public class ProductDTO {
	
	private int pID; //상품아이디
	private String pname,volume,ingredient,pcompany,pperson,pcategory,pdesc,imgpath;
	//상품이름,규격,주원료,제조회사,상황별대상,상품종류,상품설명,이미지경로
	private int alcdegree, pprice,pstock; //도수,상품가격,상품재고
	private int count; //조회수

	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getAlcdegree() {
		return alcdegree;
	}
	public void setAlcdegree(int alcdegree) {
		this.alcdegree = alcdegree;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getPcompany() {
		return pcompany;
	}
	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}
	public String getPperson() {
		return pperson;
	}
	public void setPperson(String pperson) {
		this.pperson = pperson;
	}
	public String getPcategory() {
		return pcategory;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

}
