import com.onlineVideo.login.pojo.User;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataBuilder;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.type.UUIDCharType;
import org.junit.Test;

import java.util.UUID;

/**
 * Created by niceyuanze on 17-6-1.
 */
public class Main {

    @Test
    public void testxxx(){

//         A SessionFactory is set up once for an application!
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure() // configures settings from hibernate.cfg.xml
                .build();
        Metadata metadata = new MetadataSources( registry )
                .getMetadataBuilder()
                .applyBasicType( UUIDCharType.INSTANCE, UUID.class.getName() )
                .build();

        SessionFactory sessionFactory = metadata.getSessionFactoryBuilder()
                .build();

        User user = new User();

        user.setLoginname("cxvzxcFGSGv");
        user.setPassword("wyw");
        user.setEmail("wywdsb@qq.com");
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        session.close();



    }


    public static void main(String[] args) {
        Md5Hash md5Hash = new Md5Hash("111sadgasdg","qwe",2);
        System.out.println(md5Hash.toString());
        System.out.println("zZiNqabBo9tAu8W021j+Aw==".length());
        UUID uuid = UUID.randomUUID();
        System.out.println(uuid);
    }
}
