public class AccountTriggerHelper {
    
    @future
    public static void updateContact(Set<Id> accIdSet)
    {
        List<Contact> contactList = new List<Contact>();
        try
        {
           for(Account accRec : [SELECT BillingAddress,BillingCity,BillingCountry,BillingStreet,(SELECT MailingAddress,MailingCity,MailingCountry,MailingStreet FROM Contacts) FROM Account where Id in: accIdSet])
            {
                for(Contact contactRec : accRec.Contacts)
                {
                    //contactRec.MailingAddress = accRec.BillingAddress;
                    contactRec.MailingCity = accRec.BillingCity;
                    contactRec.MailingCountry = accRec.BillingCountry;
                    contactRec.MailingStreet = accRec.BillingStreet;
                    contactList.add(contactRec);
                }
            }
            database.update(contactList, False); 
        }
		Catch(Exception ex)
        {
            System.debug('We can create a custom object and insert this exception to track'+ex.getMessage());
        }
    }
}