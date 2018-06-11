public class StringArrayTest {

    public static List<String> generateStringArray(Integer n){
        
        List<String> test1 = new List<String>();
        for(Integer i=0;i<n;i++){
            test1.add('Test '+i);
            System.debug(test1[i]);
        }
        return test1;
    }
}