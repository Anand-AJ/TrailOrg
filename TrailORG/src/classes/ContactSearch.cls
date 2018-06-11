public class ContactSearch {
	public static LIST<Contact> searchForContacts(String name, String postalCode){
        LIST <Contact> contactList = [Select Id,Name from Contact where LastName=:name AND MailingPostalCode=:postalcode];
        return contactList;
    }
}