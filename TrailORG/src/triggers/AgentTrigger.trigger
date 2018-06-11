trigger AgentTrigger on Agent__c (before insert) {
    List<Task> tasks = new List<Task>();   
    Agent__c Agent = new Agent__c();
    if(Agent.End_Date__c<System.Date.today()){
        Task tobj = new Task();
        tasks.add(tobj);
        insert tobj;
    }

}