trigger SyncUserToEmployee on User (after insert,after update) {
    
    List <Employee__c> emplist=new List<Employee__c>();
    set<id> usersDoesnotHaveEmp = new set<id>();
    set<id> userIdForwhichEmployeeExist = new set<id>();
    List<String> useremaillist=new List<String>();
     List<String> empemaillist=new List<String>();
    usersDoesnotHaveEmp.addAll(trigger.NewMAp.Keyset());
   //Map <id,User> usermap=new Map<id,user>();
    for(User userobj:trigger.new){
        useremaillist.add(userobj.Email);
     }
  
    Map<id,Employee__c> empMap=new Map<id,Employee__c>([select id,First_Name__c,Email__c,User__c from Employee__c
                                                      where Email__c in:useremaillist limit 100]);
    
      for(Employee__c empobj :empMap.values()){
          empemaillist.add(empobj.Email__c);
          userIdForwhichEmployeeExist.add(empobj.User__c);
      }
    
    usersDoesnotHaveEmp.removeAll(userIdForwhichEmployeeExist);
    

            for(Id uid:usersDoesnotHaveEmp)
            {
               emplist.add(new Employee__c(Name=trigger.newMap.get(uid).name,
                                                Email__c=trigger.newMap.get(uid).name,
                                               Phone__c=trigger.newMap.get(uid).Phone));
                
                
                
                
            }
            insert emplist;
           
        
    }