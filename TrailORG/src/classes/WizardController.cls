public class WizardController
        {
        
        public Company__c comp{get; set;}
       public Employee__c emp{get; set;}
       // public static String mid;
        public WizardController(){
        
        
        comp=new Company__c();
        emp=new Employee__c();
        
        }
        public PageReference save()
        {if(comp==null)
        {
        comp=new Company__c();
        }
        if(comp.Name==''||comp.Address__c==''||comp.Company_Owner_Name__c==''||comp.Country__c==''||comp.State__c==''||comp.Zip_Code__c=='')
        {ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
        
            return null;
        }
       insert comp;
        PageReference compPage = new PageReference('https://ap2.salesforce.com/'+ comp.id);
        compPage.setRedirect(true);
        return compPage;
        }
        
        
        
        
        
        
        
        
        public PageReference CreateEmployee()
        {
        if(comp==null)
        {
        comp=new Company__c();
        }
        if(comp.Name==''||comp.Address__c==''||comp.Company_Owner_Name__c==''||comp.Country__c==''||comp.State__c==''||comp.Zip_Code__c=='')
        {ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
        
            return null;
        }
       insert comp;
       System.debug('id>>>>>'+comp.id);
      // wizardController.mid=comp.id;
        PageReference compPage = new PageReference('https://c.ap2.visual.force.com/apex/EmployeePage');
        compPage.getParameters().put('id',comp.Id);

        compPage.setRedirect(true);
        return compPage;
        }
        
        
        
        
        
            public PageReference save1()
            {if(emp==null)
            {
            emp=new Employee__c();
            }
            Company__c c=[select id from Company__c where id=:comp.Id limit 2];
            emp.Company__c=c.id;
            if(emp.Name==''||emp.Email__c==''||emp.Phone__c==''||emp.Employee_Designation__c=='')
            {ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
            
                return null;
            }
           emp.Company__c=ApexPages.currentPage().getParameters().get('Id');
           insert emp;
            PageReference empPage = new PageReference('https://ap2.salesforce.com/'+ emp.id);
            empPage.setRedirect(true);
            return empPage;
            }
            
            
            
            
            
             public PageReference savenew()
            {if(emp==null)
            {
            emp=new Employee__c();
            }
            if(emp.Name==''||emp.Email__c==''||emp.Phone__c==''||emp.Employee_Designation__c=='')
            {ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
            
                return null;
            }
            
            emp.Company__c=ApexPages.currentPage().getParameters().get('Id');
           
            //System.debug('mid>>>>>>>>>'+WizardController.mid);
           insert emp;
            PageReference empPage = new PageReference('https://c.ap2.visual.force.com/apex/EmployeePage');
            empPage.setRedirect(true);
            return empPage;
            }
            
            
        }