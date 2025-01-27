package generator;

import java.util.Random;

public class Cargo {
    //(weightton, name1, ltype, ttype, tbody, origin, destination, ocompany, dcompany, distance, income, scort)    
    Random rand = new Random();
    String load_name, ltype, ttype, tbody, origin, destination, ocompany, dcompany;
    int weightton, distance, income, l;
    boolean scort;

    public Cargo(int l, String ttype, String tbody) {
        this.l = l;
        this.ttype = ttype;
        this.tbody = tbody;
        weightton = weighttonGen();
        load_name = loadNameGen();
        ltype = loadTypeGen();
        origin = cityGen();
        destination = cityGen();
        ocompany = companyGen();
        dcompany = companyGen();
        distance = distanceGen();
        income = incomeGen();
        scort = rand.nextBoolean();
    }

    public int weighttonGen() {
        return rand.nextInt(50) + 1;
    }

    public String loadNameGen() {
        final String[] cargoNames = {
            "Steel Coils", "Aluminum Ingots", "Copper Wire", "Iron Ore", "Scrap Metal",
            "Natural Gas", "Propane", "Butane", "LNG (Liquefied Natural Gas)", "LPG (Liquefied Petroleum Gas)",
            "Crude Oil", "Gasoline", "Diesel Fuel", "Jet Fuel", "Heating Oil",
            "Cars", "Trucks", "Vans", "Motorcycles", "Buses",
            "Agricultural Machinery", "Construction Equipment", "Mining Equipment", "Industrial Machinery", "Textile Machinery",
            "Grain", "Corn", "Wheat", "Soybeans", "Rice",
            "Fruits", "Vegetables", "Meat", "Poultry", "Fish",
            "Dairy Products", "Eggs", "Beverages", "Bottled Water", "Soft Drinks",
            "Beer", "Wine", "Spirits", "Pharmaceuticals", "Medical Supplies",
            "Chemicals", "Fertilizers", "Pesticides", "Plastics", "Rubber",
            "Paper", "Cardboard", "Printing Materials", "Packaging Materials", "Textiles",
            "Clothing", "Shoes", "Furniture", "Household Goods", "Electronics",
            "Computers", "Mobile Phones", "Televisions", "Appliances", "Tools",
            "Building Materials", "Cement", "Bricks", "Tiles", "Lumber",
            "Stone", "Gravel", "Sand", "Coal", "Petroleum Coke",
            "Containers", "Pallets", "Boxes", "Crates", "Bags",
            "Machinery Parts", "Automotive Parts", "Aerospace Components", "Electronics Components", "Construction Materials",
            "Hazardous Waste", "Recyclables", "Waste Paper", "Waste Plastic", "Waste Metal",
            "Live Animals", "Livestock", "Poultry", "Seafood", "Plants",
            "Flowers", "Trees", "Seeds", "Fertilizers", "Pesticides",
            "Textiles", "Fabrics", "Yarn", "Raw Cotton", "Wool",
            "Leather", "Hides", "Furs", "Paper Products", "Books",
            "Magazines", "Newspapers", "Printed Materials", "Office Supplies", "Stationery",
            "Food Products", "Processed Foods", "Canned Goods", "Frozen Foods", "Snack Foods",
            "Beverages", "Juices", "Soft Drinks", "Alcoholic Beverages", "Water",
            "Consumer Goods", "Personal Care Products", "Cosmetics", "Toiletries", "Household Cleaning Products",
            "Raw Materials", "Minerals", "Ores", "Gems", "Precious Metals",
            "Finished Goods", "Manufactured Products", "Industrial Products", "Consumer Products", "Retail Goods"
        };
        return cargoNames[rand.nextInt(cargoNames.length)];
    }

    public String loadTypeGen() {
        final String[] cargoTypes = {
            "Metals", "Gases", "Fuels", "Vehicles", "Machinery", "Agricultural Products", "Food",
            "Beverages", "Pharmaceuticals", "Chemicals", "Paper Products", "Textiles", "Consumer Goods", 
            "Building Materials", "Waste/Recyclables", "Live Cargo", "Raw Materials", "Finished Goods"
        };
        return cargoTypes[rand.nextInt(cargoTypes.length)];
    }

    public String cityGen() {
        final String[] city = {
            "Copenhagen", "Aarhus", "Odense", "Aalborg", "Esbjerg", 
            "Randers", "Kolding", "Horsens", "Vejle", "Roskilde"};

        return city[rand.nextInt(city.length)];
    }


    public String companyGen() {
        final String[] denmarkCompanies = {
            "DSV", "Danske Fragtmænd", "Bring Danmark", "PostNord Danmark", "Bladt Industries",
            "Blue Water Shipping", "Alex Andersen Ølund A/S", "P. Fournaise & Co. A/S", 
            "Thermo-Transit A/S", "DHL Danmark"
        };
        return denmarkCompanies[rand.nextInt(denmarkCompanies.length)];
    }

    public int distanceGen() {
        return rand.nextInt(2000) + 20;
    }

    public int incomeGen() {
        return (rand.nextInt(980) + 20) * 100;
    }

    public String toString() {
        //(weightton, name1, ltype, ttype, tbody, origin, destination, ocompany, dcompany, distance, income, scort) values
        return "(" + weightton + ", \'" + load_name + "\', \'" + ltype + "\', \'" + ttype + "\', \'" + tbody + "\', \'" + 
        origin + "\', \'" + destination + "\', \'" + ocompany + "\', \'" + dcompany + "\', " + distance + ", " + income +
        ", \'" + (scort ? "TRUE" : "FALSE") + "\'),"; 
    }

}
