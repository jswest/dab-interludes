/**************************************************************************
 |                    STATA SETUP FILE FOR ICPSR 08451
 |       EXECUTIONS IN THE UNITED STATES, 1608-2002: THE ESPY FILE
 |
 |                                                                        
 |  Please edit this file as instructed below.                            
 |  To execute, start Stata, change to the directory containing:          
 |       - this do file                                                   
 |       - the ASCII data file                                            
 |       - the dictionary file                                            
 |                                                                        
 |  Then execute the do file (e.g., do 08451-0001-statasetup.do)          
 |                                                                        
 **************************************************************************/

set mem 2m  /* Allocating 2 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */

set more off  /* This prevents the Stata output viewer from pausing the
                 process*/

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "raw-datafile-name" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.
        "my data" ==> The label you wish to assign to your data file (optional).

   Note:  We assume that the raw data, dictionary, and DDS (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/

local raw_data "raw-datafile-name"
local dict "dictionary-filename"
local outfile "stata-datafile"
label data "My Data"

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using `dict', using (`raw_data') clear










/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/


label data "EXECUTIONS IN THE UNITED STATES, 1608-2002: THE ESPY FILE, Part 0001"

#delimit ;
label define V2        4 "February, 2004" ;
label define V3        1 "All One Part" ;
label define V5        0 "Do Not Know; NA" 1 "White" 2 "Black"
                       3 "Native American" 4 "Asian-Pacific Il" 5 "Hispanic"
                       6 "Other" ;
label define V6        0 "Do Not Know; NA" ;
label define V8        0 "Do Not Know; NA" 1 "City-Local Juris"
                       2 "County-Local Jur" 3 "State-ST Prison" 4 "Other" ;
label define V9        0 "Do Not Know; NA" 1 "Local-Colonial" 2 "State"
                       3 "Federal" 4 "Territorial" 5 "Indian Tribunal"
                       6 "Other-Military" ;
label define V10       0 "Do Not Know; NA" 1 "Murder" 2 "Rape"
                       3 "Criminal Assault" 4 "Housebrkng-Burgl"
                       5 "Horse Stealing" 6 "Consp to Murder" 7 "Treason"
                       8 "Slave Revolt" 9 "Witchcraft" 10 "Robbery-Murder"
                       11 "Rape-Murder" 12 "Piracy" 13 "Accessory to Mur"
                       14 "Desertion" 15 "Robbery" 16 "Arson"
                       17 "Guerilla Activit" 18 "Spying-Espionage"
                       19 "Murder-Rape-Rob" 20 "Burg-Att Rape" 21 "Rioting"
                       22 "Attempted Rape" 23 "Murder-Burglary"
                       24 "Kidnap-Murder" 25 "Kidnap-Murdr-Rob"
                       26 "Arson-Murder" 27 "Rape-Robbery" 28 "Kidnapping"
                       29 "Prisn Brk-Kidnap" 30 "Sodmy-Buggry-Bst"
                       31 "Adultery" 33 "Poisoning" 35 "Concealing Birth"
                       36 "Unspec Felony" 37 "Aid Runaway Slve"
                       39 "Counterfeiting" 40 "Attempted Murder" 41 "Forgery"
                       43 "Theft-Stealing" 44 "Other" ;
label define V11       0 "Do Not Know; NA" 1 "Hanging" 2 "Electrocution"
                       3 "Asphyxiation-Gas" 4 "Shot" 5 "Injection"
                       6 "Pressing" 8 "Break on Wheel" 10 "Burned"
                       11 "Hung in Chains" 13 "Bludgeoned" 14 "Gibbetted"
                       15 "Other" ;
label define V12       0 "Do Not Know; NA" ;
label define V13       0 "Do Not Know; NA" ;
label define V15       1 "1st Execution" 39 "39th Execution" ;
label define V16       1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas"
                       6 "California" 8 "Colorado" 9 "Connecticut"
                       10 "Delaware" 11 "Washington, D.C." 12 "Florida"
                       13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois"
                       18 "Indiana" 19 "Iowa" 20 "Kansas" 21 "Kentucky"
                       22 "Louisiana" 23 "Maine" 24 "Maryland"
                       25 "Massachusetts" 26 "Michigan" 27 "Minnesota"
                       28 "Mississippi" 29 "Missouri" 30 "Montana"
                       31 "Nebraska" 32 "Nevada" 33 "New Hampshire"
                       34 "New Jersey" 35 "New Mexico" 36 "New York"
                       37 "North Carolina" 38 "North Dakota" 39 "Ohio"
                       40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania"
                       44 "Rhode Island" 45 "South Carolina"
                       46 "South Dakota" 47 "Tennessee" 48 "Texas" 49 "Utah"
                       50 "Vermont" 51 "Virginia" 53 "Washington"
                       54 "West Virginia" 55 "Wisconsin" 56 "Wyoming" ;
label define V18       1 "CT (1788)" 2 "Maine (1820)" 3 "MA (1788)"
                       4 "NH (1788)" 5 "RI (1790)" 6 "Vermont (1791)"
                       11 "Delaware (1787)" 12 "NJ (1787)"
                       13 "New York (1788)" 14 "PA (1787)"
                       21 "Illinois (1818)" 22 "Indiana (1816)"
                       23 "Michigan (1837)" 24 "Ohio (1803)"
                       25 "Wisconsin (1848)" 31 "Iowa (1846)"
                       32 "Kansas (1861)" 33 "Minnesota (1858)"
                       34 "Missouri (1821)" 35 "Nebraska (1867)"
                       36 "ND (1889)" 37 "SD (1889)" 40 "Virginia (1788)"
                       41 "Alabama (1819)" 42 "Arkansas (1836)"
                       43 "Florida (1845)" 44 "Georgia (1788)"
                       45 "Louisiana (1812)" 46 "MS (1817)" 47 "NC (1789)"
                       48 "SC (1788)" 49 "Texas (1845)" 51 "Kentucky (1792)"
                       52 "Maryland (1788)" 53 "Oklahoma (1907)"
                       54 "Tennessee (1796)" 55 "Washington, D.C"
                       56 "WV (1863)" 61 "Arizona (1912)"
                       62 "Colorado (1876)" 63 "Idaho (1890)"
                       64 "Montana (1889)" 65 "Nevada (1864)" 66 "NM (1912)"
                       67 "Utah (1896)" 68 "Wyoming (1890)" 71 "CA (1850)"
                       72 "Oregon (1859)" 73 "WA (1889)" 81 "Alaska (1959)"
                       82 "Hawaii (1959)" ;
label define V19       0 "Do Not Know; NA" 1 "Male" 2 "Female" ;
label define V20       0 "No or Unknown" 1 "Yes" ;
label define V21       0 "Do Not Know; NA" 1 "Accountant" 2 "Accting Student"
                       3 "Actor" 4 "Ad Salesman" 5 "Air Force"
                       6 "Air Force Vet" 7 "Aircraft Mech"
                       8 "Aircraft Worker" 9 "Airforce Sgt" 10 "Airman"
                       11 "Aluminum Install" 12 "Appliance Sales"
                       13 "Apprentice Baker" 14 "Appren Barber"
                       15 "Appren Butcher" 16 "Appren Carpenter"
                       17 "Appren Cobbler" 18 "Appren Embalmer"
                       19 "Armed Robber" 20 "Army Deserter" 21 "Army LT"
                       22 "Army Veteran" 23 "Art Student" 24 "Assessor"
                       25 "Astrologer" 26 "Asylum Escapee" 27 "Attorney"
                       28 "Auto Mechanic" 29 "Auto Salesman" 30 "Auto Thief"
                       31 "Autorental" 32 "AWOL Marine" 33 "AWOL Soldier"
                       34 "Baker" 35 "Bakery Employee" 36 "Bakery Foreman"
                       37 "Banana Dealer" 38 "Bandit" 39 "Bandit Leader"
                       40 "Bank Employee" 41 "Bank Page" 42 "Bank Robber"
                       43 "Bar Keeper" 44 "Bar Maid" 45 "Bar Owner"
                       46 "Bar Tender" 47 "Barber" 48 "Bartender"
                       49 "Baseball Player" 50 "Beef Carrier" 51 "Bell Boy"
                       52 "Bell Hop" 53 "Bike Repairman" 54 "Bill Poster"
                       55 "Blacksmith" 56 "Blastfurnace Wor"
                       57 "Boarding Hse Opr" 58 "Boarding Hse Own"
                       59 "Boat Laborer" 60 "Boat Worker" 61 "Boilermaker"
                       62 "Bookkeeper" 63 "Booksalesman" 64 "Bootblack"
                       65 "Bootlegger" 66 "Bordello Owner" 67 "Bound Servant"
                       68 "Bowling Pinboy" 69 "Box Salesman" 70 "Boxer"
                       71 "Brass Finisher" 72 "Brewer" 73 "Brewery Worker"
                       74 "Brick Mason" 75 "Bricklayer" 76 "Brickmaker"
                       77 "British Deserter" 78 "British Soldier"
                       79 "Broom Maker" 80 "Buffalo Hunter"
                       81 "Bldg Contractor" 82 "Building Super"
                       83 "Bulldozer Operat" 84 "Burglar" 85 "Bus Boy"
                       86 "Bus Driver" 87 "Businessman" 88 "Butcher"
                       89 "Butcher's Helper" 90 "Butler" 91 "Cabdriver"
                       92 "Cabinet Maker" 93 "Caddy" 94 "Cafe Employee"
                       95 "Cafe Operator" 96 "Cafe Owner" 97 "Cafe Porter"
                       98 "Canal Boat Wrkr" 99 "Canal Laborer"
                       100 "Candy Dealer" 101 "Candy Maker"
                       102 "Cannery Worker" 103 "Capt. Salv Army"
                       104 "Captain" 105 "Car Washer" 106 "Carnival Worker"
                       107 "Carnvial Owner" 108 "Carpenter"
                       109 "Carpenter's Help" 110 "Carriage Maker"
                       111 "Cattleman" 112 "Caulker" 113 "CCC Worker"
                       114 "Cement Worker" 115 "Charcoal Dealer"
                       116 "Chauffeur" 117 "Chef" 118 "Chemist"
                       119 "Chemist Helper" 120 "Chicken Farmer" 121 "Chief"
                       122 "Chimney Sweep" 123 "Church Janitor"
                       124 "Cigar Dealer" 125 "Cigar Maker"
                       126 "Circus Laborer" 127 "Circus Roustabou"
                       128 "Citrus Rancher" 129 "Citrus Worker"
                       130 "City Employee" 131 "Claims Locator" 132 "Clergy"
                       133 "Clergyman" 134 "Clerk" 135 "Clothes Presser"
                       136 "Clubmanger" 137 "Coachman" 138 "Coal Co. Emplyee"
                       139 "Coal Hauler" 140 "Coal Miner" 141 "Coal Thief"
                       142 "Coal Wagon Drive" 143 "Cobbler"
                       144 "College Prof" 145 "College Student" 146 "Collier"
                       147 "Colliery Worker" 148 "Colonial Offcial"
                       149 "Commission Merch" 150 "Compositor"
                       151 "Computer Program" 152 "Con Man"
                       153 "Confed Deserter" 154 "Constable"
                       155 "Construction" 156 "Constructn Formn"
                       157 "Constructn Labor" 158 "Constructn Workr"
                       159 "Contractor" 160 "Convict" 161 "Convict Guard"
                       162 "Convict Servant" 163 "Convict Trustee" 164 "Cook"
                       165 "Cottonmill Workr" 166 "Councilor"
                       167 "Counterfeiter" 168 "County Official"
                       169 "Courier" 170 "Cowboy" 171 "Cowhand"
                       172 "Crane Operator" 173 "Criminal" 174 "Cult Leader"
                       175 "Dairy Operator" 176 "Dairyman"
                       177 "Dance Hall Owner" 178 "Dancer"
                       179 "Debt Collector" 180 "Deckhand" 181 "Delivery Boy"
                       182 "Delivery Man" 183 "Dental Student" 184 "Dentist"
                       185 "Deputy Sheriff" 186 "Deserted Sailor"
                       187 "Deserter" 188 "Detective" 189 "Dischrgd Marine"
                       190 "Dischrgd Soldier" 191 "Dishwasher"
                       192 "Distillery" 193 "Distillery Workr"
                       194 "Dockworker" 195 "Domestic" 196 "Domestic Cook"
                       197 "Domestic Servant" 198 "Domestic Worker"
                       199 "Donut Salesman" 200 "Door Maker"
                       201 "Draft Evader" 202 "Draftsman" 203 "Drayman"
                       204 "Drifter" 205 "Drink Distrbutor" 206 "Driver"
                       207 "Drover" 208 "Drug Counselor" 209 "Drug Dealer"
                       210 "Druggist" 211 "Drugstore Clerk" 212 "Editor"
                       213 "Elctrcl Engineer" 214 "Electrician"
                       215 "Elephant Trainer" 216 "Elevator Oper"
                       217 "Engineer" 218 "Engraver" 219 "Entertainer"
                       220 "Escaped Convict" 221 "Escap Mental Pat"
                       222 "Escaped Prisoner" 223 "Ex Constable"
                       224 "Ex Convict" 225 "Ex Deputy Sherif"
                       226 "Ex Lawman" 227 "Ex Police Chief"
                       228 "Ex Policeman" 229 "Ex Reformatory"
                       230 "Ex Sailor" 231 "Ex Soldier"
                       232 "Express Employee" 233 "Factory Executv"
                       234 "Factory Foreman" 235 "Factory Worker"
                       236 "Farm Hand" 237 "Farm Laborer" 238 "Farm Manager"
                       239 "Farm Supervisor" 240 "Farm Worker" 241 "Farmer"
                       242 "Farmer/Laborer" 243 "Fence" 244 "Ferryman"
                       245 "FHA Executive" 246 "Fiddler" 247 "Fireman"
                       248 "Fish Peddler" 249 "Fisherman"
                       250 "Flatboat Worker" 251 "Florist"
                       252 "Florist Assistnt" 253 "Fodder Contractr"
                       254 "Foreman" 255 "Forger" 256 "Fork Lift Opertr"
                       257 "Fortune Teller" 258 "Foundry Worker"
                       259 "Freedman" 260 "Freeman" 261 "Freighter"
                       262 "Fruit Peddler" 263 "Fruit Stand Empl"
                       264 "Fry Cook" 265 "Fugitive" 266 "Furniture Refin"
                       267 "Furrier" 268 "Furtrader" 269 "Gambler"
                       270 "Gang Leader" 271 "Gang Member" 272 "Gangster"
                       273 "Garage Attendant" 274 "Garage Man"
                       275 "Garage Owner" 276 "Garage Worker"
                       277 "Garbageman" 278 "Gardener" 279 "Gas Dealer"
                       280 "Gas Station Att" 281 "Gas Station Empl"
                       282 "Gas Station Own" 283 "General Contract"
                       284 "Glass Blower" 285 "Glass Designer"
                       286 "Glass Worker" 287 "Goat Herder"
                       288 "Gold Prospector" 289 "Golf Caddy"
                       290 "Government Clerk" 291 "Govt Employee"
                       292 "Grave Robber" 293 "Grocer" 294 "Grocery Clerk"
                       295 "Grounds Keeper" 296 "Guerilla" 297 "Guide"
                       298 "Gunman" 299 "Gunsmith" 300 "Hand Cart Driver"
                       301 "Handyman" 302 "Harness Maker" 303 "Hearse Driver"
                       304 "Heavy Equip Oper" 305 "Herb Doctor"
                       306 "H.S. Student" 307 "Hired Gun" 308 "Hiwayman"
                       309 "Hobo" 310 "Hoisery Knitter" 311 "Homesteader"
                       312 "Horse Breaker" 313 "Horse Dealer"
                       314 "Horse Trader" 315 "Hospital Emplyee"
                       316 "Hospital Orderly" 317 "Hostler"
                       318 "Hotel Bellman" 319 "Hotel Employee"
                       320 "Hotel Owner" 321 "Hotel Porter"
                       322 "Hotel Proprietor" 323 "Hotel Steward"
                       324 "House Boy" 325 "House Maid" 326 "House Painter"
                       327 "Housekeeper" 328 "Housewife" 329 "Hunter"
                       330 "Importer" 331 "Indentured Serv"
                       332 "Industrial Workr" 333 "Innkeeper"
                       334 "Insurance Agent" 335 "Interior Decorat"
                       336 "Interpreter" 337 "Inventor" 338 "Ironworker"
                       339 "Itinerant Hndymn" 340 "Itinerant Labr"
                       341 "Itinerant Worker" 342 "Jail Escapee"
                       343 "Jail Prisoner" 344 "Jailer" 345 "Janitor"
                       346 "Janitor-Watchman" 347 "Jeweler"
                       348 "Jitney Driver" 349 "Jockey"
                       350 "Journeyman Tailr" 351 "Junk Dealer"
                       352 "Labor Contractor" 353 "Labor Organizer"
                       354 "Labor Racketeer" 355 "Laborer" 356 "Landlady"
                       357 "Laundry Owner" 358 "Laundry Worker"
                       359 "Laundryman" 360 "Lawn Mowr Repair" 361 "Lawyer"
                       362 "Lingerie Sales" 363 "Livery Employee"
                       364 "Livery Proprietr" 365 "Locksmith" 366 "Logger"
                       367 "Longshoreman" 368 "Loom Fixer" 369 "Lumberjack"
                       370 "Lumberman" 371 "Lumbermill Labor"
                       372 "Lumbermill Owner" 373 "Lumbermill Workr"
                       374 "Lunatic" 375 "Machine Operator"
                       376 "Machine Tool Opr" 377 "Machinist"
                       378 "Magazine Sales" 379 "Maid" 380 "Mailman"
                       381 "Male Nurse" 382 "Marine" 383 "Mason"
                       384 "Mason's Help" 385 "Master Criminal"
                       386 "Mat Maker" 387 "Meat Cutter" 388 "Meat Packer"
                       389 "Meat Provider" 390 "Mechanic"
                       391 "Mechncl Engineer" 392 "Medical Prof"
                       393 "Medical Student" 394 "Medicine Vendor"
                       395 "Mental Patient" 396 "Merchant"
                       397 "Merchant Marine" 398 "Merchant Seaman"
                       399 "Messboy" 400 "Messenger" 401 "Metal Insp"
                       402 "Mexican Bandit" 403 "Migrant Farm Wkr"
                       404 "Migrant Laborer" 405 "Migrant Worker"
                       406 "Military Emplyee" 407 "Milkman"
                       408 "Mill Foreman" 409 "Mill Operator"
                       410 "Mill Worker" 411 "Miller" 412 "Milliner"
                       413 "Millwright" 414 "Mine Digger" 415 "Mine Owner"
                       416 "Mine Watchman" 417 "Miner" 418 "Mining Engineer"
                       419 "Minister" 420 "Molder" 421 "Moonshiner"
                       422 "Mormon Bishop" 423 "Mortician" 424 "Mover"
                       425 "Music Teacher" 426 "Musician" 427 "Mystic"
                       428 "Navy Airman" 429 "Navy Deserter"
                       430 "Navy Veteran" 431 "Navy Yard Worker"
                       432 "Neon Sign Hanger" 433 "News Vendor" 434 "Newsboy"
                       435 "Newspaper Carrie" 436 "Night Watchman"
                       437 "Nightclub Entrnr" 438 "Nightclub Owner"
                       439 "Novelty Salesman" 440 "Nurse" 441 "Odd Jobs"
                       442 "Office Boy" 443 "Office Manager"
                       444 "Oil Driller" 445 "Oil Roustabout"
                       446 "Oilfield Worker" 447 "Optical Worker"
                       448 "Optician" 449 "Orchestra Condct" 450 "Outlaw"
                       451 "Overseer" 452 "Oyster Dredger" 453 "Oysterpicker"
                       454 "P.O.W" 455 "Packing Co. Frmn" 456 "Painter"
                       457 "Painter's Helper" 458 "Paintstore Workr"
                       459 "Pamo Chief" 460 "Pants Presser"
                       461 "Paper Worker" 462 "Park Guide"
                       463 "Parking Attendnt" 464 "Paroled Convict"
                       465 "Parolee" 466 "Peddler" 467 "Pest Control Sal"
                       468 "Pest Exterminatr" 469 "Petty Crook"
                       470 "Pharmacist" 471 "Pharmacy Clerk" 472 "Physician"
                       473 "Piano Player" 474 "Pimp" 475 "Pirate"
                       476 "Pirate Captain" 477 "Plant Worker"
                       478 "Plantation Workr" 479 "Planter" 480 "Plasterer"
                       481 "Playboy" 482 "Plumber" 483 "Plumber's Helper"
                       484 "Poet" 485 "Policeman" 486 "Policy Writer"
                       487 "Politician" 488 "Ponyexpress"
                       489 "Pool Hall Owner" 490 "Pool Room Owner"
                       491 "Porter" 492 "Porter/Waiter" 493 "Postal Clerk"
                       494 "Postmaster" 495 "Poultry Farmer" 496 "Preacher"
                       497 "Priest" 498 "Printer" 499 "Printer-Poet"
                       500 "Prison Guard" 501 "Prisoner" 502 "Produce Clerk"
                       503 "Produce Laborer" 504 "Produce Merchant"
                       505 "Produce Salesman" 506 "Produce Trader"
                       507 "Produce Worker" 508 "Projectionist"
                       509 "Prostitute" 510 "Pugilist" 511 "Pullman Porter"
                       512 "Pulp Worker" 513 "Purchasing Agent"
                       514 "Quarry Worker" 515 "Racketeer"
                       516 "Radio Repairman" 517 "Rafter" 518 "Rag Picker"
                       519 "Railroad Agent" 520 "Railroad Brakemn"
                       521 "Railroad Clerk" 522 "Railroad Emplyee"
                       523 "Railroad Engneer" 524 "Railroad Fireman"
                       525 "Railroad Foreman" 526 "Railroad Laborer"
                       527 "Railroad Machnst" 528 "Railroad Shop Wk"
                       529 "Railroad Switchm" 530 "Railroad Worker"
                       531 "Railsplitter" 532 "Railway Cook"
                       533 "Ranch Foreman" 534 "Ranch Hand"
                       535 "Ranch Laborer" 536 "Ranch Manager" 537 "Rancher"
                       538 "Range Rider" 539 "Real Estate"
                       540 "Real Estate Agnt" 541 "Realtor"
                       542 "Refinery Worker" 543 "Reformtry Escpee"
                       544 "Reformtry Inmate" 545 "Reformtry Parlee"
                       546 "Relief Worker" 547 "Religious Neophy"
                       548 "Repairman" 549 "Restaurant Mngr"
                       550 "Restaurant Oper" 551 "Restaurant Owner"
                       552 "Restaurant Workr" 553 "Retarded"
                       554 "Retired Baker" 555 "Retired Grocer"
                       556 "Retired Soldier" 557 "Reverend"
                       558 "Revolutionary" 559 "Rigger"
                       560 "River Barge Wrkr" 561 "Riverboat Hand"
                       562 "Roadhouse Opertr" 563 "Rodeo Cowboy"
                       564 "Roof Painter" 565 "Roofer" 566 "Roofing Salesman"
                       567 "Rooming Hse Ownr" 568 "Roustabout"
                       569 "Rubber Worker" 570 "Rug Peddler" 571 "Rug Weaver"
                       572 "Runaway" 573 "Runaway Slave" 574 "Sailor"
                       575 "Sales" 576 "Sales Broker" 577 "Sales Manager"
                       578 "Salesman" 579 "Saloon Employee"
                       580 "Saloon Keeper" 581 "Saloon Owner"
                       582 "Saloon Porter" 583 "Sanitation"
                       584 "Sawmill Operator" 585 "Sawmill Worker"
                       586 "School Guard" 587 "School Teacher"
                       588 "Scriptwriter" 589 "Sculptor" 590 "Sea Captain"
                       591 "Seaman" 592 "Security Guard" 593 "Servant"
                       594 "Sharecropper" 595 "Sheet Mill Workr"
                       596 "Shepherd" 597 "Sheriff" 598 "Shingleworker"
                       599 "Ship Captain" 600 "Ship's Carpenter"
                       601 "Ship's Pilot" 602 "Shipmaster"
                       603 "Shipping Clerk" 604 "Shipyard Worker"
                       605 "Shoemaker" 606 "Shoeshiner" 607 "Silk Weaver"
                       608 "Silversmith" 609 "Singer" 610 "Slave"
                       611 "Smelterer" 612 "Smuggler" 613 "Social Worker"
                       614 "Soda Clerk" 615 "Soda Parlor Ownr" 616 "Soldier"
                       617 "Soldier Lt" 618 "Speakeasy Opertr"
                       619 "Speakeasy Owner" 620 "Spiritualist"
                       621 "Stableboy" 622 "Stage Driver" 623 "State Trooper"
                       624 "Steamboat Roustr" 625 "Steamboat Worker"
                       626 "Steamfitter" 627 "Steelmill Worker"
                       628 "Steelworker" 629 "Steeplejack" 630 "Stenographer"
                       631 "Stevedore" 632 "Steward" 633 "Stock Swindler"
                       634 "Stock Trader" 635 "Stockman" 636 "Stockyard Hand"
                       637 "Stone Mason" 638 "Stone Quarry Wkr"
                       639 "Stonecutter" 640 "Store Clerk" 641 "Store Keeper"
                       642 "Store Owner" 643 "Streetcar Conduc" 644 "Student"
                       645 "Surgeon" 646 "Tailor" 647 "Tavern Keeper"
                       648 "Tavern Owner" 649 "Taxi Driver" 650 "Teacher"
                       651 "Teamster" 652 "Telephone Repair"
                       653 "Temperance Workr" 654 "Tenant Farmer"
                       655 "Textile Worker" 656 "Theater Employee"
                       657 "Thief" 658 "Ticket Taker" 659 "Tiecutter"
                       660 "Tinker" 661 "Tinner" 662 "Tire Recapper"
                       663 "Tire Salesman" 664 "Tobacco Dealer"
                       665 "Tong Assassin" 666 "Tong Member" 667 "Tongsman"
                       668 "Tool Worker" 669 "Toolmaker" 670 "Tory Soldier"
                       671 "Tour Guide" 672 "Tourist" 673 "Towboat Hand"
                       674 "Tractor Driver" 675 "Trade School Stu"
                       676 "Trader" 677 "Tradesman" 678 "Train Engineer"
                       679 "Train Porter" 680 "Tramp" 681 "Transient"
                       682 "Transient Worker" 683 "Transit Employee"
                       684 "Trapper" 685 "Trapper/Hunter"
                       686 "Trash Collector" 687 "Tree Planter"
                       688 "Tribal Chief" 689 "Truck Driver"
                       690 "Truck Farmer" 691 "Tugboat Fireman"
                       692 "Tugboat Worker" 693 "Turpentine Workr"
                       694 "TV Repairman" 695 "Typesetter"
                       696 "Typewritr Repair" 697 "U.S. Marshall"
                       698 "Unemployed" 699 "Unemployed Labor"
                       700 "Unemplyd Mechanc" 701 "Union Organizer"
                       702 "Unlicnsd Physicn" 703 "Upholsterer"
                       704 "Upholstrr's Help" 705 "Utilties Emplyee"
                       706 "Utilities Managr" 707 "Vagrant" 708 "Valet"
                       709 "Vaudeville" 710 "Veteran" 711 "Veteran Pensionr"
                       712 "Veterinarian" 713 "Vocational Stu"
                       714 "Voodoo Doctor" 715 "Wagon Boss"
                       716 "Wagon Driver" 717 "Wagoneer" 718 "Waiter"
                       719 "Waitress" 720 "Wall Washer"
                       721 "War Plant Worker" 722 "Warehouse Porter"
                       723 "Warehouse Worker" 724 "Watchman" 725 "Weaver"
                       726 "Welder" 727 "Whaler" 728 "Wheel Wright"
                       729 "Whiskey Smuggler" 730 "Whisky Runner" 731 "Widow"
                       732 "Windowdresser" 733 "Winery Employee"
                       734 "Wood Chopper" 735 "Wood Cutter" 736 "Wood Dealer"
                       737 "Wood Sawer" 738 "Wood Worker" 739 "Woodsman"
                       740 "WPA Water Boy" 741 "WPA Worker" 742 "Writer"
                       743 "Yardman" 800 "A/C Repairman" 801 "Autobody Rep"
                       802 "Babysitter" 803 "Bouncer" 804 "Caretaker"
                       805 "Cashier" 806 "Clerical" 807 "Clown"
                       808 "Coll. Graduate" 809 "Correction Off"
                       810 "Directcaretek" 811 "Dispatcher" 812 "Drywaller"
                       813 "Dump Truck Driver" 814 "Informant"
                       815 "Insur. Investor" 816 "Landscaping"
                       817 "Maintenance" 818 "Manager" 819 "Noble"
                       820 "Nurse Assist" 821 "Nursesaide" 822 "Press Operat"
                       823 "Produce Manager" 824 "Radiator Repai"
                       825 "Relief Worker Assist" 826 "Repo Man"
                       827 "Roughneck" 828 "Shrimper" 829 "Stock Broker"
                       830 "Stripper" 900 "Heavy Equip Oper/Carpenter"
                       901 "Laborer/Truck Driver" 902 "Painter/Mechanic"
                       903 "Sales/Laborer" 904 "Student/Sales"
                       905 "Welder/Mechanic" ;


#delimit cr


/***************************************************************************

 Section 4: Missing Values

 This section will replace numeric missing values (i.e., -9) with generic
 system missing ".".  By default the code in this section is commented out.
 Users wishing to apply the generic missing values should remove the comment
 at the beginning and end of this section.  Note that Stata allows you to
 specify up to 27 unique missing value codes.

****************************************************************/

/*
replace V5 = . if (V5 == 0)
replace V6 = . if (V6 == 0)
replace V8 = . if (V8 == 0)
replace V9 = . if (V9 == 0)
replace V10 = . if (V10 == 0)
replace V11 = . if (V11 == 0)
replace V12 = . if (V12 == 0)
replace V13 = . if (V13 == 0)
replace V17 = . if (V17 == 0)
replace V19 = . if (V19 == 0)
replace V20 = . if (V20 == 0)
replace V21 = . if (V21 == 0)


*/
/********************************************************************

 Section 5: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

