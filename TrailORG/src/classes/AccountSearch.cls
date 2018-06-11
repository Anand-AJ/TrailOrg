public class AccountSearch{
    List<accountwrapper> accountList = new List<accountwrapper>();
    List<Account> selectedAccounts = new List<Account>();


    public AccountSearch(ApexPages.StandardController controller) {
        lstAccount = new List<Product2>();
        isResultDisplay = false;
    }
    public PageReference getSelected()
    {
        selectedAccounts.clear();
        for(accountwrapper accwrapper : accountList)
        if(accwrapper.selected == true)
        selectedAccounts.add(accwrapper.acc);
        return null;
    }
    public List<Account> GetSelectedAccounts()
    {
        if(selectedAccounts.size()>0)
        return selectedAccounts;
        else
        return null;
    }   

    public class accountwrapper
    {
        public Account acc{get; set;}
        public Boolean selected {get; set;}
        public accountwrapper(Account a)
        {
            acc = a;
            selected = false;
        }
    }


    public string AccSearchString {get; set;}
    public List<Product2> lstAccount {get; set;}
    public boolean isResultDisplay {get; set;}
    //  Search Function
    public void SearchAccountRec(){
        isResultDisplay = true;
        string strLikeString = '%'+AccSearchString+'%';
        string strSOQL = 'select id,Name from Product2 where Name LIKE: strLikeString order by Name';
        lstAccount = database.query(strSOQL);
    }
    public PageReference step1() {
           return Page.productdetails;
    }
}