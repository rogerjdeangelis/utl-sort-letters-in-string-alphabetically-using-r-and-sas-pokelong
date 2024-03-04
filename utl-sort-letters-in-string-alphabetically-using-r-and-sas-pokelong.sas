%let pgm=utl-sort-letters-in-string-alphabetically-using-r-and-sas-pokelong;

Sort letters in string alphabetically pokelong

    Two Solutions

         1 sas
         2 r

github
https://tinyurl.com/budw93x4
https://github.com/rogerjdeangelis/utl-sort-letters-in-string-alphabetically-using-r-and-sas-pokelong

related repos                                                                                                   
                                                                                                                
https://github.com/rogerjdeangelis/utl-attempt-to-call-fcmp-containing-pokelong-from-sql                        
https://github.com/rogerjdeangelis/utl-count-the-number-of-zeros-ones-and-twos-in-a-numeric-array-adr-peek-poke 
https://github.com/rogerjdeangelis/utl-using-peek-and-poke-to-conditionally-sum-subsets-of-an-array             
                                                                                                                
see
https://goo.gl/JCOrym
http://stackoverflow.com/questions/43812674/sort-letters-in-string-alphabetically-sas

user667489 profile
http://stackoverflow.com/users/667489/user667489

/**************************************************************************************************************************/
/*                                                                                                                        */
/*          INPUT                                             PROCESS                     OUTPUT                          */
/*                                                                                                                        */
/*                                                                                                                        */
/* %let str=the quick brown fox jumps over the lazy dog;                  SORTED_SAS=abcdeeefghhijklmnoooopqrrsttuuvwxyz  */
/*                                                        SAS             SORTED_R  =abcdeeefghhijklmnoooopqrrsttuuvwxyz  */
/*                                                        ===                                                             */
/*                                                                                                                        */
/*                                                        data _null_;                                                    */
/*                                                         myword = "&str";                                               */
/*                                                         array letters[%length(&str)] $1 ;                              */
/*                                                         call pokelong(myword                                           */
/*                                                          ,addrlong(letters1),%length(&str));                           */
/*                                                         call sortc(of letters[*]);                                     */
/*                                                         myword = cat(of letters[*]);                                   */
/*                                                         call symputx('sorted_sas',myword);                             */
/*                                                        run;quit;                                                       */
/*                                                                                                                        */
/*                                                        %put &=sorted_sas;                                              */
/*                                                                                                                        */
/*                                                        R                                                               */
/*                                                        =                                                               */
/*                                                                                                                        */
/*                                                        %utl_submit_r64x("                                              */
/*                                                        library(gdata);                                                 */
/*                                                        library(Tmisc);                                                 */
/*                                                        srt<-trim(strSort('&str'));                                     */
/*                                                        writeClipboard(srt);                                            */
/*                                                        ",return=sorted_r);                                             */
/*                                                                                                                        */
/*                                                        %put &=sorted_r;                                                */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

%let str=the quick brown fox jumps over the lazy dog;

/*
/ |  ___  __ _ ___
| | / __|/ _` / __|
| | \__ \ (_| \__ \
|_| |___/\__,_|___/

*/


data _null_;
 myword = "&str";
 array letters[%length(&str)] $1 ;
 call pokelong(myword
  ,addrlong(letters1),%length(&str));
 call sortc(of letters[*]);
 myword = cat(of letters[*]);
 put myword=;
 call symputx('sorted_sas',myword);
run;quit;

%put &=sorted_sas;


/**************************************************************************************************************************/
/*                                                                                                                        */
/* %put &=sorted_sas;                                                                                                     */
/*                                                                                                                        */
/* SORTED_SAS=abcdeeefghhijklmnoooopqrrsttuuvwxyz                                                                         */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___
|___ \   _ __
  __) | | `__|
 / __/  | |
|_____| |_|

*/

%utl_submit_r64x("
library(gdata);
library(Tmisc);
srt<-trim(strSort('&str'));
writeClipboard(srt);
",return=sorted_r);

%put &=sorted_r;

/**************************************************************************************************************************/
/* %put &=sorted_r;                                                                                                       */
/*                                                                                                                        */
/* SORTED_R=abcdeeefghhijklmnoooopqrrsttuuvwxyz                                                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
