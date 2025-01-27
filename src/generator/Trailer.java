package generator;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Trailer {
    
    Random rand = new Random();
    String plate, garage, manufacture, ttype, tbody;
    int tr, weightton, maxweight, manyear, axil;
    double lengthm, widthm, hieghtm;
    boolean lifteable;
    List<Cargo> cargos;

    Trailer(int tr, String plate, String ttype) {
        this.tr = tr;
        this.plate = plate;
        this.ttype = ttype;
        garage = garageGen();
        manufacture = manufactureGen();
        tbody = tbodyGen();
        weightton = weighttonGen();
        maxweight = maxweightGen();
        manyear = manyearGen();
        axil = axilGen();
        lengthm = lengthmGen();
        widthm = widthmGen();
        hieghtm = hieghtmGen();
        cargos = new ArrayList<>();
    }

    public String garageGen() {
        final String[] city = {
            "Copenhagen", "Aarhus", "Odense", "Aalborg", "Esbjerg", 
            "Randers", "Kolding", "Horsens", "Vejle", "Roskilde"};

        return city[rand.nextInt(city.length)];
    }

    public String manufactureGen() {
        final String[] trailerManufacturers = {
            "Kögel", "Schmitz Cargobull", "Krone", "Faymonville", "Goldhofer"};
        return trailerManufacturers[rand.nextInt(trailerManufacturers.length)];
    }

    public String tbodyGen() {
        return rand.nextBoolean() ? "Single" : "Double";
    }

    public int weighttonGen() {
        return rand.nextInt(13) + 3;
    }

    public int maxweightGen() {
        return rand.nextInt(41) + 10;
    }

    public int manyearGen() {
        return rand.nextInt(25) + 2000;
    }

    public int axilGen() {
        return rand.nextInt(9) + 2;
    }

    public double  lengthmGen() {
        final double[] len = {13.62, 13.31, 22.7, 16.4, 12.04, 11.9, 18.1};
        return len[rand.nextInt(len.length)];
    }

    public double  widthmGen() {
        final double[] wid = {2.55, 2.47, 2.48, 2.51, 2.30};
        return wid[rand.nextInt(wid.length)];
    }

    public double  hieghtmGen() {
        final double[] hie = {2.65, 3.07, 2.79, 3.6, 3.65};
        return hie[rand.nextInt(hie.length)];
    }

    public boolean lifteableGen() {
        return rand.nextBoolean();
    }

    public void addCargo(Cargo cargo) {
        this.cargos.add(cargo);
    }

    //(plate, garage, manufacture, ttype, tbody, weightton, maxweight, manyear, axel, lengthm, widthm, hieghtm, lifteab
    public String toString() {
        return "(\'" + plate + "\', \'" + garage + "\', \'" + manufacture + "\', \'" + ttype + "\', \'" + tbody + "\', " +
        weightton + ", " + maxweight + ", " + manyear + ", " + axil + ", " + lengthm + ", " + widthm + ", " + hieghtm + ", \'" + 
        (lifteable ? "TRUE" : "FALSE") + "\'),";
    }

    public String loading() {
        String temp = "";
        for(int i = 0; i < cargos.size(); i++) {
            Cargo cargo = cargos.get(i);
            temp += "(" + tr + ", " + cargo.l + "),\n";
        }
        return temp;
    }
}
