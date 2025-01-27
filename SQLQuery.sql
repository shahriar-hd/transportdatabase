--create DATABASE TransportDK;

create TABLE driver(
  id int not null,
  eid int identity(10000, 1),
  fname varchar(30) not null,
  lname varchar(30) not null,
  gender varchar(6),
  addr varchar(100),
  number int,
  age tinyint,
  lisence int,
  rating float,
  salery int not null,
  incomepkm float,
  drivetime time,
  skill varchar(13),
  personalpic varbinary(max),
  primary key(eid),
  unique(id),
  check(
	id <= 9999999999 AND
	fname like '__%' AND
	lname like '__%' AND
	gender in ('Male', 'Female') AND
	age >= 18 AND
	age <= 65 AND
	lisence in (1, 2, 3) AND
	rating >= 0.0 AND
	rating <= 5.0 AND
	salery > 0 AND
	incomepkm > 0 AND
	skill in ('Fragile cargo', 'Balanced', 'ADR', 'Long distance', 'Heavy cargo')
  )
)

create TABLE truck(
  plate char(6) not null,
  tid int identity(10000, 1),
  brand varchar(10),
  model varchar(30) not null,
  trailer varchar(30),
  trailerid int,
  color varchar(30),
  axil int not null,
  powerhp int not null,
  gear varchar(30) not null,
  kilometer int,
  manyear int,
  fuelconsumption float,
  garage varchar(30),
  primary key(plate),
  --foreign key(trailerid) References trailer ON delete cascade,
  check(
	plate like '______' AND
	brand in ('Volvo', 'DAF', 'Scania', 'MAN', 'Renault', 'Iveco') AND
	axil >= 2 AND
	powerhp > 100 AND
	kilometer > 0 AND
	manyear >= 2000 AND
	manyear <= 2025 AND
	fuelconsumption > 0
  )
)

create TABLE trailer(
  trailerid int Identity(1, 1000) primary key,
  plate char(6) not null,
  garage varchar(30),
  manufacture varchar(30),
  ttype varchar(30) not null,
  tbody varchar(30) not null,
  weightton float,
  maxweight smallint not null,
  manyear smallint,
  axel tinyint not null,
  lengthm float,
  widthm float,
  hieghtm float,
  lifteable bit,
  foreign key(plate) References truck ON Update Cascade,
  check(
	weightton > 0 AND
	maxweight > 0 AND
	manyear >= 2000 AND
	manyear <= 2025 AND
	axel > 0 AND
	lengthm > 0 AND
	widthm > 0 AND
	hieghtm > 0
  )
)

create TABLE cargo(
  loadid int identity(10000, 1),
  weightton float not null,
  name1 varchar(30) not null,
  ltype varchar(30) not null,
  ttype varchar(10),
  tbody varchar(20) not null,
  origin varchar(20) not null,
  destination varchar(30) not null,
  ocompany varchar(20),
  dcompany varchar(20),
  deadline date,
  distance int,
  income int not null,
  scort bit,
  primary key(loadid),
  unique(name1),
  check(
	weightton > 0 AND
	income > 0
  )
)

create TABLE company(
  name1 varchar(30) not null,
  cid int not null,
  number int,
  city varchar(30) not null,
  addr varchar(100) not null,
  area int,
  servicee varchar(100),
  manager varchar(30),
  employe int,
  primary key(cid),
  unique(addr),
  unique(manager),
  check(
	name1 like '__%' AND
	cid > 10000 AND
	area > 0
  )
)

create TABLE attachtrailer(
	tid int,
	plate char(6),
	trailerid int not null,
	foreign key(plate) References truck ON delete cascade,
	foreign key(trailerid) References trailer ON delete cascade
)

create TABLE driving(
  eid int,
  plate char(6) not null,
  tid int,
  foreign key(eid) References driver ON delete cascade,
  foreign key(plate) References truck ON delete cascade
)

create TABLE loading(
  trailerid int not null,
  loadid int,
  foreign key(trailerid) References trailer ON delete cascade,
  foreign key(loadid) References cargo ON delete cascade
)

create TABLE hiring(
	eid int,
	cid int,
	foreign key(eid) References driver ON delete cascade,
	foreign key(cid) References company ON delete cascade
)


INSERT into driver (id, fname, lname, gender, addr, number, age, lisence, rating, salery, incomepkm, skill) values
(7865194889, 'Martin', 'N?rgaard', 'Male', '25, Mejsevej, DK-269 Aarhus', 045482395232, 60, 2, 2.6938891, 102300, 32.20929, 'Balanced'),      
(5259470335, 'Ole', 'Knudsen', 'Female', '98, Bakkevej, DK-6934 Esbjerg', 045606931186, 50, 1, 1.5151185, 50700, 20.868633, 'Balanced'),      
(7273834895, 'Lukas', 'Johansen', 'Female', '93, Korsgade, DK-7154 Kolding', 045266212710, 18, 2, 3.5808487, 81600, 82.81034, 'Heavy Cargo'), 
(7269539483, 'Emil', 'Lund', 'Female', '46, Slagtergade, DK-7707 Roskilde', 045554780722, 59, 1, 1.2536082, 117200, 29.19922, 'ADR'),
(1655499455, 'Mathias', 'Knudsen', 'Female', '32, Bellisvej, DK-9065 Esbjerg', 045226389230, 53, 2, 3.4022713, 106500, 37.676685, 'Balanced'),
(7255605838, 'Bent', 'Clausen', 'Male', '70, Spurvevej, DK-1788 Roskilde', 045492908528, 58, 1, 0.099821985, 88000, 90.93304, 'Balanced'),    
(6626553171, 'Gustav', 'Mortensen', 'Male', '95, Værftsvej, DK-3124 Randers', 045399271193, 51, 2, 4.428906, 46400, 94.76471, 'ADR'),
(6030016336, 'David', 'Bruun', 'Male', '60, Århusvej, DK-8884 Copenhagen', 045507227172, 39, 1, 0.5937606, 45900, 26.581688, 'Heavy Cargo'),  
(1112169645, 'Frederik', 'Justesen', 'Male', '83, Tværvejen, DK-1416 Aarhus', 045548767579, 53, 2, 4.889827, 4700, 32.62781, 'Heavy Cargo'),
(8718149746, 'Anton', 'Bak', 'Male', '72, R?dhalsvej, DK-441 Aarhus', 045528573904, 18, 1, 1.7586432, 108700, 14.7491, 'Long Distance'),
(8732232507, 'Kurt', 'Thomsen', 'Male', '78, Industrivej, DK-4400 Copenhagen', 045382059499, 51, 1, 1.7550888, 18400, 73.09016, 'Fragile Cargo'),
(6085341876, 'Andreas', 'Bertelsen', 'Male', '24, Skovvejen, DK-1999 Aarhus', 045356830827, 26, 1, 0.21834552, 25600, 77.59636, 'Heavy Cargo'),
(5548324676, 'William', 'J?rgensen', 'Female', '72, Tværvejen, DK-3681 Copenhagen', 045589480904, 56, 2, 1.380536, 115000, 62.430706, 'Fragile Cargo'),
(5380248601, 'Simon', 'Dam', 'Male', '37, Galaksevej, DK-1655 Aalborg', 045614373334, 49, 1, 3.558352, 105500, 22.847723, 'Heavy Cargo'),
(7334508491, 'S?ren', 'Johansen', 'Male', '47, Torvet, DK-569 Esbjerg', 04531752792, 51, 2, 0.40946424, 59100, 98.35702, 'Heavy Cargo'),
(1796669459, 'Jonas', 'Knudsen', 'Female', '45, Cirkelbuen, DK-4761 Horsens', 045544047174, 45, 1, 3.0652409, 6200, 78.90089, 'ADR'),
(8374405101, 'Jens', 'Schmidt', 'Female', '44, Svalegade, DK-3155 Horsens', 045495232880, 51, 2, 1.9882721, 89500, 53.148003, 'Balanced'),
(1073750325, 'Gustav', 'Friis', 'Male', '14, Planetvej, DK-4850 Kolding', 045455318565, 47, 1, 1.7680118, 32800, 60.10517, 'Long Distance'),
(6749851012, 'Allan', 'Overgaard', 'Female', '90, Galaksevej, DK-7402 Aarhus', 045252917798, 56, 2, 0.002655387, 44800, 59.61455, 'Long Distance'),
(0324483387, 'Carl', 'Petersen', 'Female', '72, Karlsvognen, DK-6701 Horsens', 045614547868, 39, 2, 3.5312774, 107600, 99.642136, 'Long Distance'),
(9729323596, 'Jonas', 'Bak', 'Female', '45, Orionsbæltet, DK-814 Roskilde', 045284447045, 58, 1, 3.5692062, 87700, 44.781685, 'Balanced'),
(5998173058, 'Kurt', 'Clausen', 'Female', '53, Mælkevejen, DK-7960 Horsens', 045553967982, 27, 2, 3.8316646, 37200, 61.98501, 'Heavy Cargo'),
(0485411865, 'Magnus', 'Jensen', 'Male', '90, Sydkorset, DK-9688 Odense', 045408683561, 54, 1, 0.48303783, 78600, 23.691242, 'ADR'),
(8659355258, 'Per', 'Henriksen', 'Male', '46, Viborgvej, DK-5322 Odense', 045322461612, 40, 2, 0.30014038, 93000, 93.04149, 'Heavy Cargo'),
(3562273747, 'Peter', 'Bech', 'Male', '9, Nordstjernen, DK-3144 Copenhagen', 045413310817, 58, 1, 1.7319164, 113900, 64.36371, 'Long Distance'),
(8792633856, 'August', 'Jensen', 'Male', '57, ?rnen, DK-8150 Vejle', 045379834188, 36, 2, 0.8820039, 110000, 64.78366, 'Fragile Cargo'),
(2488069816, 'Simon', 'Andersen', 'Male', '73, Cirkelbuen, DK-2515 Esbjerg', 045539176441, 23, 1, 2.4683282, 97100, 18.784801, 'Balanced'),
(3943721706, 'Ole', 'Simonsen', 'Female', '48, Markvejen, DK-1536 Kolding', 045538210175, 43, 2, 1.8226323, 116600, 76.19948, 'Heavy Cargo'),
(5669712409, 'Ole', 'J?rgensen', 'Male', '75, Linde Allé, DK-8401 Aalborg', 045611175132, 30, 1, 2.4616694, 48100, 58.68619, 'Balanced'),
(8238515050, 'Anders', 'Bech', 'Male', '75, Ahornvej, DK-3118 Esbjerg', 045532691308, 26, 2, 4.723767, 70900, 31.559156, 'Heavy Cargo'),
(3647185959, 'Carl', 'Madsen', 'Female', '53, Algade, DK-947 Randers', 045505425713, 32, 1, 3.968383, 32800, 65.35831, 'Balanced'),
(6278584897, 'Lars', 'Holm', 'Female', '4, Brogade, DK-7619 Copenhagen', 045302030207, 23, 1, 2.200944, 84200, 26.830667, 'Fragile Cargo'),
(1092785765, 'Ole', 'Paulsen', 'Female', '64, Mælkevejen, DK-7660 Kolding', 045312203518, 25, 2, 0.07003337, 100400, 42.40598, 'ADR'),
(4565539283, 'Per', 'Overgaard', 'Female', '95, Viborgvej, DK-6973 Kolding', 045554164671, 22, 2, 2.2293856, 6500, 23.131657, 'ADR'),
(0105282528, 'Poul', 'Fabricius', 'Female', '98, Blindgyde, DK-766 Horsens', 045424037791, 47, 2, 4.4130144, 42100, 51.071453, 'Long Distance'),
(2557605626, 'Oscar', 'Brandt', 'Male', '2, Lille Torv, DK-340 Aalborg', 045306889328, 44, 2, 2.785552, 600, 71.28794, 'Balanced'),
(6805777080, 'Hans', 'Hansen', 'Female', '58, Granstien, DK-5189 Aalborg', 045208937694, 54, 2, 1.1042917, 90600, 64.77332, 'Long Distance'),
(6609149879, 'Johannes', 'Graversen', 'Male', '35, Esbjergvej, DK-3847 Aarhus', 045545713692, 53, 2, 0.75155556, 71800, 21.268616, 'Long Distance'),
(6436536707, 'Jan', 'Rasmussen', 'Male', '71, Kometvej, DK-2084 Esbjerg', 045243462117, 57, 1, 4.110663, 99500, 44.724228, 'Long Distance'),
(7740069708, 'Lars', 'Mortensen', 'Female', '15, Stationsvej, DK-9894 Aarhus', 045407624257, 47, 1, 2.245951, 98300, 43.501568, 'ADR')

INSERT into truck (plate, brand, model, trailer, trailerid, color, axil, powerhp, gear, kilometer, manyear, fuelconsumption, garage) values
('48Q244', 'DAF', 'XF105', 'Low Lead', 0, 'Candy Red', 2, 428, 6, 143400, 2004, 43.385956, 'Kolding'),
('93N798', 'Iveco', 'Stralis Space', 'Floor', 0, 'Jamaica Blue', 2, 780, 6, 217594, 2003, 30.162312, 'Vejle'),
('52P954', 'DAF', 'NGD XF', 'Refrigerated', 0, 'Silver', 2, 530, 18, 339755, 2020, 44.233074, 'Copenhagen'),
('85Z721', 'Scania', 'S Series', 'Refrigerated', 1000, 'Electric Orange', 3, 640, 16, 10189, 2005, 46.26288, 'Vejle'),
('64L675', 'Scania', 'R Series', 'Feul Tunk', 1002, 'Rouge Flame', 3, 380, 16, 195202, 2011, 44.170883, 'Esbjerg'),
('53L067', 'Volvo', 'FH5', 'Feul Tunk', 0, 'Candy Red', 2, 460, 18, 457953, 2019, 50.439907, 'Copenhagen'),
('32L684', 'Renault', 'T-Shifter', 'Feul Tunk', 1004, 'Shadow Black', 2, 420, 18, 349107, 2000, 35.27192, 'Copenhagen'),
('53F684', 'Iveco', 'S-Way Space', 'Container', 1006, 'Rouge Flame', 2, 410, 6, 272310, 2003, 57.59471, 'Randers'),
('83F721', 'Scania', 'Streamline', 'Low Lead', 1008, 'Mantis Green', 3, 330, 12, 80787, 2006, 41.567406, 'Roskilde'),
('01O251', 'Iveco', 'S-Way Active', 'Container', 1010, 'Flame Red', 2, 400, 12, 154318, 2008, 34.82769, 'Esbjerg'),
('23Z262', 'Scania', 'Streamline', 'Container', 0, 'Shadow Black', 2, 450, 18, 264733, 2008, 53.739853, 'Randers'),
('62U098', 'Mercedes Banz', 'Axor', 'Food Tunk', 0, 'Yok Yellow', 3, 483, 16, 264524, 2018, 46.81421, 'Odense'),
('89K108', 'Scania', 'Streamline', 'Low Lead', 1011, 'Candy Red', 2, 476, 12, 273238, 2009, 56.77523, 'Roskilde'),
('27M746', 'Mercedes Banz', 'Axor', 'Dumper', 0, 'Sky Blue', 3, 410, 16, 165676, 2018, 46.91523, 'Roskilde'),
('74I264', 'Iveco', 'Stralis Space', 'Live Castel', 1013, 'Olive Green', 2, 780, 18, 492109, 2012, 40.11406, 'Esbjerg'),
('67Z883', 'Mercedes Banz', 'Actros Space', 'Live Castel', 1014, 'Flame Red', 2, 450, 16, 492865, 2008, 34.04505, 'Copenhagen'),
('08Y673', 'DAF', 'NGD Super', 'Low Lead', 1015, 'Red Sunset', 2, 483, 6, 380729, 2004, 31.269392, 'Aalborg'),
('83S848', 'Iveco', 'S-Way Active', 'Refrigerated', 1016, 'Flame Red', 3, 330, 18, 417878, 2015, 42.390923, 'Vejle'),
('65T384', 'Mercedes Banz', 'Actros', 'Live Castel', 0, 'Sky Blue', 2, 380, 18, 380551, 2014, 46.022232, 'Vejle'),
('71K837', 'Renault', 'Magnum', 'Floor', 0, 'Jamaica Blue', 2, 500, 6, 230606, 2011, 42.3133, 'Aarhus'),
('09N676', 'DAF', 'NGD Super', 'Low Lead', 0, 'Mantis Green', 3, 330, 16, 480675, 2007, 30.243225, 'Copenhagen'),
('86O091', 'Volvo', 'FH4', 'Refrigerated', 0, 'Olive Green', 3, 500, 18, 106258, 2003, 36.57535, 'Vejle'),
('92H912', 'Renault', 'Magnum', 'Container', 1018, 'Shadow Black', 3, 440, 18, 378876, 2011, 44.546665, 'Horsens'),
('32W418', 'Iveco', 'Stralis Active', 'Low Lead', 0, 'Navy Blue', 2, 500, 12, 98360, 2009, 30.404787, 'Randers'),
('48O589', 'Iveco', 'S-Way Active', 'Container', 0, 'Electric Orange', 2, 640, 6, 357286, 2001, 53.38822, 'Roskilde'),
('28O398', 'Iveco', 'Stralis Active', 'Floor', 1019, 'White', 2, 483, 12, 270069, 2007, 39.869442, 'Copenhagen'),
('57H502', 'Renault', 'T-Shifter', 'Low Bed', 1021, 'Red Sunset', 2, 420, 18, 190336, 2000, 46.221806, 'Roskilde'),
('66K363', 'Renault', 'T-Sleeper', 'Refrigerated', 1022, 'White', 2, 650, 18, 299684, 2002, 56.106113, 'Aarhus'),
('66S301', 'Scania', 'Streamline', 'Refrigerated', 1024, 'Red Sunset', 2, 420, 6, 171133, 2003, 59.07586, 'Roskilde'),
('01R895', 'Scania', 'R Series', 'Low Lead', 1025, 'Silver', 2, 780, 6, 381674, 2022, 58.243214, 'Horsens'),
('68N711', 'Renault', 'Classic', 'Low Bed', 0, 'Silver', 3, 395, 6, 490843, 2010, 56.17214, 'Horsens'),
('73Z054', 'Renault', 'Classic', 'Floor', 1026, 'Electric Orange', 3, 640, 16, 24210, 2000, 56.964855, 'Aarhus'),
('77H538', 'Volvo', 'FH5', 'Floor', 1027, 'Red Sunset', 3, 510, 16, 161840, 2003, 53.081955, 'Kolding'),
('31Z223', 'Scania', 'Streamline', 'Gas Tunk', 1029, 'Yok Yellow', 3, 520, 18, 473816, 2005, 50.39646, 'Copenhagen'),
('61W620', 'DAF', 'XF105', 'Live Castel', 1030, 'Electric Orange', 2, 640, 16, 41825, 2024, 32.7485, 'Vejle'),
('93O994', 'Iveco', 'S-Way Space', 'Food Tunk', 1031, 'White', 3, 476, 6, 420123, 2006, 31.555529, 'Horsens'),
('79Z639', 'Volvo', 'FH3', 'Gas Tunk', 1032, 'Candy Red', 3, 380, 16, 462714, 2016, 54.594498, 'Horsens'),
('92F133', 'Iveco', 'Stralis Active', 'Low Lead', 0, 'Yok Yellow', 3, 510, 6, 166305, 2001, 50.532974, 'Aalborg'),
('19K221', 'Iveco', 'Stralis Active', 'Low Lead', 1033, 'Navy Blue', 2, 330, 18, 272078, 2018, 58.77109, 'Horsens'),
('80E540', 'Volvo', 'FH5', 'Food Tunk', 1035, 'White', 2, 483, 12, 64107, 2010, 55.36061, 'Esbjerg'),
('61Z706', 'Scania', 'R Series', 'Low Bed', 1037, 'Sky Blue', 2, 780, 6, 229747, 2015, 48.434135, 'Esbjerg'),
('21M986', 'DAF', 'NGD XF', 'Floor', 0, 'Yok Yellow', 3, 650, 6, 338003, 2012, 33.044388, 'Vejle'),
('13R467', 'Scania', 'S Series', 'Gas Tunk', 1038, 'Sky Blue', 2, 750, 18, 280273, 2024, 51.899704, 'Aarhus'),
('28Z272', 'DAF', 'NGD XF Aero', 'Gas Tunk', 0, 'Shadow Black', 2, 330, 12, 293815, 2003, 55.898705, 'Copenhagen'),
('97S755', 'Renault', 'Classic', 'Live Castel', 0, 'Jamaica Blue', 2, 780, 16, 116737, 2017, 46.144653, 'Aarhus'),
('29B363', 'Scania', 'Streamline', 'Food Tunk', 0, 'Flame Red', 3, 330, 6, 70655, 2011, 44.948673, 'Aalborg'),
('69T695', 'Scania', 'R Series', 'Refrigerated', 0, 'Flame Red', 3, 420, 16, 189851, 2021, 44.220097, 'Vejle'),
('01O308', 'Renault', 'T-Shifter', 'Container', 0, 'Red Sunset', 3, 540, 16, 492172, 2023, 57.792854, 'Esbjerg'),
('55R726', 'Mercedes Banz', 'Actros', 'Food Tunk', 1039, 'Candy Red', 3, 770, 18, 493044, 2012, 54.695026, 'Odense'),
('57O146', 'Scania', 'Streamline', 'Live Castel', 0, 'Mantis Green', 2, 449, 18, 23303, 2007, 30.135012, 'Copenhagen'),
('46A215', 'Mercedes Banz', 'Actros', 'Food Tunk', 1041, 'Red Sunset', 2, 440, 18, 77200, 2017, 49.80052, 'Kolding'),
('56R615', 'Iveco', 'S-Way Space', 'Floor', 0, 'Shadow Black', 3, 428, 6, 477230, 2018, 50.87723, 'Odense'),
('01V952', 'Mercedes Banz', 'Actros Plus', 'Refrigerated', 1043, 'Yok Yellow', 3, 540, 18, 7468, 2004, 56.41359, 'Randers'),
('54V227', 'Renault', 'T-Shifter', 'Low Lead', 1044, 'Stream Blue', 3, 510, 18, 85040, 2011, 37.068733, 'Randers'),
('70S198', 'DAF', 'NGD XF', 'Feul Tunk', 0, 'Navy Blue', 2, 400, 12, 147782, 2017, 59.34088, 'Roskilde'),
('12V494', 'Iveco', 'S-Way Space', 'Low Bed', 0, 'White', 3, 428, 18, 152409, 2015, 37.624523, 'Aarhus'),
('72C373', 'Volvo', 'FH5', 'Gas Tunk', 1046, 'Candy Red', 3, 650, 18, 136262, 2019, 35.276604, 'Aarhus'),
('40F746', 'Mercedes Banz', 'Axor', 'Refrigerated', 0, 'Shadow Black', 3, 449, 18, 39254, 2008, 41.87066, 'Aarhus'),
('40K737', 'Renault', 'T-Shifter', 'Floor', 0, 'Olive Green', 3, 450, 12, 106552, 2013, 54.950134, 'Esbjerg'),
('09N771', 'Scania', 'Streamline', 'Floor', 1048, 'Electric Orange', 3, 480, 6, 58104, 2006, 57.386486, 'Aalborg'),
('33K596', 'Renault', 'T-Shifter', 'Feul Tunk', 1049, 'Rouge Flame', 2, 460, 16, 137480, 2012, 32.29509, 'Esbjerg')

INSERT into trailer (plate, garage, manufacture, ttype, tbody, weightton, maxweight, manyear, axel, lengthm, widthm, hieghtm, lifteable) values
('85Z721', 'Esbjerg', 'Schmitz Cargobull', 'Refrigerated', 'Double', 11, 31, 2018, 8, 22.7, 2.51, 2.65, 'FALSE'),
('64L675', 'Randers', 'Goldhofer', 'Feul Tunk', 'Double', 7, 34, 2005, 8, 13.62, 2.47, 3.65, 'FALSE'),
('64L675', 'Horsens', 'Krone', 'Feul Tunk', 'Double', 5, 50, 2006, 4, 22.7, 2.47, 3.07, 'FALSE'),
('32L684', 'Aalborg', 'Krone', 'Feul Tunk', 'Double', 7, 18, 2019, 9, 22.7, 2.3, 2.65, 'FALSE'),
('32L684', 'Vejle', 'Faymonville', 'Feul Tunk', 'Double', 7, 15, 2015, 6, 11.9, 2.55, 2.65, 'FALSE'),
('53F684', 'Aarhus', 'Faymonville', 'Container', 'Single', 15, 38, 2012, 10, 16.4, 2.3, 3.6, 'FALSE'),
('53F684', 'Vejle', 'Kögel', 'Container', 'Single', 10, 21, 2002, 8, 13.62, 2.55, 2.79, 'FALSE'),
('83F721', 'Aalborg', 'Faymonville', 'Low Lead', 'Double', 4, 50, 2024, 8, 18.1, 2.51, 2.65, 'FALSE'),
('83F721', 'Odense', 'Faymonville', 'Low Lead', 'Single', 8, 33, 2005, 9, 18.1, 2.48, 2.65, 'FALSE'),
('01O251', 'Esbjerg', 'Krone', 'Container', 'Single', 6, 42, 2012, 10, 18.1, 2.48, 3.6, 'FALSE'),
('01O251', 'Aarhus', 'Kögel', 'Container', 'Double', 15, 10, 2020, 2, 16.4, 2.55, 2.65, 'FALSE'),
('89K108', 'Aarhus', 'Schmitz Cargobull', 'Low Lead', 'Double', 12, 27, 2019, 9, 13.31, 2.55, 2.65, 'FALSE'),
('74I264', 'Aarhus', 'Kögel', 'Live Castel', 'Single', 7, 12, 2019, 9, 22.7, 2.51, 2.65, 'FALSE'),
('74I264', 'Kolding', 'Faymonville', 'Live Castel', 'Single', 6, 30, 2007, 6, 13.31, 2.55, 3.6, 'FALSE'),
('67Z883', 'Roskilde', 'Faymonville', 'Live Castel', 'Double', 5, 43, 2006, 8, 16.4, 2.47, 2.65, 'FALSE'),
('08Y673', 'Aalborg', 'Goldhofer', 'Low Lead', 'Double', 15, 50, 2016, 6, 13.62, 2.3, 3.6, 'FALSE'),
('83S848', 'Esbjerg', 'Faymonville', 'Refrigerated', 'Single', 15, 30, 2002, 9, 13.62, 2.47, 3.65, 'FALSE'),
('92H912', 'Roskilde', 'Krone', 'Container', 'Single', 3, 10, 2008, 7, 13.31, 2.3, 3.6, 'FALSE'),
('92H912', 'Kolding', 'Krone', 'Container', 'Single', 15, 16, 2011, 10, 18.1, 2.55, 2.65, 'FALSE'),
('28O398', 'Horsens', 'Goldhofer', 'Floor', 'Double', 14, 38, 2019, 4, 18.1, 2.47, 3.65, 'FALSE'),
('57H502', 'Vejle', 'Kögel', 'Low Bed', 'Single', 13, 28, 2008, 6, 16.4, 2.51, 3.6, 'FALSE'),
('57H502', 'Aalborg', 'Schmitz Cargobull', 'Low Bed', 'Single', 6, 30, 2022, 7, 22.7, 2.3, 3.07, 'FALSE'),
('66K363', 'Horsens', 'Kögel', 'Refrigerated', 'Double', 9, 43, 2008, 7, 12.04, 2.3, 2.79, 'FALSE'),
('66S301', 'Kolding', 'Faymonville', 'Refrigerated', 'Double', 11, 34, 2008, 4, 13.31, 2.55, 3.6, 'FALSE'),
('66S301', 'Kolding', 'Kögel', 'Refrigerated', 'Single', 13, 40, 2003, 7, 13.62, 2.55, 3.07, 'FALSE'),
('01R895', 'Horsens', 'Goldhofer', 'Low Lead', 'Single', 9, 41, 2000, 7, 13.62, 2.47, 3.6, 'FALSE'),
('73Z054', 'Copenhagen', 'Goldhofer', 'Floor', 'Single', 6, 11, 2018, 3, 22.7, 2.48, 3.65, 'FALSE'),
('77H538', 'Horsens', 'Faymonville', 'Floor', 'Double', 9, 24, 2017, 5, 12.04, 2.51, 3.6, 'FALSE'),
('31Z223', 'Esbjerg', 'Faymonville', 'Gas Tunk', 'Single', 4, 32, 2009, 3, 18.1, 2.51, 3.07, 'FALSE'),
('31Z223', 'Aarhus', 'Krone', 'Gas Tunk', 'Double', 6, 10, 2012, 5, 16.4, 2.48, 2.79, 'FALSE'),
('61W620', 'Odense', 'Kögel', 'Live Castel', 'Double', 4, 50, 2007, 4, 13.31, 2.51, 2.79, 'FALSE'),
('93O994', 'Esbjerg', 'Krone', 'Food Tunk', 'Single', 15, 21, 2007, 2, 12.04, 2.51, 2.65, 'FALSE'),
('79Z639', 'Aarhus', 'Kögel', 'Gas Tunk', 'Single', 6, 41, 2015, 3, 11.9, 2.55, 2.65, 'FALSE'),
('19K221', 'Randers', 'Faymonville', 'Low Lead', 'Single', 13, 45, 2010, 2, 11.9, 2.51, 3.07, 'FALSE'),
('80E540', 'Vejle', 'Faymonville', 'Food Tunk', 'Single', 9, 36, 2010, 10, 13.31, 2.47, 2.79, 'FALSE'),
('80E540', 'Esbjerg', 'Krone', 'Food Tunk', 'Single', 3, 47, 2005, 9, 13.31, 2.55, 2.79, 'FALSE'),
('61Z706', 'Randers', 'Schmitz Cargobull', 'Low Bed', 'Double', 8, 11, 2004, 8, 12.04, 2.3, 3.07, 'FALSE'),
('61Z706', 'Aarhus', 'Goldhofer', 'Low Bed', 'Double', 14, 49, 2001, 2, 11.9, 2.3, 3.65, 'FALSE'),
('13R467', 'Copenhagen', 'Faymonville', 'Gas Tunk', 'Double', 3, 44, 2005, 4, 16.4, 2.51, 2.65, 'FALSE'),
('55R726', 'Randers', 'Schmitz Cargobull', 'Food Tunk', 'Double', 11, 40, 2022, 8, 18.1, 2.3, 2.65, 'FALSE'),
('46A215', 'Aarhus', 'Goldhofer', 'Food Tunk', 'Single', 10, 31, 2021, 4, 12.04, 2.3, 3.07, 'FALSE'),
('46A215', 'Odense', 'Faymonville', 'Food Tunk', 'Single', 4, 14, 2006, 9, 13.31, 2.51, 2.65, 'FALSE'),
('01V952', 'Esbjerg', 'Krone', 'Refrigerated', 'Double', 11, 38, 2017, 8, 22.7, 2.51, 2.79, 'FALSE'),
('01V952', 'Odense', 'Goldhofer', 'Refrigerated', 'Single', 13, 25, 2002, 3, 12.04, 2.47, 3.65, 'FALSE'),
('54V227', 'Odense', 'Goldhofer', 'Low Lead', 'Single', 3, 48, 2018, 2, 18.1, 2.3, 2.79, 'FALSE'),
('72C373', 'Aalborg', 'Kögel', 'Gas Tunk', 'Double', 7, 25, 2018, 5, 13.31, 2.48, 3.6, 'FALSE'),
('72C373', 'Roskilde', 'Faymonville', 'Gas Tunk', 'Double', 10, 25, 2001, 6, 13.31, 2.48, 3.6, 'FALSE'),
('09N771', 'Aarhus', 'Faymonville', 'Floor', 'Double', 9, 32, 2022, 2, 13.62, 2.55, 2.65, 'FALSE'),
('09N771', 'Aalborg', 'Kögel', 'Floor', 'Single', 13, 10, 2022, 5, 18.1, 2.48, 2.65, 'FALSE'),
('33K596', 'Copenhagen', 'Kögel', 'Feul Tunk', 'Single', 7, 23, 2008, 2, 18.1, 2.3, 2.65, 'FALSE')

INSERT into cargo (weightton, name1, ltype, ttype, tbody, origin, destination, ocompany, dcompany, distance, income, scort) values
(43, 'Magazines', 'Waste/Recyclables', 'Refrigerated', 'Double', 'Horsens', 'Vejle', 'PostNord Danmark', 'PostNord Danmark', 763, 91000, 'TRUE'),
(25, 'Meat', 'Finished Goods', 'Feul Tunk', 'Double', 'Horsens', 'Odense', 'Danske Fragtmænd', 'DSV', 481, 89600, 'FALSE'),
(4, 'Beverages', 'Beverages', 'Feul Tunk', 'Double', 'Aarhus', 'Vejle', 'P. Fournaise & Co. A/S', 'PostNord Danmark', 1427, 93300, 'TRUE'),
(42, 'Chemicals', 'Fuels', 'Feul Tunk', 'Double', 'Randers', 'Roskilde', 'Danske Fragtmænd', 'DSV', 1822, 46200, 'TRUE'),
(13, 'Gasoline', 'Gases', 'Feul Tunk', 'Double', 'Copenhagen', 'Vejle', 'PostNord Danmark', 'DHL Danmark', 74, 49700, 'TRUE'),
(16, 'Soft Drinks', 'Metals', 'Feul Tunk', 'Double', 'Aarhus', 'Roskilde', 'Blue Water Shipping', 'Bladt Industries', 1984, 23800, 'TRUE'),
(47, 'Machinery Parts', 'Fuels', 'Container', 'Single', 'Roskilde', 'Randers', 'Thermo-Transit A/S', 'Thermo-Transit A/S', 1565, 91200, 'TRUE'),
(40, 'Alcoholic Beverages', 'Beverages', 'Container', 'Single', 'Odense', 'Aalborg', 'Alex Andersen ?lund A/S', 'Danske Fragtmænd', 49, 54500, 'TRUE'),
(20, 'Rice', 'Finished Goods', 'Container', 'Single', 'Kolding', 'Kolding', 'Alex Andersen ?lund A/S', 'Bladt Industries', 242, 79300, 'TRUE'),
(38, 'Poultry', 'Textiles', 'Low Lead', 'Double', 'Esbjerg', 'Vejle', 'Blue Water Shipping', 'P. Fournaise & Co. A/S', 25, 66400, 'FALSE'),
(47, 'Consumer Products', 'Food', 'Low Lead', 'Double', 'Esbjerg', 'Copenhagen', 'PostNord Danmark', 'P. Fournaise & Co. A/S', 1649, 87100, 'FALSE'),
(29, 'Paper Products', 'Waste/Recyclables', 'Container', 'Single', 'Kolding', 'Kolding', 'P. Fournaise & Co. A/S', 'Danske Fragtmænd', 1423, 80300, 'TRUE'),
(10, 'Textiles', 'Pharmaceuticals', 'Container', 'Single', 'Aalborg', 'Roskilde', 'Blue Water Shipping', 'Blue Water Shipping', 41, 42400, 'TRUE'),
(36, 'Meat', 'Pharmaceuticals', 'Container', 'Single', 'Esbjerg', 'Horsens', 'PostNord Danmark', 'Thermo-Transit A/S', 1007, 75600, 'TRUE'),
(4, 'Household Goods', 'Chemicals', 'Container', 'Single', 'Roskilde', 'Aarhus', 'Bladt Industries', 'DHL Danmark', 1348, 61300, 'FALSE'),
(27, 'Coal', 'Beverages', 'Low Lead', 'Double', 'Kolding', 'Copenhagen', 'Danske Fragtmænd', 'Bring Danmark', 936, 33100, 'FALSE'),
(20, 'Books', 'Chemicals', 'Low Lead', 'Double', 'Vejle', 'Vejle', 'DSV', 'Bring Danmark', 1402, 10700, 'TRUE'),
(22, 'Petroleum Coke', 'Agricultural Products', 'Low Lead', 'Double', 'Vejle', 'Randers', 'PostNord Danmark', 'PostNord Danmark', 958, 79200, 'TRUE'),
(20, 'Stationery', 'Chemicals', 'Live Castel', 'Single', 'Copenhagen', 'Roskilde', 'Thermo-Transit A/S', 'DSV', 467, 15800, 'TRUE'),
(34, 'Fish', 'Paper Products', 'Live Castel', 'Single', 'Randers', 'Aalborg', 'P. Fournaise & Co. A/S', 'Thermo-Transit A/S', 1987, 67800, 'FALSE'),
(33, 'Vegetables', 'Metals', 'Live Castel', 'Single', 'Copenhagen', 'Esbjerg', 'P. Fournaise & Co. A/S', 'Thermo-Transit A/S', 164, 68700, 'FALSE'),
(20, 'Diesel Fuel', 'Live Cargo', 'Low Lead', 'Double', 'Copenhagen', 'Copenhagen', 'Bladt Industries', 'Danske Fragtmænd', 479, 83800, 'FALSE'),
(23, 'Propane', 'Chemicals', 'Low Lead', 'Double', 'Roskilde', 'Vejle', 'Bladt Industries', 'Bladt Industries', 1457, 21200, 'TRUE'),
(17, 'Live Animals', 'Chemicals', 'Low Lead', 'Double', 'Roskilde', 'Kolding', 'Danske Fragtmænd', 'Blue Water Shipping', 1810, 89000, 'FALSE'),
(1, 'Automotive Parts', 'Finished Goods', 'Low Lead', 'Double', 'Roskilde', 'Roskilde', 'Blue Water Shipping', 'Danske Fragtmænd', 1005, 31500, 'TRUE'),
(49, 'Personal Care Products', 'Finished Goods', 'Refrigerated', 'Single', 'Aarhus', 'Aarhus', 'Thermo-Transit A/S', 'Thermo-Transit A/S', 1128, 53800, 'FALSE'),
(14, 'Poultry', 'Food', 'Refrigerated', 'Single', 'Esbjerg', 'Esbjerg', 'P. Fournaise & Co. A/S', 'Bring Danmark', 324, 39600, 'FALSE'),
(17, 'Propane', 'Food', 'Container', 'Single', 'Randers', 'Esbjerg', 'Alex Andersen ?lund A/S', 'PostNord Danmark', 1405, 65600, 'FALSE'),
(18, 'Petroleum Coke', 'Beverages', 'Container', 'Single', 'Kolding', 'Horsens', 'PostNord Danmark', 'Alex Andersen ?lund A/S', 1252, 16700, 'FALSE'),
(19, 'Shoes', 'Finished Goods', 'Container', 'Single', 'Odense', 'Aarhus', 'Danske Fragtmænd', 'Danske Fragtmænd', 197, 39600, 'TRUE'),
(25, 'Printing Materials', 'Vehicles', 'Container', 'Single', 'Kolding', 'Odense', 'Alex Andersen ?lund A/S', 'DHL Danmark', 951, 69400, 'FALSE'),
(23, 'Stone', 'Consumer Goods', 'Container', 'Single', 'Horsens', 'Horsens', 'Thermo-Transit A/S', 'Blue Water Shipping', 1828, 88100, 'TRUE'),
(5, 'Textiles', 'Machinery', 'Container', 'Single', 'Copenhagen', 'Copenhagen', 'Blue Water Shipping', 'DSV', 912, 91400, 'FALSE'),
(9, 'Textiles', 'Textiles', 'Container', 'Single', 'Odense', 'Copenhagen', 'Blue Water Shipping', 'DHL Danmark', 1366, 80700, 'FALSE'),
(24, 'Textiles', 'Consumer Goods', 'Floor', 'Double', 'Roskilde', 'Kolding', 'Thermo-Transit A/S', 'Thermo-Transit A/S', 1157, 3900, 'TRUE'),
(14, 'Cosmetics', 'Waste/Recyclables', 'Floor', 'Double', 'Vejle', 'Aarhus', 'Thermo-Transit A/S', 'Bring Danmark', 75, 3100, 'FALSE'),
(43, 'Soft Drinks', 'Beverages', 'Low Bed', 'Single', 'Aalborg', 'Esbjerg', 'Thermo-Transit A/S', 'Alex Andersen ?lund A/S', 889, 53900, 'TRUE'),
(1, 'Furs', 'Machinery', 'Low Bed', 'Single', 'Copenhagen', 'Odense', 'Bring Danmark', 'DSV', 1743, 13100, 'FALSE'),
(6, 'LPG (Liquefied Petroleum Gas)', 'Building Materials', 'Low Bed', 'Single', 'Roskilde', 'Vejle', 'PostNord Danmark', 'Blue Water Shipping', 1603, 24400, 'FALSE'),
(21, 'Construction Equipment', 'Agricultural Products', 'Low Bed', 'Single', 'Copenhagen', 'Horsens', 'DSV', 'DSV', 180, 46700, 'FALSE'),
(41, 'Containers', 'Pharmaceuticals', 'Refrigerated', 'Single', 'Odense', 'Vejle', 'Bladt Industries', 'Bring Danmark', 38, 62100, 'FALSE'),
(41, 'Pallets', 'Waste/Recyclables', 'Refrigerated', 'Single', 'Horsens', 'Copenhagen', 'Bring Danmark', 'Danske Fragtmænd', 847, 42400, 'FALSE'),
(3, 'Poultry', 'Machinery', 'Refrigerated', 'Single', 'Horsens', 'Randers', 'PostNord Danmark', 'DSV', 1451, 13500, 'FALSE'),
(7, 'Manufactured Products', 'Beverages', 'Low Lead', 'Single', 'Kolding', 'Aarhus', 'P. Fournaise & Co. A/S', 'Thermo-Transit A/S', 464, 13700, 'FALSE'),
(19, 'Paper Products', 'Waste/Recyclables', 'Floor', 'Single', 'Vejle', 'Vejle', 'Blue Water Shipping', 'DHL Danmark', 752, 4600, 'FALSE'),
(14, 'Consumer Goods', 'Agricultural Products', 'Floor', 'Single', 'Aalborg', 'Copenhagen', 'Danske Fragtmænd', 'DHL Danmark', 1270, 23800, 'TRUE'),
(39, 'Iron Ore', 'Machinery', 'Floor', 'Single', 'Randers', 'Roskilde', 'PostNord Danmark', 'Alex Andersen ?lund A/S', 111, 2000, 'TRUE'),
(4, 'Televisions', 'Pharmaceuticals', 'Floor', 'Single', 'Aalborg', 'Randers', 'Thermo-Transit A/S', 'Blue Water Shipping', 885, 11900, 'FALSE'),
(27, 'Pesticides', 'Fuels', 'Gas Tunk', 'Single', 'Esbjerg', 'Copenhagen', 'Bring Danmark', 'Blue Water Shipping', 1470, 39300, 'TRUE'),
(11, 'Building Materials', 'Machinery', 'Live Castel', 'Double', 'Vejle', 'Odense', 'PostNord Danmark', 'Bring Danmark', 1237, 45400, 'FALSE'),
(11, 'Lumber', 'Food', 'Live Castel', 'Double', 'Aalborg', 'Esbjerg', 'DHL Danmark', 'DHL Danmark', 1440, 89600, 'TRUE'),
(32, 'Newspapers', 'Fuels', 'Live Castel', 'Double', 'Vejle', 'Copenhagen', 'Bladt Industries', 'Danske Fragtmænd', 1598, 85600, 'TRUE'),
(42, 'Magazines', 'Fuels', 'Food Tunk', 'Single', 'Vejle', 'Aalborg', 'Danske Fragtmænd', 'Thermo-Transit A/S', 832, 51000, 'FALSE'),
(40, 'Industrial Products', 'Chemicals', 'Food Tunk', 'Single', 'Aarhus', 'Aarhus', 'Blue Water Shipping', 'DHL Danmark', 1594, 24800, 'TRUE'),
(40, 'Livestock', 'Finished Goods', 'Low Lead', 'Single', 'Aarhus', 'Copenhagen', 'Bladt Industries', 'Danske Fragtmænd', 346, 93500, 'FALSE'),
(18, 'Vans', 'Machinery', 'Low Lead', 'Single', 'Kolding', 'Aarhus', 'Blue Water Shipping', 'Alex Andersen ?lund A/S', 769, 42400, 'TRUE'),
(1, 'Leather', 'Textiles', 'Low Lead', 'Single', 'Roskilde', 'Aalborg', 'Alex Andersen ?lund A/S', 'Blue Water Shipping', 1283, 85500, 'TRUE'),
(44, 'Copper Wire', 'Food', 'Low Lead', 'Single', 'Odense', 'Kolding', 'Blue Water Shipping', 'PostNord Danmark', 1749, 13100, 'TRUE'),
(14, 'Electronics', 'Live Cargo', 'Food Tunk', 'Single', 'Aarhus', 'Aarhus', 'Thermo-Transit A/S', 'DSV', 1123, 3600, 'TRUE'),
(18, 'Beverages', 'Raw Materials', 'Food Tunk', 'Single', 'Roskilde', 'Horsens', 'Bladt Industries', 'Alex Andersen ?lund A/S', 2014, 68400, 'TRUE'),
(5, 'Corn', 'Gases', 'Food Tunk', 'Single', 'Aalborg', 'Kolding', 'P. Fournaise & Co. A/S', 'Blue Water Shipping', 1063, 46500, 'FALSE'),
(3, 'Aerospace Components', 'Textiles', 'Food Tunk', 'Single', 'Odense', 'Kolding', 'DSV', 'Bladt Industries', 1334, 18200, 'FALSE'),
(43, 'Paper Products', 'Vehicles', 'Low Bed', 'Double', 'Roskilde', 'Randers', 'DHL Danmark', 'DHL Danmark', 717, 76800, 'TRUE'),
(36, 'Sand', 'Machinery', 'Low Bed', 'Double', 'Aarhus', 'Odense', 'Thermo-Transit A/S', 'Blue Water Shipping', 1834, 56600, 'TRUE'),
(17, 'Industrial Products', 'Fuels', 'Food Tunk', 'Double', 'Horsens', 'Randers', 'DSV', 'DSV', 1534, 60600, 'FALSE'),
(38, 'Furs', 'Gases', 'Food Tunk', 'Double', 'Roskilde', 'Roskilde', 'PostNord Danmark', 'DSV', 1477, 52500, 'TRUE'),
(28, 'Paper Products', 'Finished Goods', 'Food Tunk', 'Double', 'Vejle', 'Kolding', 'DSV', 'Blue Water Shipping', 240, 30400, 'TRUE'),
(26, 'Canned Goods', 'Live Cargo', 'Food Tunk', 'Double', 'Copenhagen', 'Kolding', 'PostNord Danmark', 'Bladt Industries', 1626, 68800, 'FALSE'),
(38, 'Agricultural Machinery', 'Fuels', 'Food Tunk', 'Single', 'Kolding', 'Aalborg', 'DSV', 'Alex Andersen ?lund A/S', 716, 67000, 'FALSE'),
(7, 'Waste Metal', 'Agricultural Products', 'Food Tunk', 'Single', 'Aarhus', 'Randers', 'Bring Danmark', 'DSV', 904, 44100, 'TRUE'),
(14, 'Pesticides', 'Chemicals', 'Food Tunk', 'Single', 'Esbjerg', 'Aarhus', 'Bring Danmark', 'DHL Danmark', 1294, 6900, 'TRUE'),
(13, 'Electronics', 'Pharmaceuticals', 'Refrigerated', 'Single', 'Aarhus', 'Copenhagen', 'PostNord Danmark', 'P. Fournaise & Co. A/S', 405, 64500, 'TRUE'),
(50, 'Toiletries', 'Fuels', 'Gas Tunk', 'Double', 'Kolding', 'Roskilde', 'Bring Danmark', 'Bladt Industries', 323, 46300, 'FALSE'),
(18, 'Furniture', 'Live Cargo', 'Gas Tunk', 'Double', 'Odense', 'Roskilde', 'DSV', 'PostNord Danmark', 1813, 91100, 'TRUE'),
(23, 'Rice', 'Textiles', 'Gas Tunk', 'Double', 'Copenhagen', 'Esbjerg', 'Blue Water Shipping', 'DHL Danmark', 348, 23600, 'TRUE'),
(23, 'Leather', 'Building Materials', 'Gas Tunk', 'Double', 'Randers', 'Copenhagen', 'Thermo-Transit A/S', 'Danske Fragtmænd', 215, 67400, 'TRUE'),
(42, 'Cardboard', 'Paper Products', 'Gas Tunk', 'Double', 'Esbjerg', 'Aarhus', 'Blue Water Shipping', 'Thermo-Transit A/S', 1075, 22000, 'FALSE'),
(46, 'Plastics', 'Gases', 'Gas Tunk', 'Double', 'Odense', 'Copenhagen', 'Thermo-Transit A/S', 'Bladt Industries', 535, 61200, 'FALSE'),
(33, 'Fertilizers', 'Paper Products', 'Floor', 'Double', 'Aarhus', 'Esbjerg', 'P. Fournaise & Co. A/S', 'Thermo-Transit A/S', 992, 21000, 'TRUE'),
(35, 'Wool', 'Finished Goods', 'Floor', 'Double', 'Aarhus', 'Aalborg', 'PostNord Danmark', 'Danske Fragtmænd', 689, 96300, 'FALSE'),
(37, 'Computers', 'Finished Goods', 'Floor', 'Double', 'Kolding', 'Kolding', 'P. Fournaise & Co. A/S', 'Bladt Industries', 545, 44000, 'FALSE'),
(49, 'Machinery Parts', 'Waste/Recyclables', 'Floor', 'Single', 'Aarhus', 'Kolding', 'DSV', 'Thermo-Transit A/S', 991, 58500, 'TRUE'),
(48, 'Vans', 'Paper Products', 'Floor', 'Single', 'Aalborg', 'Copenhagen', 'DHL Danmark', 'Alex Andersen ?lund A/S', 1315, 8800, 'FALSE'),
(30, 'Waste Paper', 'Waste/Recyclables', 'Floor', 'Single', 'Horsens', 'Roskilde', 'P. Fournaise & Co. A/S', 'Danske Fragtmænd', 1244, 76700, 'FALSE'),
(13, 'Bags', 'Metals', 'Feul Tunk', 'Single', 'Aarhus', 'Esbjerg', 'Bring Danmark', 'P. Fournaise & Co. A/S', 676, 70000, 'FALSE'),
(31, 'Fruits', 'Beverages', 'Feul Tunk', 'Single', 'Roskilde', 'Kolding', 'PostNord Danmark', 'PostNord Danmark', 1871, 60000, 'TRUE')

INSERT into company (name1, cid, number, city, addr, area, servicee, manager, employe) values
('Thermo-Transit A/S', 72069, 'Aarhus', '12, Hovedgaden', 18500, 'Supply Chain Management', 'Allan Kristensen', 321),
('DSV', 51025, 'Aalborg', '37, Birkevej', 2500, 'Parcel Delivery', 'S?ren Schmidt', 402),
('DSV', 60446, 'Horsens', '7, Pile Allé', 12000, 'Heavy Transport', 'Jens Olsen', 225),
('Bring Danmark', 94597, 'Kolding', '79, Linde Allé', 13500, 'Shipping', 'Benjamin N?rgaard', 254),
('Bring Danmark', 54882, 'Aalborg', '70, Havnegade', 8000, 'Logistics', 'Frederik N?rgaard', 304),
('Danske Fragtmænd', 17033, 'Esbjerg', '66, B?gevej', 21000, 'Heavy Transport', 'Finn Knudsen', 517),
('Alex Andersen ?lund A/S', 80888, 'Kolding', '5, Mejsevej', 2000, 'Heavy Transport', 'Magnus Knudsen', 442),
('PostNord Danmark', 71396, 'Kolding', '72, Stationsvej', 22000, 'Temperature-Controlled Transport', 'Victor Henriksen', 169),
('Blue Water Shipping', 99087, 'Copenhagen', '96, N?rregade', 15000, 'Temperature-Controlled Transport', 'Andreas Lund', 485),
('P. Fournaise & Co. A/S', 79311, 'Esbjerg', '98, Tulipanvej', 13000, 'Parcel Delivery', 'Niels Henriksen', 519)

INSERT into driving values
(10000, '48Q244', 10000),
(10000, '93N798', 10001),

(10001, '52P954', 10002),
(10001, '85Z721', 10003),

(10002, '64L675', 10004),
(10002, '53L067', 10005),

(10003, '32L684', 10006),

(10004, '53F684', 10007),
(10004, '83F721', 10008),

(10005, '01O251', 10009),
(10005, '23Z262', 10010),

(10006, '62U098', 10011),
(10006, '89K108', 10012),

(10007, '27M746', 10013),

(10008, '74I264', 10014),
(10008, '67Z883', 10015),

(10009, '08Y673', 10016),
(10009, '83S848', 10017),

(10010, '65T384', 10018),
(10010, '71K837', 10019),

(10011, '09N676', 10020),

(10012, '86O091', 10021),
(10012, '92H912', 10022),

(10013, '32W418', 10023),

(10014, '48O589', 10024),
(10014, '28O398', 10025),

(10015, '57H502', 10026),
(10015, '66K363', 10027),

(10016, '66S301', 10028),

(10017, '01R895', 10029),

(10018, '68N711', 10030),

(10019, '73Z054', 10031),

(10020, '77H538', 10032),
(10020, '31Z223', 10033),

(10021, '61W620', 10034),

(10022, '93O994', 10035),
(10022, '79Z639', 10036),

(10023, '92F133', 10037),

(10024, '19K221', 10038),

(10025, '80E540', 10039),
(10025, '61Z706', 10040),

(10026, '21M986', 10041),

(10027, '13R467', 10042),

(10028, '28Z272', 10043),
(10028, '97S755', 10044),

(10029, '29B363', 10045),
(10029, '69T695', 10046),

(10030, '01O308', 10047),
(10030, '55R726', 10048),

(10031, '57O146', 10049),

(10032, '46A215', 10050),

(10033, '56R615', 10051),
(10033, '01V952', 10052),

(10034, '54V227', 10053),
(10034, '70S198', 10054),

(10035, '12V494', 10055),
(10035, '72C373', 10056),

(10036, '40F746', 10057),

(10037, '40K737', 10058),

(10038, '09N771', 10059),

(10039, '33K596', 10060)


INSERT into attachtrailer values



(10003, '85Z721', 1000),

(10004, '64L675', 1001),
(10004, '64L675', 1002),


(10006, '32L684', 1003),
(10006, '32L684', 1004),

(10007, '53F684', 1005),
(10007, '53F684', 1006),

(10008, '83F721', 1007),
(10008, '83F721', 1008),

(10009, '01O251', 1009),
(10009, '01O251', 1010),



(10012, '89K108', 1011),


(10014, '74I264', 1012),
(10014, '74I264', 1013),

(10015, '67Z883', 1014),

(10016, '08Y673', 1015),

(10017, '83S848', 1016),





(10022, '92H912', 1017),
(10022, '92H912', 1018),



(10025, '28O398', 1019),

(10026, '57H502', 1020),
(10026, '57H502', 1021),

(10027, '66K363', 1022),

(10028, '66S301', 1023),
(10028, '66S301', 1024),

(10029, '01R895', 1025),


(10031, '73Z054', 1026),

(10032, '77H538', 1027),

(10033, '31Z223', 1028),
(10033, '31Z223', 1029),

(10034, '61W620', 1030),

(10035, '93O994', 1031),

(10036, '79Z639', 1032),


(10038, '19K221', 1033),

(10039, '80E540', 1034),
(10039, '80E540', 1035),

(10040, '61Z706', 1036),
(10040, '61Z706', 1037),


(10042, '13R467', 1038),






(10048, '55R726', 1039),


(10050, '46A215', 1040),
(10050, '46A215', 1041),


(10052, '01V952', 1042),
(10052, '01V952', 1043),

(10053, '54V227', 1044),



(10056, '72C373', 1045),
(10056, '72C373', 1046),



(10059, '09N771', 1047),
(10059, '09N771', 1048),

(10060, '33K596', 1049)


INSERT into loading values
(1000, 10000),

(1001, 10001),
(1001, 10002),
(1001, 10003),

(1002, 10004),
(1002, 10005),



(1005, 10006),
(1005, 10007),
(1005, 10008),


(1007, 10009),
(1007, 10010),


(1009, 10011),
(1009, 10012),
(1009, 10013),
(1009, 10014),


(1011, 10015),
(1011, 10016),
(1011, 10017),

(1012, 10018),

(1013, 10019),
(1013, 10020),


(1015, 10021),
(1015, 10022),
(1015, 10023),
(1015, 10024),

(1016, 10025),
(1016, 10026),

(1017, 10027),
(1017, 10028),
(1017, 10029),
(1017, 10030),

(1018, 10031),
(1018, 10032),
(1018, 10033),

(1019, 10034),
(1019, 10035),

(1020, 10036),
(1020, 10037),

(1021, 10038),
(1021, 10039),



(1024, 10040),
(1024, 10041),
(1024, 10042),

(1025, 10043),

(1026, 10044),
(1026, 10045),
(1026, 10046),
(1026, 10047),


(1028, 10048),


(1030, 10049),
(1030, 10050),
(1030, 10051),

(1031, 10052),
(1031, 10053),


(1033, 10054),
(1033, 10055),
(1033, 10056),
(1033, 10057),

(1034, 10058),

(1035, 10059),
(1035, 10060),
(1035, 10061),

(1036, 10062),

(1037, 10063),


(1039, 10064),
(1039, 10065),
(1039, 10066),
(1039, 10067),


(1041, 10068),
(1041, 10069),
(1041, 10070),


(1043, 10071),


(1045, 10072),
(1045, 10073),
(1045, 10074),
(1045, 10075),

(1046, 10076),
(1046, 10077),

(1047, 10078),
(1047, 10079),
(1047, 10080),
(1047, 10081),

(1048, 10082),
(1048, 10083),
(1048, 10084),

(1049, 10085),
(1049, 10086)


INSERT into hiring values
(72069, 7865194889),
(72069, 5259470335),
(72069, 7273834895),

(51025, 7269539483),
(51025, 1655499455),

(60446, 7255605838),

(94597, 6626553171),
(94597, 6030016336),
(94597, 1112169645),
(94597, 8718149746),
(94597, 8732232507),
(94597, 6085341876),
(94597, 5548324676),
(94597, 5380248601),

(54882, 7334508491),
(54882, 1796669459),
(54882, 8374405101),
(54882, 1073750325),
(54882, 6749851012),
(54882, 0324483387),
(54882, 9729323596),
(54882, 5998173058),
(54882, 0485411865),

(17033, 8659355258),
(17033, 3562273747),
(17033, 8792633856),
(17033, 2488069816),

(80888, 3943721706),
(80888, 5669712409),
(80888, 8238515050),
(80888, 3647185959),
(80888, 6278584897),
(80888, 1092785765),
(80888, 4565539283),
(80888, 0105282528),


(99087, 2557605626),
(99087, 6805777080),
(99087, 6609149879),

(79311, 6436536707),
(79311, 7740069708)
-- Tamrin 1                                                                              
SELECT * 
FROM driver, truck, driving
WHERE 
  driver.eid = driving.eid  AND
  driving.tid = truck.plate AND
  truck.brand = 'SCANIA'
-- Tamrin 2                                                                              
SELECT driver.fname + ' ' + driver.lname as fullname, driver.number
FROM driver, hiring, company
WHERE
  driver.eid = hiring.eid AND
  company.cid = hiring.cid AND
  company.city = 'Aalborg'
-- Tamrin 3                                                                              
SELECT tid, brand + ' ' + model as truck_name, powerhp, gear
FROM truck, attachtrailer, trailer, loading, cargo
WHERE
  truck.tid = attachtrailer.tid AND
  trailer.trailerid = attachtrailer.trailerid AND
  trailer.trailerid = loading.trailerid AND
  cargo.loadid = loading.loadid AND
  cargo.weightton > 20 AND
  truck.gear > 12
  truck.powerhp > 480
-- Tamrin 4                                                                              
SELECT *
FROM trailer
WHERE maxweight > 15 
GROUP BY trailer.manufacture
HAVING garage CONTAINS (
  SELECT city
  FROM company
)
-- Tamrin 5                                                                              
SELECT plate, trailerid
FROM trailer
WHERE
  ttype like 'LOW%' AND
  tbody = 'SINGLE'
-- Tamrin 6                                                                              
SELECT brand + ' ' + model as truck_name, plate, trailer
FROM truck
WHERE brand = 'Renault'
-- Tamrin 7                                                                              
SELECT *
FROM cargo
WHERE
  ttype = 'Container' AND
  origin = 'Odense'
-- Tamrin 8                                                                              
SELECT  fname + ' ' + driver.lname as fullname, number, addr, salery
FROM driver
WHERE addr like '%Copenhagen%'
-- Tamrin 9                                                                              
SELECT driver.id, driver.salery
FROM driver, company, hiring
WHERE
  company.cid = hiring.cid AND
  driver.eid = hiring.eid AND
  company.employe > 300 AND
  incomepkm > 30
-- Tamrin 10                                                                             
SELECT *
FROM truck
WHERE axil > 2