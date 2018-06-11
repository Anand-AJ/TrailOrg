public class fetchRecords {
public Boolean showRecords{get;set;}
public List<Opportunity> cust {get;set;}
	
public void fetchRecords(){
cust = [Select Name, CloseDate from Opportunity limit 1000];
showRecords = true;
}
}