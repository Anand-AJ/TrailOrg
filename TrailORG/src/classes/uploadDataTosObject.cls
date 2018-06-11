public with sharing class uploadDataTosObject {
   
    List<Account> forInsert = new List<Account>();
    public Integer size {get;set;}
    String myString {get;set;}
    public Boolean status {get;set;}
    public String message {get;set;}
    
    public uploadDataTosObject(){
        myString= '';
        size = 0;
        status= false;
    }
     public PageReference parseData(){
        parseJSONString();
        if(forInsert.size()>0){
            try{
               
                size = forInsert.size();
                status = true;
                insert forInsert ;
                }catch(Exception e){
                    status = false;
                    message = e.getMessage();
            }
        }
        return Null;
    }
    
    public void parseJSONString() {
    String jsonStr = myString;
    forInsert = new List<Account>();
    JSONParser parser = JSON.createParser(jsonStr);
    while (parser.nextToken() != null) {
        if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
            while (parser.nextToken() != null) {
                if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    Account acc = (Account)parser.readValueAs(Account.class);
                    forInsert.add(acc);
                    System.debug('Debug'+ acc.active__c);
                    String s = JSON.serialize(acc);
                    system.debug('Serialized invoice: ' + s);
                    parser.skipChildren();
                    }
                }
            }
        }
    } 
}