public class addProductsRedirect {

Opportunity opp;
public String addProductsURL {get; set;}

public Opportunity getOpp(){
if(opp == null){
opp = [select Id, Name from Opportunity limit 1];
}
return opp;
}

public PageReference addProduct(){
PageReference p = new PageReference(addProductsURL );
p.getParameters().put('addTo',opp.Id);
p.setRedirect(true);
return p;
}
}