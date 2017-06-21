import com.onlineVideo.pojo.*;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.UUIDCharType;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

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

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Staff staff = new Staff();
        staff.setStaffCode("BBBBBB");
        staff.setPassword("BBBBBB");
        staff.setName("2B2B2B");
        Role role = new Role();
        role.setId("3a8e94d86fda499ca97d78947e493e4e");
        role.setContent("系统管理员");
        staff.setRole(role);
        session.save(staff);
        transaction.commit();
        session.close();
//        Advertisement advertisement = new Advertisement();
//        advertisement.setId("2f88c0f94f2542daafd21248bbfc9ce0");
//        ArrayList arrayList = new ArrayList();
////        arrayList.add(advertisement);
//        Type type = new Type();
//        type.setName("学习视频");
//        Video video = new Video();
//        video.setId("3a8e94d86fda499ca97d78947e493e4e");
//        video.setName("123");
//        video.setCover("123123");
//        video.setSource("12312321");
//        video.setPath("123123");
//        video.setType(type);
//        video.setAbstracts("asdfasdf");
////        video.setAdvertisements(arrayList);
//        session.update(video);


//        Video video = new Video();
//        video.setName("学习");
//        video.setAbstracts("123123123" );
//        Type type = new Type();
//        type.setName("学习学习");
//        video.setType(type);
//        DetachedCriteria dc = DetachedCriteria.forClass(Video.class);
//        Disjunction disjunction = Restrictions.disjunction();



//        if(video.getName() != null){
//            disjunction.add(Restrictions.like("name",video.getName(), MatchMode.ANYWHERE));
////            dc.add(Restrictions.like("name",video.getName(), MatchMode.ANYWHERE));
//        }
//        if(video.getAbstracts() != null){
//            disjunction.add(Restrictions.like("abstracts",video.getAbstracts(), MatchMode.ANYWHERE));
////            dc.add(Restrictions.like("abstracts",video.getAbstracts(), MatchMode.ANYWHERE));
//        }
//        if(video.getType() != null){
//            dc.add(Restrictions.eq("type",video.getType()));
//        }
////        if(video.getSource() != null){
////            dc.add(Restrictions.like("source",video.getSource(), MatchMode.ANYWHERE));
////        }
//        dc.add(disjunction);
//        Criteria c = dc.getExecutableCriteria(session);
//        List<Video> videoList = c.list();
//        System.out.println(videoList);
//        session.close();








    }


    public static void main(String[] args) {
//        UUID uuid = UUID.randomUUID();
//        for(int i = 0; i < 10; i++){
//            uuid = UUID.randomUUID();
//            System.out.println(uuid.toString().replace("-",""));
//        }
//        Random random = new Random();
//        for(int i = 0; i < 5000; i++){
//            System.out.println(random.nextInt(3));
//        }
//        System.out.println(random.nextInt(3));
        //1 f6fdffe48c908deb0f4c3bd36c032e72
        //2 3ef7164d1f6167cb9f2658c07d3c2f0a
        Md5Hash md5Hash = new Md5Hash("BBBBBB","BBBBBB",2);
        System.out.println(md5Hash.toString());
        //3 3fed7a346e430ea4c2aa10250928f4de
//        System.out.println(md5Hash.toString());
//        System.out.println("zZiNqabBo9tAu8W021j+Aw==".length());
//        UUID uuid = UUID.randomUUID();
//        System.out.println(uuid);
    }
}
