/*-------------------------------------------------------------------------*
 |                                                                         
 |              STATA COMPANION PROGRAM FILE FOR ICPSR 08451
 |       EXECUTIONS IN THE UNITED STATES, 1608-2002: THE ESPY FILE
 |
 |
 | This Stata missing value recode program is provided for optional use with
 | the Stata system version of this data file as distributed by ICPSR.
 | The program replaces user-defined numeric missing values (e.g., -9)
 | with generic system missing "."  Note that Stata allows you to specify
 | up to 27 unique missing value codes.  Only variables with user-defined
 | missing values are included in this program.
 |
 | To apply the missing value recodes, users need to first open the
 | Stata data file on their system, apply the missing value recodes if
 | desired, then save a new copy of the data file with the missing values
 | applied.  Users are strongly advised to use a different filename when
 | saving the new file.
 |
 *------------------------------------------------------------------------*/

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


