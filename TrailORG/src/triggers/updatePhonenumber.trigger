trigger updatePhonenumber on Contact (after insert,after update) {
       List <Id> cont_list=new List<Id>();
             List <Id> acc_list=new List<Id>();
             for(Contact cont_obj: Trigger.new){
                 if(cont_obj.Is_Primary__c==true){
                     cont_list.add(cont_obj.Id);
                     acc_list.add(cont_obj.AccountId);
                }
             }      
                // update in account phone on basis of primary contact
            Map <id,Account> accmap=new Map<id,Account>([select id,Phone,Name from Account where id in:acc_list limit 100]);
            Map <id,Contact> contmap=new Map<id,Contact>([select id,Is_Primary__c,AccountId from Contact 
                                                          where AccountId in:acc_list and id not in:cont_list limit 100]);           
    if(trigger.isbefore){
    list<Contact> contupdatelist= new list<Contact>();    
    for(String key: contmap.keySet())
    {
        Contact contobj=contmap.get(key);
        contobj.Is_Primary__c=false;
        contupdatelist.add(contobj);                
    }    
    update contupdatelist;
    }    
    list<Account> acctoupdatelist= new list<Account>();
                 for(Contact cont_obj: Trigger.new) {
                    Account acc_obj=accmap.get(cont_obj.AccountId);
                     if(acc_obj!=null){
                     System.debug('account....'+acc_obj);
                     acc_obj.Phone=cont_obj.Phone;
                      acctoupdatelist.add(acc_obj);
                     }                     
                }
                update acctoupdatelist;
                           
}