package generator;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Truck{
    
    Random rand = new Random();
    String plate, brand, model, trailertype, color, garage;
    int t, trailerid, axil, powerhp, gear, kilometer, manyear;
    float fuelconsumption;
    List<Trailer> trailers;

    public Truck(int t) {
        trailers = new ArrayList<>();
        plate = plateGen();
        String[] temp = new String[2];
        temp = brandModelGen();
        brand = temp[0];
        model = temp[1];
        trailertype = trailerGen();
        color = colorGen();
        axil = axilGen();
        powerhp = powerhpGen();
        gear = gearGen();
        kilometer = kilometerGen();
        manyear = manyearGen();
        fuelconsumption = fuelconsumptionGen();
        garage = garageGen();
        this.t = t;
    }

    public String plateGen(){
        String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String plate = "";
        plate += Integer.toString(rand.nextInt(10));
        plate += Integer.toString(rand.nextInt(10));
        plate += letters.charAt(rand.nextInt(26));
        plate += Integer.toString(rand.nextInt(10));
        plate += Integer.toString(rand.nextInt(10));
        plate += Integer.toString(rand.nextInt(10));
        return plate;
    }

    public String[] brandModelGen() {
        String[] temp = new String[2];
        final String[] dafmodel = {"NGD XF", "NGD XF+", "NGD XF Aero", "NGD Super", "XF105"};
        final String[] ivemodel = {"Stralis Active", "Stralis Space", "S-Way Active", "S-Way Space"};
        final String[] bnzmodel = {"Actros", "Axor", "Actros Plus", "Actros Space", "Actros Aero"};
        final String[] renmodel = {"T-Shifter", "T-Sleeper", "Magnum", "Classic"};
        final String[] scimodel = {"S Series", "R Series", "Streamline"};
        final String[] volmodel = {"FH3", "FH4", "FH5", "FH6"};
        switch (rand.nextInt(6)) {
            case 0:
                temp[0] = "DAF";
                temp[1] = dafmodel[rand.nextInt(dafmodel.length)];
                break;
            case 1:
                temp[0] = "Iveco";
                temp[1] = ivemodel[rand.nextInt(ivemodel.length)];
                break;
            case 2:
                temp[0] = "Mercedes Banz";
                temp[1] = bnzmodel[rand.nextInt(bnzmodel.length)];
                break;
            case 3:
                temp[0] = "Renault";
                temp[1] = renmodel[rand.nextInt(renmodel.length)];
                break;
            case 4:
                temp[0] = "Scania";
                temp[1] = scimodel[rand.nextInt(scimodel.length)];
                break;
            case 5:
                temp[0] = "Volvo";
                temp[1] = volmodel[rand.nextInt(volmodel.length)];
                break;
            default:
                throw new AssertionError();
        }
        return temp;
    }

    public String trailerGen() {
        final String[] ttype = {
            "Dumper", "Floor", "Container", "Live Castel", "Gas Tunk", 
            "Feul Tunk", "Food Tunk", "Low Lead", "Low Bed", "Refrigerated"};
        return ttype[rand.nextInt(ttype.length)];
    }

    public int getTrailerid() {
        return -1;
    }

    public String colorGen(boolean isTrailer) {
        final String[] basic_color = { 
            "Black", "White", "Blue", "Red", "Yellow", "Grey"};
        final String[] colors = {
            "Mantis Green", "Olive Green", "Flame Red", "Candy Red", 
            "Red Sunset", "Silver", "Electric Orange", "Stream Blue", "Jamaica Blue", "Sky Blue", 
            "Navy Blue", "Rouge Flame", "Yok Yellow", "White", "Shadow Black"};
        if (isTrailer)
            return basic_color[rand.nextInt(basic_color.length)];
        else
            return colors[rand.nextInt(colors.length)];
    }

    public String colorGen() {
        return colorGen(false);
    }

    public int axilGen() {
        return rand.nextInt(2) + 2;
    }

    public int powerhpGen() {
        final int[] engine = {
            330, 380, 395, 400, 410, 420, 428, 440, 449, 450, 460, 476, 480, 
            483, 490, 500, 510, 520, 530, 540, 640, 650, 750, 770, 780};
        return engine[rand.nextInt(engine.length)];
    }

    public int gearGen() {
        final int[] gears = {6, 12, 16, 18};
        return gears[rand.nextInt(gears.length)];
    }

    public int kilometerGen() {
        return rand.nextInt(500000);
    }

    public int manyearGen() {
        return rand.nextInt(25) + 2000;
    }

    public float fuelconsumptionGen() {
        return rand.nextFloat() + rand.nextInt(30) + 30;
    }

    public String garageGen() {
        final String[] city = {
            "Copenhagen", "Aarhus", "Odense", "Aalborg", "Esbjerg", 
            "Randers", "Kolding", "Horsens", "Vejle", "Roskilde"};

        return city[rand.nextInt(city.length)];
    }

    public void addTrailer(Trailer trailer) {
        this.trailers.add(trailer);
    }

    public String toString() {
        //(plate, brand, model, trailer, trailerid, color, axil, powerhp, gear, kilometer, manyear, fuelconsumption, garage)
        return "(\'" + plate + "\', \'" + brand + "\', \'" + model + "\', \'" + trailertype + "\', " + trailerid + 
        ", \'" + color + "\', " + axil + ", " + powerhp + ", " + gear + ", " + kilometer + ", " + manyear + ", " + 
        fuelconsumption + ", \'" + garage + "\'),";
    }

    public String attach() {
        String temp = "";
        for(int i = 0; i < trailers.size(); i++) {
            Trailer trailer = trailers.get(i);
            temp += "(" + t + ", \'" + trailer.plate + "\', " + trailer.tr + "),\n";
        }
        return temp;
    }

    public void setTrailerID(Trailer trailer) {
        this.trailerid = trailer.tr;
    }
}