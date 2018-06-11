public class MyVFPageController{

    public MyVFPageController(ApexPages.StandardController controller) {

    }

public List <Wrap> Contacts;
public List<Wrap> getContacts()
{
List <Contact> contactlist=[select Name,Email,Phone,AccountId from Contact where AccountId=:ApexPages.CurrentPage().GetParameters().Get('id') limit 100];
if(Contacts==null)
Contacts=new List<Wrap>();
for(Contact con: contactlist)
{System.debug('Contacts>>>>>'+Contacts);
System.debug('ID>>>>>'+ApexPages.CurrentPage().GetParameters().Get('AccountId'));
Contacts.add(new Wrap(con));
}
return Contacts;
}
    public PageReference save()
    {
    PageReference pg=new PageReference('..apex/MYVFPage');
    pg.setRedirect(true);
     return pg;       
    }
public PageReference abc()
{
List<Contact> contactlistdel;
    if(contactlistdel==null)
    {contactlistdel=new List<Contact>();}
    for(Wrap w:getContacts())
    if(w.selected==true)
    {contactlistdel.add(w.con);       
    }    
     delete contactlistdel;
save();
return null;
}
}