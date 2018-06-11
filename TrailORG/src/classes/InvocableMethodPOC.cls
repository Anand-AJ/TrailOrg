public class InvocableMethodPOC {
    @InvocableMethod(label='Get Account Names' description='Returns the list of account names corresponding to the specified account IDs.')
    public static List<String> getAccountNames(List<ID> ids) {
        system.debug('ids::>'+ids);
        List<String> accountNames = new List<String>();
        List<Account> accountList = new List<Account>();
        List<Account> accounts = [SELECT Name FROM Account WHERE Id in :ids];
        for (Account account : accounts) {
            account.Description = account.Name+'Test';
            accountNames.add(account.Name);
            accountList.add(account);
        }
        database.update(accountList);
        return accountNames;
    }
}