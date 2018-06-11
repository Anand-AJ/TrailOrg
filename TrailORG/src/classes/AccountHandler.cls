public class AccountHandler {
    public static Account insertNewAccount(String accName){
        Account acc = new Account(Name=accName);
        Database.SaveResult sr = Database.insert(acc,false);
        if(sr.isSuccess()){
            return acc;
        }
        else{
            return null;
        }
        
    }
}