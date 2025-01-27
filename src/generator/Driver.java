package generator;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Driver {
    //(id, fname, lname, gender, addr, number, age, lisence, rating, salery, incomepkm, skill) 
    Random rand = new Random();
    String id, fname, lname, gender, addr, number, skill;
    int age, lisence, salery, d;
    float rating, incomepkm;
    List<Truck> trucks;

    public Driver(int d) {
        id = idGen();
        fname = firstNameGen();
        lname = lastNameGen();
        gender = genderGen();
        addr = addrGen();
        number = numberGen();
        age = ageGen();
        lisence = lisenceGen();
        rating = ratingGen();
        salery = saleryGen();
        incomepkm = incomepkmGen();
        skill = skillGen();
        this.d = d;
        trucks = new ArrayList<>();
    }


    public String idGen() {
        String temp = "";
        for(int i = 1; i <= 10; i++)
            temp += "" + rand.nextInt(10);
        return temp;
    }

    public String firstNameGen() {
        final String[] fname = {
            "Andreas", "Anders", "Benjamin", "Christian", "Emil", "Frederik", "Jakob",
            "Jonas", "Kasper", "Lukas", "Magnus", "Martin", "Mathias", "Mads",
            "Nikolaj", "Oliver", "Peter", "Rasmus", "Simon", "Søren", "Thomas",
            "Troels", "Victor", "William", "Alexander", "Carl", "Daniel", "David",
            "Hans", "Henrik", "Jens", "Johannes", "Lars", "Morten", "Niels", "Ole",
            "Torben", "Allan", "Bent", "Finn", "Jan", "Jørgen", "Kurt", "Per", "Poul",
            "Sven", "Adam", "Anton", "August", "Gustav", "Noah", "Oscar"};
        
        return fname[rand.nextInt(fname.length)];        
    }

    public String lastNameGen() {
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
        
        return lname[rand.nextInt(lname.length)];
    }

    public String genderGen() {
        return rand.nextBoolean() ? "Male" : "Female";
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

        return "" + (rand.nextInt(99) + 1) + ", " + street[rand.nextInt(street.length)] + 
        ", DK-" + rand.nextInt(9999) + " " + cityGen();
    }

    public String numberGen() {
        return  "045" + (rand.nextInt(43) + 20) + rand.nextInt(9999999);
    }

    public int ageGen() {
        return rand.nextInt(43) + 18;
    }

    public int lisenceGen() {
        return rand.nextBoolean()? 1 : 2;
    }

    public float ratingGen() {
        return rand.nextFloat() * 5;
    }

    public int saleryGen() {
        return rand.nextInt(1200) * 100;
    }

    public float incomepkmGen() {
        return rand.nextInt(90) + rand.nextFloat() + 10;
    }

    public String skillGen() {
        final String[] skill = {"Balanced", "Fragile Cargo", "Heavy Cargo", "Long Distance", "ADR"};
        return skill[rand.nextInt(skill.length)];
    }

    public void addTruck(Truck truck) {
        this.trucks.add(truck);
    }

    public void addTruck(List<Truck> trucks) {
        this.trucks.addAll(trucks);
    }
//(id, fname, lname, gender, addr, number, age, lisence, rating, salery, incomepkm, skill) 
    public String toString() {
        return "(" + id + ", \'" + fname + "\', \'" + lname + "\', \'" + gender + "\', \'" + addr + "\', " + 
        number + ", " + age + ", " + lisence + ", " + rating + ", " + salery + ", " + incomepkm + ", \'" + skill + "\'),";
    }

    public int driverID() {
        return d;
    }

    public String driving() {
        String temp = "";
        for(int i = 0; i < trucks.size(); i++) {
            Truck truck = trucks.get(i);
            temp += "(" + d + ", \'" + truck.plate + "\', " + truck.t + "),\n";
        }
        return temp;
    }
}
