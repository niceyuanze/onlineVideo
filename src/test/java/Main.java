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

import java.util.Random;
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

//        String hql = "from User_Role ur where ur.user.id=:id1 and ur.role.id=:id2 ";
        String hql = "from User_Role u where u.role.id=:id1 ";

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        System.out.println(session.createQuery(hql)
                .setParameter("id1","e140c7a322494a23bc1b85739b01113d")


                .list());
        session.getTransaction().commit();
        session.close();

//        User user = new User();
//        user.setLoginname("cxvzxcFGSGv");
//        user.setPassword("wyw");
//        user.setEmail("wywdsb@qq.com");
//        session.save(user);





    }


    public static void main(String[] args) {
//        UUID uuid = UUID.randomUUID();
//        System.out.println(uuid.toString().replace("-",""));
//        Random random = new Random();
//        for(int i = 0; i < 5000; i++){
//            System.out.println(random.nextInt(3));
//        }
//        System.out.println(random.nextInt(3));
        //1 f6fdffe48c908deb0f4c3bd36c032e72
        //2 3ef7164d1f6167cb9f2658c07d3c2f0a
        Md5Hash md5Hash = new Md5Hash("admin","admin",2);
        System.out.println(md5Hash.toString());
        //3 3fed7a346e430ea4c2aa10250928f4de
//        System.out.println(md5Hash.toString());
//        System.out.println("zZiNqabBo9tAu8W021j+Aw==".length());
//        UUID uuid = UUID.randomUUID();
//        System.out.println(uuid);
    }
}
