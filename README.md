# Transport Database and Data Generation

This repository contains a Microsoft SQL Server database schema for managing transport operations, along with a Java application that includes a sample data generator and ORM (Object-Relational Mapping) to populate the database with example data.

## 1. Introduction and Abstract

This project addresses the need for a robust and efficient database system for managing transport logistics. It consists of two main components: a Microsoft SQL Server database schema designed to store information about drivers, trucks, trailers, cargo, and companies; and a Java application that generates sample data and interacts with the database using an ORM. The Java application provides a convenient way to populate the database with realistic test data, facilitating development and testing. This project aims to simplify data management for transport operations and provide a foundation for building more complex transport management systems.

## 2. Clone Repository

To clone this repository, use the following command:

```bash
git clone [Your Repository URL]
```

## 3. Database Tables and Relationships

The database schema consists of the following tables and relationships:

-   **driver:** Stores information about drivers, including their ID, employee ID (eid), name, gender, address, contact number, age, license type, rating, salary, income per kilometer, driving time, skills, and personal picture. The `eid` is the primary key and `id` is a unique key.

-   **truck:** Stores information about trucks, including their plate number (primary key), truck ID (tid), brand, model, trailer information (trailer, trailerid), color, number of axles, horsepower, gear type, kilometers driven, manufacturing year, fuel consumption, and garage location.

-   **trailer:** Stores information about trailers, including their trailer ID (primary key), plate number (foreign key referencing `truck`), garage location, manufacturer, trailer type, body type, weight, maximum weight, manufacturing year, number of axles, length, width, height, and whether it's liftable.

-   **cargo:** Stores information about cargo, including load ID (primary key), weight, name, load type, trailer type, body type, origin, destination, originating company, destination company, deadline, distance, income, and whether it requires an escort. `name1` is a unique key.

-   **company:** Stores information about companies, including their name (name1), company ID (cid, primary key), contact number, city, address (unique key), area, services offered, manager (unique key), and number of employees.

-   **attachtrailer:** A junction table representing the many-to-many relationship between trucks and trailers. It contains `tid`, `plate` (foreign key referencing `truck`), and `trailerid` (foreign key referencing `trailer`).

-   **driving:** A junction table representing the many-to-many relationship between drivers and trucks. It contains `eid` (foreign key referencing `driver`) and `plate` (foreign key referencing `truck`).

-   **loading:** A junction table representing the many-to-many relationship between trailers and cargo. It contains `trailerid` (foreign key referencing `trailer`) and `loadid` (foreign key referencing `cargo`).

-   **hiring:** A junction table representing the many-to-many relationship between drivers and companies. It contains `eid` (foreign key referencing `driver`) and `cid` (foreign key referencing `company`).

The relationships between the tables are enforced using foreign keys and constraints, ensuring data integrity. The `CHECK` constraints on each table enforce data validation rules.

## 4. Running the Java Code

1.  **Set up the database:** Create the database in your Microsoft SQL Server instance using the provided SQL scripts.

2.  **Configure the Java application:** Update the database connection details (URL, username, password) in the Java application's configuration file (e.g., a properties file or configuration class).

3.  **Compile and run the Java code:**

    ```bash
    javac -cp "src/generator.java"
    ```

## 5. License and Contact

This project is licensed under the [MIT License](LICENSE).

For any questions or inquiries, please feel free to contact me at [shahriar.hd@outlook.com](mailto:shahriar.hd@outlook.com).