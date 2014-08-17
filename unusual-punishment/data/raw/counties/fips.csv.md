# County FIPS Codes
 
## Where I got them
County FIPS codes, as found in the fips.csv file, were found on the Census Bureau [here](http://www.census.gov/geo/reference/codes/files/national_county.txt). You can replicate the steps I took to get them by going [here](http://www.census.gov/geo/reference/codes/cou.html).

## Their format
1. State
2. State ANSI
3. County ANSI
4. County Name
5. ANSI Cl

Note that for field 5:

> FIPS Class Codes
> H1:  identifies an active county or statistically equivalent entity that does not qualify under subclass C7 or H6.
> H4:  identifies a legally defined inactive or nonfunctioning county or statistically equivalent entity that does not qualify under subclass H6.
> H5:  identifies census areas in Alaska, a statistical county equivalent entity.
> H6:  identifies a county or statistically equivalent entity that is areally coextensive or governmentally consolidated with an incorporated place, part of an incorporated place, or a consolidated city. 
> C7:  identifies an incorporated place that is an independent city; that is, it also serves as a county equivalent because it is not part of any county, and a minor civil division (MCD) equivalent because it is not part of any MCD.

Note that the "County Name" field includes, unfortunately, a trailing "county", meaning that in order to compare it to county names, you may need to scrub the name and do some processing.