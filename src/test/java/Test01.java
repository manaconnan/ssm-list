import com.mazexiang.bean.Employee;
import com.mazexiang.dao.EmployeeMapper;
import com.mazexiang.service.EmployeeService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

public class Test01 {
    public static void main(String[] args) {
        String str = "abcdeg";
        
        str =reverse(str);
        System.out.println("-------------------------------------------------------");
        System.out.println("============>str的值是： " + str);
    }



    public static String reverse(String arg) {
     if(arg.length()== 0) {
         return arg;
     }
     else {
         return reverse(arg.substring(1, arg.length())) + arg.substring(0, 1);
     }
 }


}


