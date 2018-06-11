public class OppControllerExtension {
    private final Opportunity opp {get; set;}
   public List<OpportunityLineItem> oppprod {get;set;}   
    public OppControllerExtension(ApexPages.StandardController stdController) {
        this.opp = (Opportunity)stdController.getRecord();    
    oppprod=[select id,OpportunityId,ServiceDate,Discount,ListPrice,ProductCode,Quantity,UnitPrice,Subtotal,TotalPrice from OpportunityLineItem where OpportunityId=:opp.Id limit 100];               
    }
}