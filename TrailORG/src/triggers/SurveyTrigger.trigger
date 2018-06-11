trigger SurveyTrigger on Survey_Request__c (before insert,after insert,before update) {
 List <Survey_Request__c> reqlist=new List<Survey_Request__c>();
    
    Map <id,Survey_Request__c> NewSurveyReq=trigger.newMap;
   Map <id,Survey_Request__c> OldSurveyReq=trigger.oldMap; 
    if(trigger.isinsert){
   
    for(Survey_Request__c req_obj : trigger.new)
    {
        
       if (req_obj.Status__c =='Stop')
        req_obj.addError('Survey cannot be created using Status as Stopped.');                
    }           
    }
if(trigger.isbefore && trigger.isUpdate){        
    for(Survey_Request__c req_obj : trigger.old){
       if(req_obj.Status__c=='Close')
       {if(NewSurveyReq.get(req_obj.Id).status__c=='Close')
           continue;
        else{
          NewSurveyReq.get(req_obj.Id).addError('Survey is close.Status cannot be updated.');
        
        }
       }
    }   
}
     if(trigger.isUpdate){
     List <Survey_Request__c>updatedsurvey=new List<Survey_Request__c>();
    for(Survey_Request__c req_obj : trigger.new){
       if(req_obj.Status__c=='Stop')
        {
           req_obj.Stop_Started_Date__c=System.Date.today();
            req_obj.Total_stop_duration_in_days__c = Math.abs(System.Date.today().daysBetween(NewSurveyReq.get(req_obj.id).Stop_Started_Date__c));           
       }
}   
    }
}