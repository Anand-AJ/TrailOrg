public class MyOppController {

public String stage{get;set;}
public List <Opportunity> opportunities;
public List<Opportunity> getOpportunities()
{
List <Opportunity> opportunitylist=new List<Opportunity>();
if(stage=='Qualification')
{
opportunities=[select Name,AccountId,Probability,CloseDate from Opportunity where 
                 StageName='Qualification' limit 100 ];
}

else if(stage=='Closed Won')
{
opportunities=[select Name,AccountId,Probability,CloseDate from Opportunity where 
                 StageName='Closed Won' limit 100 ];
}

else if(stage=='Closed Lost')
{
opportunities=[select Name,AccountId,Probability,CloseDate from Opportunity where 
                 StageName='Closed Lost' limit 100 ];
}

else if(stage=='Negotiation/Review')
{
opportunities=[select Name,AccountId,Probability,CloseDate from Opportunity where 
                 StageName='Negotiation/Review' limit 100 ];
}
return opportunities;
}

    public PageReference save()
    {
     return null;   
    }
}