package generator;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class Generator{
    public static int N;
    public static int 
        d = 10000, 
        t = 10000, 
        tr = 1000, 
        l = 10000;
    
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();
        Random rand = new Random();
        Scanner scanner = new Scanner(System.in);
        System.out.println("Hi there, Welcome to Generator.");
        System.out.println("Please Enter Number of Company:");
        N = scanner.nextInt();
        List<Driver> drivers = new ArrayList<>();
        List<Truck> trucks = new ArrayList<>();
        List<Trailer> trailers = new ArrayList<>();
        List<Cargo> cargos = new ArrayList<>();
        List<Company> companies = new ArrayList<>();
        List<String> driving = new ArrayList<>();
        List<String> attach = new ArrayList<>();
        List<String> loading = new ArrayList<>();
        List<String> hiring = new ArrayList<>();

        for (int x = 0; x <= N; x++) {
            Company company = new Company();

            int p = rand.nextInt(10);
            for (int i = 0; i < p; i++) {
                Driver driver = new Driver(d);
                dcout();
                int r = rand.nextInt(2);
                for (int j = 0; j <= r; j++) {
                    Truck truck = new Truck(t);
                    tcout();
    
                    int s = rand.nextInt(3);
                    for (int k = 0; k < s; k++) {
                        Trailer trailer = new Trailer(tr, truck.plate, truck.trailertype);
                        trcout();
                        int q = rand.nextInt(5);
                        for (int h = 0; h < q; h++) {
                            Cargo cargo = new Cargo(l, trailer.ttype, trailer.tbody);
                            lcout();
                            cargos.add(cargo);
                            trailer.addCargo(cargo);
                        }
                        truck.setTrailerID(trailer);
                        trailers.add(trailer);
                        loading.add(trailer.loading());
                        truck.addTrailer(trailer);
                    }
                    trucks.add(truck);
                    attach.add(truck.attach());
                    driver.addTruck(truck);
                }
                drivers.add(driver);
                driving.add(driver.driving());
                company.addDriver(driver);
            }
            companies.add(company);
            hiring.add(company.hiring());
        }

        

        //Driver:
        System.out.println("INSERT into driver (id, fname, lname, gender, addr, number, age, lisence, rating, salery, incomepkm, skill) values");
        for(int i = 0; i < drivers.size(); i++)
            System.out.println(drivers.get(i).toString());
        System.out.println("");

        //Truck:
        System.out.println("INSERT into truck (plate, brand, model, trailer, trailerid, color, axil, powerhp, gear, kilometer, manyear, fuelconsumption, garage) values");
        for (int i = 0; i < trucks.size(); i++) 
            System.out.println(trucks.get(i).toString());
        System.out.println("");

        //Trailer:
        System.out.println("INSERT into trailer (plate, garage, manufacture, ttype, tbody, weightton, maxweight, manyear, axel, lengthm, widthm, hieghtm, lifteable) values");
        for (int i = 0; i < trailers.size(); i++)
            System.out.println(trailers.get(i).toString());
        System.out.println("");

        //Cargo
        System.out.println("INSERT into cargo (weightton, name1, ltype, ttype, tbody, origin, destination, ocompany, dcompany, distance, income, scort) values");
        for (int i = 0; i < cargos.size(); i++)
            System.out.println(cargos.get(i).toString());
        System.out.println("");

        //Company:
        System.out.println("INSERT into company (name1, cid, number, city, addr, area, servicee, manager, employe) values");
        for(int i = 0; i < companies.size(); i++)
            System.out.println(companies.get(i).toString());
        System.out.println("");
        
        //Driving:
        System.out.println("INSERT into driving values");
        for(int i = 0; i < driving.size(); i++)
            System.out.println(driving.get(i));
        System.out.println("");

        //Attach Trailer:
        System.out.println("INSERT into attachtrailer values");
        for(int i = 0; i < attach.size(); i++)
            System.out.println(attach.get(i));
        System.out.println("");

        //Loading:
        System.out.println("INSERT into loading values");
        for(int i = 0; i < loading.size(); i++)
            System.out.println(loading.get(i));
        System.out.println("");
        
        //Hiring:
        System.out.println("INSERT into hiring values");
        for(int i = 0; i < hiring.size(); i++)
            System.out.println(hiring.get(i));
        System.out.println("");

        System.out.println("Do you want to insert into DataBase? y/n");
        String input = scanner.next();
        boolean isORM = input.equalsIgnoreCase("y");
        if(isORM) {
            System.out.println("ORM start:");
        try {
            em.getTransaction().begin();
            for(Driver driver : drivers) {
                em.persist(driver);
            }
            em.getTransaction().commit();
            System.out.println("Data saved to database!");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }
        }
        else
            System.out.println("ORM not accepted.");


    }

    public static void dcout() {d++;}
    public static void tcout() {t++;}
    public static void lcout() {l++;}
    public static void trcout() {tr++;}
}
