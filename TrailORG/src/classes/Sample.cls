public class Sample
 {
     public String state {get;set;}
     public String city {get;set;}

    public List<SelectOption> getStates()
     {
         List<SelectOption> options = new List<SelectOption>();
         options.add(new SelectOption('None','--- None ---'));        
         options.add(new SelectOption('UP','Uttar Pradesh'));
         options.add(new SelectOption('MP','Madhya Pradesh'));
         options.add(new SelectOption('MAH','Maharashtra'));
         options.add(new SelectOption('GUJ','GUJARAT'));
         return options;
     } 
     
     public List<SelectOption> getcities()
     {
         List<SelectOption> options = new List<SelectOption>();
         if(state == 'UP')
         {       
             options.add(new SelectOption('Jhansi','Jhansi'));
             options.add(new SelectOption('Kanpur','Kanpur'));
          }            
         else if(state == 'MP')
         {       
             options.add(new SelectOption('Bhopal','Bhopal'));
             options.add(new SelectOption('Indore','Indore'));
             
         }
         else if(state == 'MAH')
         {       
             options.add(new SelectOption('Satara','Satara'));
             options.add(new SelectOption('Sangli','Sangli'));
             
         }
          else if(state == 'GUJ')
         {       
             options.add(new SelectOption('Surat','Surat'));
             options.add(new SelectOption('Ahemdabad','Ahemdabad'));
           }
         else
         {
             options.add(new SelectOption('None','--- None ---'));
         }      
         return options;
     }       
 }