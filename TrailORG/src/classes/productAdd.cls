public with sharing class productAdd
{ 

    public  List<Product2> Stdproduct{get;set;}    
    public List<wrapper> wrapperList {get;set;}  
    public list<wrapper> SelectedprodList{get;set;} 
    public PageReference getSelected()
    {
        Stdproduct.clear();
        for(wrapper accwrapper : wrapperList)
        if(accwrapper.selected == true)
        Stdproduct.add(accwrapper.cont);
        return null;
    }
    

    public class wrapper
    {
        public product2 cont{get;set;}
        public Boolean selected{get;set;}
        public integer quantity{get;set;}
        public wrapper(product2 c)
        {
            cont = c;
            selected = false;
        } 
    }
    public string AccSearchString {get; set;}
     public List<Product2> lstAccount {get; set;}
     public boolean isResultDisplay {get; set;}
    public void SearchAccountRec(){
        isResultDisplay = true;
        string strLikeString = '%'+AccSearchString+'%';
        string strSOQL = 'select id,Name from Product2 where Name LIKE: strLikeString order by Name';
        lstAccount = database.query(strSOQL);
    }
    public  List<wrapper> getProdList()
    {        
        if((wrapperList == null) || (wrapperList.size() == 0))
        {                      
            wrapperList = new List<wrapper>();
            Stdproduct = [Select id, Name from product2 limit 2];           
            for(Product2 c :(List<Product2>)Stdproduct)            
            {               
                wrapperList.add(new wrapper(c));
            }
        }             
        return wrapperList;
    }
    
    public PageReference AddQuantity()
    {   
       PageReference pageRef= new PageReference('/apex/AddQuantity');
       pageRef.setRedirect(false);        
       return pageRef;           
   }

    public list<wrapper> getSelectedproducts()
    {
        selectedprodList = new list<wrapper>();      
        for(wrapper cCon:getProdList())
        {            
            if(cCon.selected==true)  
            {                        
                selectedprodList.add(cCon);
            }                           
        }        
        return selectedprodList;           
    }        
}