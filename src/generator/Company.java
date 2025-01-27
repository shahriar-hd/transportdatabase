package generator;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Company {

    Random rand = new Random();
    String company_name, city, addr, service, manager, number;
    int cid, area, employee;
    List<Driver> drivers;

    public Company() {
        company_name = companyGen();
        city = cityGen();
        addr = addrGen();
        service = serviceGen();
        manager = managerGen();
        cid = cidGen();
        number = numberGen();
        area = areaGen();
        employee = employeGen();
        drivers = new ArrayList<>();
    }

    public String companyGen() {
        final String[] denmarkCompanies = {
            "DSV", "Danske Fragtmænd", "Bring Danmark", "PostNord Danmark", "Bladt Industries",
            "Blue Water Shipping", "Alex Andersen Ølund A/S", "P. Fournaise & Co. A/S", 
            "Thermo-Transit A/S", "DHL Danmark"
        };
        return denmarkCompanies[rand.nextInt(denmarkCompanies.length)];
    }

    public String cityGen() {
        final String[] city = {
            "Copenhagen", "Aarhus", "Odense", "Aalborg", "Esbjerg", 
            "Randers", "Kolding", "Horsens", "Vejle", "Roskilde"};

        return city[rand.nextInt(city.length)];
    }

    public String addrGen() {
        final String[] street = {
            "Vestergade", "Østergade", "Nørregade", "Søndergade", "Hovedgaden",
            "Strandvejen", "Park Allé", "Rådhuspladsen", "Torvet", "Engstien",
            "Frederiksberg Allé", "Amagerbrogade", "Jægersborg Allé", "Kongevejen", "Roskildevej",
            "Helsingørsgade", "Viborgvej", "Århusvej", "Odensevej", "Esbjergvej",
            "Algade", "Brogade", "Kirkegade", "Skolegade", "Stationsvej",
            "Markvejen", "Skovvejen", "Bakkevej", "Dalvejen", "Kystvejen",
            "Havnegade", "Strandpromenaden", "Fiskergade", "Møllegade", "Smedegade",
            "Bagergade", "Slagtergade", "Toldbodgade", "Værftsvej", "Industrivej",
            "Bygaden", "Landsbygaden", "Gammel Byvej", "Nygade", "Lille Torv",
            "Store Torv", "Runddelen", "Korsgade", "Blindgyde", "Sidegaden",
            "Tværvejen", "Parallelvej", "Diagonalvej", "Cirkelbuen", "Halvmånevej",
            "Rosen Allé", "Linde Allé", "Birkevej", "Egevej", "Fyrrevej",
            "Granstien", "Kastanievej", "Pile Allé", "Bøgevej", "Ahornvej",
            "Violvej", "Liljevej", "Rosevej", "Tulipanvej", "Solsikkevej",
            "Margueritvej", "Bellisvej", "Forglemmigejvej", "Stjernevej", "Kometvej",
            "Planetvej", "Galaksevej", "Mælkevejen", "Nordstjernen", "Sydkorset",
            "Orionsbæltet", "Karlsvognen", "Storebjørn", "Lillebjørn", "Cassiopeia",
            "Lyren", "Svanen", "Ørnen", "Falken", "Uglen",
            "Duevej", "Svalegade", "Spurvevej", "Mejsevej", "Rødhalsvej",
            "Solsortvej", "Drosselvej", "Stærevej", "Viborgvej", "Randersvej"};

        return "" + (rand.nextInt(99) + 1) + ", " + street[rand.nextInt(street.length)];
    }

    public String numberGen() {
        return  "045" + (rand.nextInt(63) - 20) + rand.nextInt(9999999);
    }

    public String managerGen() {
        final String[] fname = {
            "Andreas", "Anders", "Benjamin", "Christian", "Emil", "Frederik", "Jakob",
            "Jonas", "Kasper", "Lukas", "Magnus", "Martin", "Mathias", "Mads",
            "Nikolaj", "Oliver", "Peter", "Rasmus", "Simon", "Søren", "Thomas",
            "Troels", "Victor", "William", "Alexander", "Carl", "Daniel", "David",
            "Hans", "Henrik", "Jens", "Johannes", "Lars", "Morten", "Niels", "Ole",
            "Torben", "Allan", "Bent", "Finn", "Jan", "Jørgen", "Kurt", "Per", "Poul",
            "Sven", "Adam", "Anton", "August", "Gustav", "Noah", "Oscar"};
        final String[] lname = {
            "Jensen", "Nielsen", "Hansen", "Andersen", "Pedersen",
            "Christensen", "Larsen", "Sørensen", "Rasmussen", "Jørgensen",
            "Petersen", "Madsen", "Kristensen", "Olsen", "Thomsen",
            "Møller", "Mortensen", "Christiansen", "Poulsen", "Johansen",
            "Schmidt", "Simonsen", "Bak", "Høyer", "Iversen",
            "Gregersen", "Mathiesen", "Henriksen", "Clausen", "Paulsen",
            "Dam", "Holm", "Lund", "Bruun", "Bertelsen",
            "Knudsen", "Winther", "Friis", "Brandt", "Graversen",
            "Mikkelsen", "Bech", "Fabricius", "Riis", "Bjerre",
            "Kjær", "Justesen", "Dahl", "Overgaard", "Nørgaard"};
        return fname[rand.nextInt(fname.length)] + " " + lname[rand.nextInt(lname.length)];        
    }

    public String serviceGen() {
        final String[] companyFields = {
            "Logistics", "Freight Transport", "Parcel Delivery", "Heavy Transport", "Shipping",
            "Temperature-Controlled Transport","International Logistics", "Supply Chain Management"
        };
        return companyFields[rand.nextInt(companyFields.length)];
    }

    public int cidGen() {
        return rand.nextInt(89999) + 10000;
    }

    public int areaGen() {
        return rand.nextInt(50) * 500 + 1000;
    }

    public int employeGen() {
        return rand.nextInt(500) + 20;
    }
        //(name1, cid, number, city, addr, area, produce, manager, employe)
    public String toString() {
        return "(\'" + company_name + "\', " + cid + ", \'" + city + "\', \'" + addr + "\', " +
        area + ", \'" + service + "\', \'" + manager + "\', " + employee + "),";
    }

    public void addDriver(Driver driver) {
        this.drivers.add(driver);
    }

    public String hiring() {
        String temp = "";
        for(int i = 0; i < drivers.size(); i++) {
            Driver driver = drivers.get(i);
            temp += "(" + cid + ", " + driver.id + "),\n";
        }
        return temp;
    }
}
