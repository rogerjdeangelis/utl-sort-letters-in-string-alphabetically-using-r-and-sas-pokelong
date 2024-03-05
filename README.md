# utl-sort-letters-in-string-alphabetically-using-r-and-sas-pokelong
Sort letters in string alphabetically pokelong
    %let pgm=utl-sort-letters-in-string-alphabetically-using-r-and-sas-pokelong;

    Sort letters in string alphabetically pokelong

        Two Solutions

             1 sas
             2 r
             3 sas input @
               Bartosz Jablonski
               yabwon@gmail.com
               Clever use of blank 43 bytes using in l1-l43 @
             4 sas multiple strings
               Keintz, Mark
               mkeintz@outlook.com

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
    /* %let str=the quick brown fox jumps over the lazy dog;                1  SORTED_SAS=abcdeeefghhijklmnoooopqrrsttuuvwxyz */
    /*                                                        1. SAS        2  SORTED_R  =abcdeeefghhijklmnoooopqrrsttuuvwxyz */
    /*                                                        ======        3  STRING=abcdeeefghhijklmnoooopqrrsttuuvwxyz     */
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
    /*                                                        2. R                                                            */
    /*                                                        ====                                                            */
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
    /*                                                        3. SAS INPUT @                                                  */
    /*                                                        ===========                                                     */
    /*                                                                                                                        */
    /*                                                        %let l = %length(&str.);                                        */
    /*                                                                                                                        */
    /*                                                        data _null_;                                                    */
    /*                                                          infile cards;                                                 */
    /*                                                          input @;                                                      */
    /*                                                          length STRING $ &l.;                                          */
    /*                                                          string=symget('str');                                         */
    /*                                                          put string=;                                                  */
    /*                                                          _infile_=string;                                              */
    /*                                                          input (l1-l&l.) ($1.);                                        */
    /*                                                          call sortc(of L:);                                            */
    /*                                                          string = cats(of L:);                                         */
    /*                                                          put string=;                                                  */
    /*                                                          stop;                                                         */
    /*                                                        cards;                                                          */
    /*                                                        *                                                               */
    /*                                                        ;                                                               */
    /*                                                        run;                                                            */
    /*                                                                                                                        */
    /*                                                       4. sas multiple strings                                          */
    /*                                                                                                                        */
    /*                                                                                                                        */
    /*                                                        data before;                                                    */
    /*                                                          infile datalines;                                             */
    /*                                                          input string $char70.;                                        */
    /*                                                        datalines;                                                      */
    /*                                                        the quick brown fox jumps over the lazy dog                     */
    /*                                                        here is another phrase with lots of letters                     */
    /*                                                        when in the course of human events                              */
    /*                                                        run;                                                            */
    /*                                                                                                                        */
    /*                                                        data want (drop=_:);                                            */
    /*                                                          set before;                                                   */
    /*                                                          infile cards ;                                                */
    /*                                                          if _n_=1 then input  @;                                       */
    /*                                                          array _ltrs {70} $1;                                          */
    /*                                                          _infile_ = string;                                            */
    /*                                                          input (_LTRS1-_LTRS70) ($1.) @1 @@;                           */
    /*                                                          call sortc (of _ltrs{*});                                     */
    /*                                                          string=cats(of _ltrs{*});                                     */
    /*                                                        cards;                                                          */
    /*                                                        *                                                               */
    /*                                                        run;                                                            */
    /*                                                                                                                        */
    /*                                                        OUTPUT                                                          */
    /*                                                                                                                        */
    /*                                                        the quick brown fox jumps over the lazy dog                     */
    /*                                                        here is another phrase with lots of letters                     */
    /*                                                        when in the course of human events                              */
    /*                                                        as i walk through this world nothing can stop the duke of earl  */
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

    /*____                   _                   _       ____
    |___ /   ___  __ _ ___  (_)_ __  _ __  _   _| |_    / __ \
      |_ \  / __|/ _` / __| | | `_ \| `_ \| | | | __|  / / _` |
     ___) | \__ \ (_| \__ \ | | | | | |_) | |_| | |_  | | (_| |
    |____/  |___/\__,_|___/ |_|_| |_| .__/ \__,_|\__|  \ \__,_|
                                    |_|                 \____/
    */



    %let str=the quick brown fox jumps over the lazy dog;

    %let l = %length(&str.);

    data _null_;
      infile cards;
      input @;
      length STRING $ &l.;
      string=symget('str');
      put string=;
      _infile_=string;
      input (l1-l&l.) ($1.);
      call sortc(of L:);
      string = cats(of L:);
      put string=;
      stop;
    cards;
    *
    ;
    run;

    /*  _                     _ _   _       _            _        _
    | || |    _ __ ___  _   _| | |_(_)_ __ | | ___   ___| |_ _ __(_)_ __   __ _ ___
    | || |_  | `_ ` _ \| | | | | __| | `_ \| |/ _ \ / __| __| `__| | `_ \ / _` / __|
    |__   _| | | | | | | |_| | | |_| | |_) | |  __/ \__ \ |_| |  | | | | | (_| \__ \
       |_|   |_| |_| |_|\__,_|_|\__|_| .__/|_|\___| |___/\__|_|  |_|_| |_|\__, |___/
                                     |_|                                  |___/
    */

    proc datasets lib=work kill; run;quit;

    data before;
      infile datalines;
      input string $char70.;
    datalines;
    the quick brown fox jumps over the lazy dog
    here is another phrase with lots of letters
    when in the course of human events
    run;

    data want (drop=_:);
      set before;
      infile cards ;
      if _n_=1 then input  @;
      array _ltrs {70} $1;
      _infile_ = string;
      input (_LTRS1-_LTRS70) ($1.) @1 @@;
      call sortc (of _ltrs{*});
      string=cats(of _ltrs{*});
    cards;
    *
    run;

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /* INPUT                                                                                                                  */
    /* =====                                                                                                                  */
    /*                                                                                                                        */
    /* Obs    STRING                                                                                                          */
    /*                                                                                                                        */
    /*  1     the quick brown fox jumps over the lazy dog                                                                     */
    /*  2     here is another phrase with lots of letters                                                                     */
    /*  3     when in the course of human events                                                                              */
    /*  4     as i walk through this world nothing can stop the duke of earl                                                  */
    /*                                                                                                                        */
    /*                                                                                                                        */
    /* OUTPUT                                                                                                                 */
    /* ======                                                                                                                 */
    /*                                                                                                                        */
    /* Obs    STRING                                                                                                          */
    /*                                                                                                                        */
    /*  1     abcdeeefghhijklmnoooopqrrsttuuvwxyz                                                                             */
    /*  2     aaeeeeeefhhhhiillnoooprrrrsssstttttw                                                                            */
    /*  3     aceeeeefhhhimnnnnoorssttuuvw                                                                                    */
    /*  4     aaaacddeeefgghhhhhiiikklllnnnoooooprrrssstttttuuww                                                              */
    /*                                                                                                                        */
    /**************************************************************************************************************************/


    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */


