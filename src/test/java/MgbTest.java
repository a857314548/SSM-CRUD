import com.zhangzhen.bean.DepartMent;
import com.zhangzhen.bean.Employee;
import com.zhangzhen.dao.DepartMentMapper;
import com.zhangzhen.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MgbTest {

    @Autowired
    private DepartMentMapper departMentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Test
    public void testMgb()throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        File configFile = new File("D:\\xuexi\\java\\ideajihe\\xm\\ssm-crud\\mbg.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);
    }

    @Test
    public void springTest() {
        System.out.println(departMentMapper);
        /*departMentMapper.insertSelective(new DepartMent(null,"开发部"));
        departMentMapper.insertSelective(new DepartMent(null,"测试部"));*/

        //employeeMapper.insertSelective(new Employee(null,"tom","m","21123@zhangzhen.com",1));
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5) + i;
            employeeMapper.insertSelective(new Employee(null,uid,"m",uid+"@zhangzhen.com",1));
        }
        System.out.println("批量插入完成");
    }
}
