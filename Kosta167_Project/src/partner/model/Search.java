package partner.model;

public class Search {
	private String Partner_search;
	
	
	public Search(){}
	
	
	public Search(String partner_search) {
		super();
		Partner_search = partner_search;
	}


	public String getPartner_search() {
		return Partner_search;
	}
	public void setPartner_search(String Partner_search) {
		this.Partner_search = Partner_search;
	}
	
	
}
