public class Checkbox_Class 
{
    List<accountwrapper> accountList = new List<accountwrapper>();
    List<Product2> selectedAccounts = new List<Product2>();
        
    public string AccSearchString {get; set;}
    public string AccPhoneNo {get; set;}
    public List<accountwrapper> getAccounts()
    {
        string strLikeString = '%'+AccSearchString+'%';
        for(Product2 a : [select id,Name,Description from Product2 where Name LIKE: strLikeString order by Name limit 5])
        accountList.add(new accountwrapper(a));
        return accountList;
    }
    
    public PageReference getSelected()
    {
        selectedAccounts.clear();
        for(accountwrapper accwrapper : accountList)
        if(accwrapper.selected == true)
        selectedAccounts.add(accwrapper.acc);
        return null;
    }
    
    public List<Product2> GetSelectedAccounts()
    {
        if(selectedAccounts.size()>0)
        return selectedAccounts;
        else
        return null;
    }    
    
    public class accountwrapper
    {
        public Product2 acc{get; set;}
        public Boolean selected {get; set;}
        public accountwrapper(Product2 a)
        {
            acc = a;
            selected = false;
        }
    }
    
}