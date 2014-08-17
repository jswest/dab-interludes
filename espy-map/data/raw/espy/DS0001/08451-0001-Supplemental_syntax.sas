*-------------------------------------------------------------------------*
 |                                                                         
 |               SAS COMPANION PROGRAM FILE FOR ICPSR 08451
 |       EXECUTIONS IN THE UNITED STATES, 1608-2002: THE ESPY FILE
 |
 |
 | This SAS program is provided for optional use with the SAS transport
 | version of this data file as distributed by ICPSR. The metadata provided
 | below are not stored in the SAS transport version of this data
 | collection.  Users need to use SAS PROC COPY to copy the SAS transport
 | file to a SAS data set on their system. This program can then be used in
 | conjunction with the SAS system data file.
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions.  Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set. Users
 | should replace "SAS-dataset" with their name for the SAS data set copied
 | from the SAS transport file. Users can add a SAS libname statement
 | and an output SAS data set name to make a permanent SAS data set.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in the section.
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables stored in the SAS data set. Users can refer to their
 | SAS manual for information on how to permanently store formats in a
 | SAS catalog.
 |
 | NOTE:  Users should modify these sections to suit their specific needs.
 | The MISSING VALUE RECODES section has been commented out (i.e., '/*'
 | and '*/').  To make this section active in the program, users should
 | remove the SAS comment indicators from this section.
 |
 *------------------------------------------------------------------------;

* SAS PROC FORMAT;

PROC FORMAT;
  VALUE V2ffffff  4='(4) February, 2004' ;
  VALUE V3ffffff  1='(1) All One Part' ;
  VALUE V5ffffff  0='(0) Do Not Know; NA' 1='(1) White' 2='(2) Black' 3='(3) Native American'
                  4='(4) Asian-Pacific Il' 5='(5) Hispanic' 6='(6) Other' ;
  VALUE V6ffffff  0='(0) Do Not Know; NA' ;
  VALUE V8ffffff  0='(0) Do Not Know; NA' 1='(1) City-Local Juris'
                  2='(2) County-Local Jur' 3='(3) State-ST Prison' 4='(4) Other' ;
  VALUE V9ffffff  0='(0) Do Not Know; NA' 1='(1) Local-Colonial' 2='(2) State'
                  3='(3) Federal' 4='(4) Territorial' 5='(5) Indian Tribunal'
                  6='(6) Other-Military' ;
  VALUE V10fffff  0='(0) Do Not Know; NA' 1='(1) Murder' 2='(2) Rape'
                  3='(3) Criminal Assault' 4='(4) Housebrkng-Burgl'
                  5='(5) Horse Stealing' 6='(6) Consp to Murder' 7='(7) Treason'
                  8='(8) Slave Revolt' 9='(9) Witchcraft' 10='(10) Robbery-Murder'
                  11='(11) Rape-Murder' 12='(12) Piracy' 13='(13) Accessory to Mur'
                  14='(14) Desertion' 15='(15) Robbery' 16='(16) Arson'
                  17='(17) Guerilla Activit' 18='(18) Spying-Espionage'
                  19='(19) Murder-Rape-Rob' 20='(20) Burg-Att Rape' 21='(21) Rioting'
                  22='(22) Attempted Rape' 23='(23) Murder-Burglary' 24='(24) Kidnap-Murder'
                  25='(25) Kidnap-Murdr-Rob' 26='(26) Arson-Murder' 27='(27) Rape-Robbery'
                  28='(28) Kidnapping' 29='(29) Prisn Brk-Kidnap' 30='(30) Sodmy-Buggry-Bst'
                  31='(31) Adultery' 33='(33) Poisoning' 35='(35) Concealing Birth'
                  36='(36) Unspec Felony' 37='(37) Aid Runaway Slve'
                  39='(39) Counterfeiting' 40='(40) Attempted Murder' 41='(41) Forgery'
                  43='(43) Theft-Stealing' 44='(44) Other' ;
  VALUE V11fffff  0='(0) Do Not Know; NA' 1='(1) Hanging' 2='(2) Electrocution'
                  3='(3) Asphyxiation-Gas' 4='(4) Shot' 5='(5) Injection' 6='(6) Pressing'
                  8='(8) Break on Wheel' 10='(10) Burned' 11='(11) Hung in Chains'
                  13='(13) Bludgeoned' 14='(14) Gibbetted' 15='(15) Other' ;
  VALUE V12fffff  0='(0) Do Not Know; NA' ;
  VALUE V13fffff  0='(0) Do Not Know; NA' ;
  VALUE V15fffff  1='(1) 1st Execution' 39='(39) 39th Execution' ;
  VALUE V16fffff  1='(1) Alabama' 2='(2) Alaska' 4='(4) Arizona' 5='(5) Arkansas'
                  6='(6) California' 8='(8) Colorado' 9='(9) Connecticut' 10='(10) Delaware'
                  11='(11) Washington, D.C.' 12='(12) Florida' 13='(13) Georgia' 15='(15) Hawaii'
                  16='(16) Idaho' 17='(17) Illinois' 18='(18) Indiana' 19='(19) Iowa' 20='(20) Kansas'
                  21='(21) Kentucky' 22='(22) Louisiana' 23='(23) Maine' 24='(24) Maryland'
                  25='(25) Massachusetts' 26='(26) Michigan' 27='(27) Minnesota'
                  28='(28) Mississippi' 29='(29) Missouri' 30='(30) Montana' 31='(31) Nebraska'
                  32='(32) Nevada' 33='(33) New Hampshire' 34='(34) New Jersey'
                  35='(35) New Mexico' 36='(36) New York' 37='(37) North Carolina'
                  38='(38) North Dakota' 39='(39) Ohio' 40='(40) Oklahoma' 41='(41) Oregon'
                  42='(42) Pennsylvania' 44='(44) Rhode Island' 45='(45) South Carolina'
                  46='(46) South Dakota' 47='(47) Tennessee' 48='(48) Texas' 49='(49) Utah'
                  50='(50) Vermont' 51='(51) Virginia' 53='(53) Washington'
                  54='(54) West Virginia' 55='(55) Wisconsin' 56='(56) Wyoming' ;
  VALUE V18fffff  1='(1) CT (1788)' 2='(2) Maine (1820)' 3='(3) MA (1788)' 4='(4) NH (1788)'
                  5='(5) RI (1790)' 6='(6) Vermont (1791)' 11='(11) Delaware (1787)'
                  12='(12) NJ (1787)' 13='(13) New York (1788)' 14='(14) PA (1787)'
                  21='(21) Illinois (1818)' 22='(22) Indiana (1816)'
                  23='(23) Michigan (1837)' 24='(24) Ohio (1803)' 25='(25) Wisconsin (1848)'
                  31='(31) Iowa (1846)' 32='(32) Kansas (1861)' 33='(33) Minnesota (1858)'
                  34='(34) Missouri (1821)' 35='(35) Nebraska (1867)' 36='(36) ND (1889)'
                  37='(37) SD (1889)' 40='(40) Virginia (1788)' 41='(41) Alabama (1819)'
                  42='(42) Arkansas (1836)' 43='(43) Florida (1845)'
                  44='(44) Georgia (1788)' 45='(45) Louisiana (1812)' 46='(46) MS (1817)'
                  47='(47) NC (1789)' 48='(48) SC (1788)' 49='(49) Texas (1845)'
                  51='(51) Kentucky (1792)' 52='(52) Maryland (1788)'
                  53='(53) Oklahoma (1907)' 54='(54) Tennessee (1796)'
                  55='(55) Washington, D.C' 56='(56) WV (1863)' 61='(61) Arizona (1912)'
                  62='(62) Colorado (1876)' 63='(63) Idaho (1890)' 64='(64) Montana (1889)'
                  65='(65) Nevada (1864)' 66='(66) NM (1912)' 67='(67) Utah (1896)'
                  68='(68) Wyoming (1890)' 71='(71) CA (1850)' 72='(72) Oregon (1859)'
                  73='(73) WA (1889)' 81='(81) Alaska (1959)' 82='(82) Hawaii (1959)' ;
  VALUE V19fffff  0='(0) Do Not Know; NA' 1='(1) Male' 2='(2) Female' ;
  VALUE V20fffff  0='(0) No or Unknown' 1='(1) Yes' ;
  VALUE V21fffff  0='(0) Do Not Know; NA' 1='(1) Accountant' 2='(2) Accting Student'
                  3='(3) Actor' 4='(4) Ad Salesman' 5='(5) Air Force' 6='(6) Air Force Vet'
                  7='(7) Aircraft Mech' 8='(8) Aircraft Worker' 9='(9) Airforce Sgt'
                  10='(10) Airman' 11='(11) Aluminum Install' 12='(12) Appliance Sales'
                  13='(13) Apprentice Baker' 14='(14) Appren Barber'
                  15='(15) Appren Butcher' 16='(16) Appren Carpenter'
                  17='(17) Appren Cobbler' 18='(18) Appren Embalmer' 19='(19) Armed Robber'
                  20='(20) Army Deserter' 21='(21) Army LT' 22='(22) Army Veteran'
                  23='(23) Art Student' 24='(24) Assessor' 25='(25) Astrologer'
                  26='(26) Asylum Escapee' 27='(27) Attorney' 28='(28) Auto Mechanic'
                  29='(29) Auto Salesman' 30='(30) Auto Thief' 31='(31) Autorental'
                  32='(32) AWOL Marine' 33='(33) AWOL Soldier' 34='(34) Baker'
                  35='(35) Bakery Employee' 36='(36) Bakery Foreman' 37='(37) Banana Dealer'
                  38='(38) Bandit' 39='(39) Bandit Leader' 40='(40) Bank Employee'
                  41='(41) Bank Page' 42='(42) Bank Robber' 43='(43) Bar Keeper'
                  44='(44) Bar Maid' 45='(45) Bar Owner' 46='(46) Bar Tender' 47='(47) Barber'
                  48='(48) Bartender' 49='(49) Baseball Player' 50='(50) Beef Carrier'
                  51='(51) Bell Boy' 52='(52) Bell Hop' 53='(53) Bike Repairman'
                  54='(54) Bill Poster' 55='(55) Blacksmith' 56='(56) Blastfurnace Wor'
                  57='(57) Boarding Hse Opr' 58='(58) Boarding Hse Own'
                  59='(59) Boat Laborer' 60='(60) Boat Worker' 61='(61) Boilermaker'
                  62='(62) Bookkeeper' 63='(63) Booksalesman' 64='(64) Bootblack'
                  65='(65) Bootlegger' 66='(66) Bordello Owner' 67='(67) Bound Servant'
                  68='(68) Bowling Pinboy' 69='(69) Box Salesman' 70='(70) Boxer'
                  71='(71) Brass Finisher' 72='(72) Brewer' 73='(73) Brewery Worker'
                  74='(74) Brick Mason' 75='(75) Bricklayer' 76='(76) Brickmaker'
                  77='(77) British Deserter' 78='(78) British Soldier' 79='(79) Broom Maker'
                  80='(80) Buffalo Hunter' 81='(81) Bldg Contractor'
                  82='(82) Building Super' 83='(83) Bulldozer Operat' 84='(84) Burglar'
                  85='(85) Bus Boy' 86='(86) Bus Driver' 87='(87) Businessman' 88='(88) Butcher'
                  89='(89) Butcher''s Helper' 90='(90) Butler' 91='(91) Cabdriver'
                  92='(92) Cabinet Maker' 93='(93) Caddy' 94='(94) Cafe Employee'
                  95='(95) Cafe Operator' 96='(96) Cafe Owner' 97='(97) Cafe Porter'
                  98='(98) Canal Boat Wrkr' 99='(99) Canal Laborer' 100='(100) Candy Dealer'
                  101='(101) Candy Maker' 102='(102) Cannery Worker'
                  103='(103) Capt. Salv Army' 104='(104) Captain' 105='(105) Car Washer'
                  106='(106) Carnival Worker' 107='(107) Carnvial Owner' 108='(108) Carpenter'
                  109='(109) Carpenter''s Help' 110='(110) Carriage Maker'
                  111='(111) Cattleman' 112='(112) Caulker' 113='(113) CCC Worker'
                  114='(114) Cement Worker' 115='(115) Charcoal Dealer' 116='(116) Chauffeur'
                  117='(117) Chef' 118='(118) Chemist' 119='(119) Chemist Helper'
                  120='(120) Chicken Farmer' 121='(121) Chief' 122='(122) Chimney Sweep'
                  123='(123) Church Janitor' 124='(124) Cigar Dealer' 125='(125) Cigar Maker'
                  126='(126) Circus Laborer' 127='(127) Circus Roustabou'
                  128='(128) Citrus Rancher' 129='(129) Citrus Worker'
                  130='(130) City Employee' 131='(131) Claims Locator' 132='(132) Clergy'
                  133='(133) Clergyman' 134='(134) Clerk' 135='(135) Clothes Presser'
                  136='(136) Clubmanger' 137='(137) Coachman' 138='(138) Coal Co. Emplyee'
                  139='(139) Coal Hauler' 140='(140) Coal Miner' 141='(141) Coal Thief'
                  142='(142) Coal Wagon Drive' 143='(143) Cobbler' 144='(144) College Prof'
                  145='(145) College Student' 146='(146) Collier' 147='(147) Colliery Worker'
                  148='(148) Colonial Offcial' 149='(149) Commission Merch'
                  150='(150) Compositor' 151='(151) Computer Program' 152='(152) Con Man'
                  153='(153) Confed Deserter' 154='(154) Constable' 155='(155) Construction'
                  156='(156) Constructn Formn' 157='(157) Constructn Labor'
                  158='(158) Constructn Workr' 159='(159) Contractor' 160='(160) Convict'
                  161='(161) Convict Guard' 162='(162) Convict Servant'
                  163='(163) Convict Trustee' 164='(164) Cook' 165='(165) Cottonmill Workr'
                  166='(166) Councilor' 167='(167) Counterfeiter' 168='(168) County Official'
                  169='(169) Courier' 170='(170) Cowboy' 171='(171) Cowhand'
                  172='(172) Crane Operator' 173='(173) Criminal' 174='(174) Cult Leader'
                  175='(175) Dairy Operator' 176='(176) Dairyman' 177='(177) Dance Hall Owner'
                  178='(178) Dancer' 179='(179) Debt Collector' 180='(180) Deckhand'
                  181='(181) Delivery Boy' 182='(182) Delivery Man' 183='(183) Dental Student'
                  184='(184) Dentist' 185='(185) Deputy Sheriff' 186='(186) Deserted Sailor'
                  187='(187) Deserter' 188='(188) Detective' 189='(189) Dischrgd Marine'
                  190='(190) Dischrgd Soldier' 191='(191) Dishwasher' 192='(192) Distillery'
                  193='(193) Distillery Workr' 194='(194) Dockworker' 195='(195) Domestic'
                  196='(196) Domestic Cook' 197='(197) Domestic Servant'
                  198='(198) Domestic Worker' 199='(199) Donut Salesman' 200='(200) Door Maker'
                  201='(201) Draft Evader' 202='(202) Draftsman' 203='(203) Drayman'
                  204='(204) Drifter' 205='(205) Drink Distrbutor' 206='(206) Driver'
                  207='(207) Drover' 208='(208) Drug Counselor' 209='(209) Drug Dealer'
                  210='(210) Druggist' 211='(211) Drugstore Clerk' 212='(212) Editor'
                  213='(213) Elctrcl Engineer' 214='(214) Electrician'
                  215='(215) Elephant Trainer' 216='(216) Elevator Oper' 217='(217) Engineer'
                  218='(218) Engraver' 219='(219) Entertainer' 220='(220) Escaped Convict'
                  221='(221) Escap Mental Pat' 222='(222) Escaped Prisoner'
                  223='(223) Ex Constable' 224='(224) Ex Convict' 225='(225) Ex Deputy Sherif'
                  226='(226) Ex Lawman' 227='(227) Ex Police Chief' 228='(228) Ex Policeman'
                  229='(229) Ex Reformatory' 230='(230) Ex Sailor' 231='(231) Ex Soldier'
                  232='(232) Express Employee' 233='(233) Factory Executv'
                  234='(234) Factory Foreman' 235='(235) Factory Worker' 236='(236) Farm Hand'
                  237='(237) Farm Laborer' 238='(238) Farm Manager' 239='(239) Farm Supervisor'
                  240='(240) Farm Worker' 241='(241) Farmer' 242='(242) Farmer/Laborer'
                  243='(243) Fence' 244='(244) Ferryman' 245='(245) FHA Executive'
                  246='(246) Fiddler' 247='(247) Fireman' 248='(248) Fish Peddler'
                  249='(249) Fisherman' 250='(250) Flatboat Worker' 251='(251) Florist'
                  252='(252) Florist Assistnt' 253='(253) Fodder Contractr' 254='(254) Foreman'
                  255='(255) Forger' 256='(256) Fork Lift Opertr' 257='(257) Fortune Teller'
                  258='(258) Foundry Worker' 259='(259) Freedman' 260='(260) Freeman'
                  261='(261) Freighter' 262='(262) Fruit Peddler' 263='(263) Fruit Stand Empl'
                  264='(264) Fry Cook' 265='(265) Fugitive' 266='(266) Furniture Refin'
                  267='(267) Furrier' 268='(268) Furtrader' 269='(269) Gambler'
                  270='(270) Gang Leader' 271='(271) Gang Member' 272='(272) Gangster'
                  273='(273) Garage Attendant' 274='(274) Garage Man' 275='(275) Garage Owner'
                  276='(276) Garage Worker' 277='(277) Garbageman' 278='(278) Gardener'
                  279='(279) Gas Dealer' 280='(280) Gas Station Att'
                  281='(281) Gas Station Empl' 282='(282) Gas Station Own'
                  283='(283) General Contract' 284='(284) Glass Blower'
                  285='(285) Glass Designer' 286='(286) Glass Worker' 287='(287) Goat Herder'
                  288='(288) Gold Prospector' 289='(289) Golf Caddy'
                  290='(290) Government Clerk' 291='(291) Govt Employee'
                  292='(292) Grave Robber' 293='(293) Grocer' 294='(294) Grocery Clerk'
                  295='(295) Grounds Keeper' 296='(296) Guerilla' 297='(297) Guide'
                  298='(298) Gunman' 299='(299) Gunsmith' 300='(300) Hand Cart Driver'
                  301='(301) Handyman' 302='(302) Harness Maker' 303='(303) Hearse Driver'
                  304='(304) Heavy Equip Oper' 305='(305) Herb Doctor' 306='(306) H.S. Student'
                  307='(307) Hired Gun' 308='(308) Hiwayman' 309='(309) Hobo'
                  310='(310) Hoisery Knitter' 311='(311) Homesteader' 312='(312) Horse Breaker'
                  313='(313) Horse Dealer' 314='(314) Horse Trader'
                  315='(315) Hospital Emplyee' 316='(316) Hospital Orderly' 317='(317) Hostler'
                  318='(318) Hotel Bellman' 319='(319) Hotel Employee' 320='(320) Hotel Owner'
                  321='(321) Hotel Porter' 322='(322) Hotel Proprietor'
                  323='(323) Hotel Steward' 324='(324) House Boy' 325='(325) House Maid'
                  326='(326) House Painter' 327='(327) Housekeeper' 328='(328) Housewife'
                  329='(329) Hunter' 330='(330) Importer' 331='(331) Indentured Serv'
                  332='(332) Industrial Workr' 333='(333) Innkeeper'
                  334='(334) Insurance Agent' 335='(335) Interior Decorat'
                  336='(336) Interpreter' 337='(337) Inventor' 338='(338) Ironworker'
                  339='(339) Itinerant Hndymn' 340='(340) Itinerant Labr'
                  341='(341) Itinerant Worker' 342='(342) Jail Escapee'
                  343='(343) Jail Prisoner' 344='(344) Jailer' 345='(345) Janitor'
                  346='(346) Janitor-Watchman' 347='(347) Jeweler' 348='(348) Jitney Driver'
                  349='(349) Jockey' 350='(350) Journeyman Tailr' 351='(351) Junk Dealer'
                  352='(352) Labor Contractor' 353='(353) Labor Organizer'
                  354='(354) Labor Racketeer' 355='(355) Laborer' 356='(356) Landlady'
                  357='(357) Laundry Owner' 358='(358) Laundry Worker' 359='(359) Laundryman'
                  360='(360) Lawn Mowr Repair' 361='(361) Lawyer' 362='(362) Lingerie Sales'
                  363='(363) Livery Employee' 364='(364) Livery Proprietr'
                  365='(365) Locksmith' 366='(366) Logger' 367='(367) Longshoreman'
                  368='(368) Loom Fixer' 369='(369) Lumberjack' 370='(370) Lumberman'
                  371='(371) Lumbermill Labor' 372='(372) Lumbermill Owner'
                  373='(373) Lumbermill Workr' 374='(374) Lunatic' 375='(375) Machine Operator'
                  376='(376) Machine Tool Opr' 377='(377) Machinist' 378='(378) Magazine Sales'
                  379='(379) Maid' 380='(380) Mailman' 381='(381) Male Nurse' 382='(382) Marine'
                  383='(383) Mason' 384='(384) Mason''s Help' 385='(385) Master Criminal'
                  386='(386) Mat Maker' 387='(387) Meat Cutter' 388='(388) Meat Packer'
                  389='(389) Meat Provider' 390='(390) Mechanic' 391='(391) Mechncl Engineer'
                  392='(392) Medical Prof' 393='(393) Medical Student'
                  394='(394) Medicine Vendor' 395='(395) Mental Patient' 396='(396) Merchant'
                  397='(397) Merchant Marine' 398='(398) Merchant Seaman' 399='(399) Messboy'
                  400='(400) Messenger' 401='(401) Metal Insp' 402='(402) Mexican Bandit'
                  403='(403) Migrant Farm Wkr' 404='(404) Migrant Laborer'
                  405='(405) Migrant Worker' 406='(406) Military Emplyee' 407='(407) Milkman'
                  408='(408) Mill Foreman' 409='(409) Mill Operator' 410='(410) Mill Worker'
                  411='(411) Miller' 412='(412) Milliner' 413='(413) Millwright'
                  414='(414) Mine Digger' 415='(415) Mine Owner' 416='(416) Mine Watchman'
                  417='(417) Miner' 418='(418) Mining Engineer' 419='(419) Minister'
                  420='(420) Molder' 421='(421) Moonshiner' 422='(422) Mormon Bishop'
                  423='(423) Mortician' 424='(424) Mover' 425='(425) Music Teacher'
                  426='(426) Musician' 427='(427) Mystic' 428='(428) Navy Airman'
                  429='(429) Navy Deserter' 430='(430) Navy Veteran'
                  431='(431) Navy Yard Worker' 432='(432) Neon Sign Hanger'
                  433='(433) News Vendor' 434='(434) Newsboy' 435='(435) Newspaper Carrie'
                  436='(436) Night Watchman' 437='(437) Nightclub Entrnr'
                  438='(438) Nightclub Owner' 439='(439) Novelty Salesman' 440='(440) Nurse'
                  441='(441) Odd Jobs' 442='(442) Office Boy' 443='(443) Office Manager'
                  444='(444) Oil Driller' 445='(445) Oil Roustabout'
                  446='(446) Oilfield Worker' 447='(447) Optical Worker' 448='(448) Optician'
                  449='(449) Orchestra Condct' 450='(450) Outlaw' 451='(451) Overseer'
                  452='(452) Oyster Dredger' 453='(453) Oysterpicker' 454='(454) P.O.W'
                  455='(455) Packing Co. Frmn' 456='(456) Painter'
                  457='(457) Painter''s Helper' 458='(458) Paintstore Workr'
                  459='(459) Pamo Chief' 460='(460) Pants Presser' 461='(461) Paper Worker'
                  462='(462) Park Guide' 463='(463) Parking Attendnt'
                  464='(464) Paroled Convict' 465='(465) Parolee' 466='(466) Peddler'
                  467='(467) Pest Control Sal' 468='(468) Pest Exterminatr'
                  469='(469) Petty Crook' 470='(470) Pharmacist' 471='(471) Pharmacy Clerk'
                  472='(472) Physician' 473='(473) Piano Player' 474='(474) Pimp' 475='(475) Pirate'
                  476='(476) Pirate Captain' 477='(477) Plant Worker'
                  478='(478) Plantation Workr' 479='(479) Planter' 480='(480) Plasterer'
                  481='(481) Playboy' 482='(482) Plumber' 483='(483) Plumber''s Helper'
                  484='(484) Poet' 485='(485) Policeman' 486='(486) Policy Writer'
                  487='(487) Politician' 488='(488) Ponyexpress' 489='(489) Pool Hall Owner'
                  490='(490) Pool Room Owner' 491='(491) Porter' 492='(492) Porter/Waiter'
                  493='(493) Postal Clerk' 494='(494) Postmaster' 495='(495) Poultry Farmer'
                  496='(496) Preacher' 497='(497) Priest' 498='(498) Printer'
                  499='(499) Printer-Poet' 500='(500) Prison Guard' 501='(501) Prisoner'
                  502='(502) Produce Clerk' 503='(503) Produce Laborer'
                  504='(504) Produce Merchant' 505='(505) Produce Salesman'
                  506='(506) Produce Trader' 507='(507) Produce Worker'
                  508='(508) Projectionist' 509='(509) Prostitute' 510='(510) Pugilist'
                  511='(511) Pullman Porter' 512='(512) Pulp Worker'
                  513='(513) Purchasing Agent' 514='(514) Quarry Worker' 515='(515) Racketeer'
                  516='(516) Radio Repairman' 517='(517) Rafter' 518='(518) Rag Picker'
                  519='(519) Railroad Agent' 520='(520) Railroad Brakemn'
                  521='(521) Railroad Clerk' 522='(522) Railroad Emplyee'
                  523='(523) Railroad Engneer' 524='(524) Railroad Fireman'
                  525='(525) Railroad Foreman' 526='(526) Railroad Laborer'
                  527='(527) Railroad Machnst' 528='(528) Railroad Shop Wk'
                  529='(529) Railroad Switchm' 530='(530) Railroad Worker'
                  531='(531) Railsplitter' 532='(532) Railway Cook' 533='(533) Ranch Foreman'
                  534='(534) Ranch Hand' 535='(535) Ranch Laborer' 536='(536) Ranch Manager'
                  537='(537) Rancher' 538='(538) Range Rider' 539='(539) Real Estate'
                  540='(540) Real Estate Agnt' 541='(541) Realtor' 542='(542) Refinery Worker'
                  543='(543) Reformtry Escpee' 544='(544) Reformtry Inmate'
                  545='(545) Reformtry Parlee' 546='(546) Relief Worker'
                  547='(547) Religious Neophy' 548='(548) Repairman'
                  549='(549) Restaurant Mngr' 550='(550) Restaurant Oper'
                  551='(551) Restaurant Owner' 552='(552) Restaurant Workr'
                  553='(553) Retarded' 554='(554) Retired Baker' 555='(555) Retired Grocer'
                  556='(556) Retired Soldier' 557='(557) Reverend' 558='(558) Revolutionary'
                  559='(559) Rigger' 560='(560) River Barge Wrkr' 561='(561) Riverboat Hand'
                  562='(562) Roadhouse Opertr' 563='(563) Rodeo Cowboy'
                  564='(564) Roof Painter' 565='(565) Roofer' 566='(566) Roofing Salesman'
                  567='(567) Rooming Hse Ownr' 568='(568) Roustabout' 569='(569) Rubber Worker'
                  570='(570) Rug Peddler' 571='(571) Rug Weaver' 572='(572) Runaway'
                  573='(573) Runaway Slave' 574='(574) Sailor' 575='(575) Sales'
                  576='(576) Sales Broker' 577='(577) Sales Manager' 578='(578) Salesman'
                  579='(579) Saloon Employee' 580='(580) Saloon Keeper'
                  581='(581) Saloon Owner' 582='(582) Saloon Porter' 583='(583) Sanitation'
                  584='(584) Sawmill Operator' 585='(585) Sawmill Worker'
                  586='(586) School Guard' 587='(587) School Teacher' 588='(588) Scriptwriter'
                  589='(589) Sculptor' 590='(590) Sea Captain' 591='(591) Seaman'
                  592='(592) Security Guard' 593='(593) Servant' 594='(594) Sharecropper'
                  595='(595) Sheet Mill Workr' 596='(596) Shepherd' 597='(597) Sheriff'
                  598='(598) Shingleworker' 599='(599) Ship Captain'
                  600='(600) Ship''s Carpenter' 601='(601) Ship''s Pilot'
                  602='(602) Shipmaster' 603='(603) Shipping Clerk' 604='(604) Shipyard Worker'
                  605='(605) Shoemaker' 606='(606) Shoeshiner' 607='(607) Silk Weaver'
                  608='(608) Silversmith' 609='(609) Singer' 610='(610) Slave' 611='(611) Smelterer'
                  612='(612) Smuggler' 613='(613) Social Worker' 614='(614) Soda Clerk'
                  615='(615) Soda Parlor Ownr' 616='(616) Soldier' 617='(617) Soldier Lt'
                  618='(618) Speakeasy Opertr' 619='(619) Speakeasy Owner'
                  620='(620) Spiritualist' 621='(621) Stableboy' 622='(622) Stage Driver'
                  623='(623) State Trooper' 624='(624) Steamboat Roustr'
                  625='(625) Steamboat Worker' 626='(626) Steamfitter'
                  627='(627) Steelmill Worker' 628='(628) Steelworker' 629='(629) Steeplejack'
                  630='(630) Stenographer' 631='(631) Stevedore' 632='(632) Steward'
                  633='(633) Stock Swindler' 634='(634) Stock Trader' 635='(635) Stockman'
                  636='(636) Stockyard Hand' 637='(637) Stone Mason'
                  638='(638) Stone Quarry Wkr' 639='(639) Stonecutter' 640='(640) Store Clerk'
                  641='(641) Store Keeper' 642='(642) Store Owner' 643='(643) Streetcar Conduc'
                  644='(644) Student' 645='(645) Surgeon' 646='(646) Tailor'
                  647='(647) Tavern Keeper' 648='(648) Tavern Owner' 649='(649) Taxi Driver'
                  650='(650) Teacher' 651='(651) Teamster' 652='(652) Telephone Repair'
                  653='(653) Temperance Workr' 654='(654) Tenant Farmer'
                  655='(655) Textile Worker' 656='(656) Theater Employee' 657='(657) Thief'
                  658='(658) Ticket Taker' 659='(659) Tiecutter' 660='(660) Tinker'
                  661='(661) Tinner' 662='(662) Tire Recapper' 663='(663) Tire Salesman'
                  664='(664) Tobacco Dealer' 665='(665) Tong Assassin' 666='(666) Tong Member'
                  667='(667) Tongsman' 668='(668) Tool Worker' 669='(669) Toolmaker'
                  670='(670) Tory Soldier' 671='(671) Tour Guide' 672='(672) Tourist'
                  673='(673) Towboat Hand' 674='(674) Tractor Driver'
                  675='(675) Trade School Stu' 676='(676) Trader' 677='(677) Tradesman'
                  678='(678) Train Engineer' 679='(679) Train Porter' 680='(680) Tramp'
                  681='(681) Transient' 682='(682) Transient Worker'
                  683='(683) Transit Employee' 684='(684) Trapper' 685='(685) Trapper/Hunter'
                  686='(686) Trash Collector' 687='(687) Tree Planter' 688='(688) Tribal Chief'
                  689='(689) Truck Driver' 690='(690) Truck Farmer' 691='(691) Tugboat Fireman'
                  692='(692) Tugboat Worker' 693='(693) Turpentine Workr'
                  694='(694) TV Repairman' 695='(695) Typesetter' 696='(696) Typewritr Repair'
                  697='(697) U.S. Marshall' 698='(698) Unemployed' 699='(699) Unemployed Labor'
                  700='(700) Unemplyd Mechanc' 701='(701) Union Organizer'
                  702='(702) Unlicnsd Physicn' 703='(703) Upholsterer'
                  704='(704) Upholstrr''s Help' 705='(705) Utilties Emplyee'
                  706='(706) Utilities Managr' 707='(707) Vagrant' 708='(708) Valet'
                  709='(709) Vaudeville' 710='(710) Veteran' 711='(711) Veteran Pensionr'
                  712='(712) Veterinarian' 713='(713) Vocational Stu' 714='(714) Voodoo Doctor'
                  715='(715) Wagon Boss' 716='(716) Wagon Driver' 717='(717) Wagoneer'
                  718='(718) Waiter' 719='(719) Waitress' 720='(720) Wall Washer'
                  721='(721) War Plant Worker' 722='(722) Warehouse Porter'
                  723='(723) Warehouse Worker' 724='(724) Watchman' 725='(725) Weaver'
                  726='(726) Welder' 727='(727) Whaler' 728='(728) Wheel Wright'
                  729='(729) Whiskey Smuggler' 730='(730) Whisky Runner' 731='(731) Widow'
                  732='(732) Windowdresser' 733='(733) Winery Employee'
                  734='(734) Wood Chopper' 735='(735) Wood Cutter' 736='(736) Wood Dealer'
                  737='(737) Wood Sawer' 738='(738) Wood Worker' 739='(739) Woodsman'
                  740='(740) WPA Water Boy' 741='(741) WPA Worker' 742='(742) Writer'
                  743='(743) Yardman' 800='(800) A/C Repairman' 801='(801) Autobody Rep'
                  802='(802) Babysitter' 803='(803) Bouncer' 804='(804) Caretaker'
                  805='(805) Cashier' 806='(806) Clerical' 807='(807) Clown'
                  808='(808) Coll. Graduate' 809='(809) Correction Off'
                  810='(810) Directcaretek' 811='(811) Dispatcher' 812='(812) Drywaller'
                  813='(813) Dump Truck Driver' 814='(814) Informant'
                  815='(815) Insur. Investor' 816='(816) Landscaping' 817='(817) Maintenance'
                  818='(818) Manager' 819='(819) Noble' 820='(820) Nurse Assist'
                  821='(821) Nursesaide' 822='(822) Press Operat' 823='(823) Produce Manager'
                  824='(824) Radiator Repai' 825='(825) Relief Worker Assist'
                  826='(826) Repo Man' 827='(827) Roughneck' 828='(828) Shrimper'
                  829='(829) Stock Broker' 830='(830) Stripper'
                  900='(900) Heavy Equip Oper/Carpenter' 901='(901) Laborer/Truck Driver'
                  902='(902) Painter/Mechanic' 903='(903) Sales/Laborer'
                  904='(904) Student/Sales' 905='(905) Welder/Mechanic' ;
RUN;

* SAS DATA STEP;
DATA;
SET SAS-dataset ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (V5 = 0) THEN V5 = .;
   IF (V6 = 0) THEN V6 = .;
   IF (V8 = 0) THEN V8 = .;
   IF (V9 = 0) THEN V9 = .;
   IF (V10 = 0) THEN V10 = .;
   IF (V11 = 0) THEN V11 = .;
   IF (V12 = 0) THEN V12 = .;
   IF (V13 = 0) THEN V13 = .;
   IF (V17 = 0) THEN V17 = .;
   IF (V19 = 0) THEN V19 = .;
   IF (V20 = 0) THEN V20 = .;
   IF (V21 = 0) THEN V21 = .;
*/

* SAS FORMAT STATEMENT;

  FORMAT V2 V2ffffff. V3 V3ffffff. V5 V5ffffff.
         V6 V6ffffff. V8 V8ffffff. V9 V9ffffff.
         V10 V10fffff. V11 V11fffff. V12 V12fffff.
         V13 V13fffff. V15 V15fffff. V16 V16fffff.
         V18 V18fffff. V19 V19fffff. V20 V20fffff.
         V21 V21fffff.  ;

RUN ;
