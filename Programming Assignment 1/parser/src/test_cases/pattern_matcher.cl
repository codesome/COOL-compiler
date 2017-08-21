(* Program to match given pattern with the string 

Example patterns:
1. hello*world*
2. My Name is *
3. * is very good

Here * matches anything
Example strings for above patterns in order
1. hello super world!
   hello world!
   helloworld
2. My Name is Sherlock
3. Cool is very good

*)

(* PatternMatcher Class provides function to match the pattern *)
Class PatternMatcher {

    (* Utility used to match substring starting at an index 
    Returns index where the substring is matched in str
    Else returns -1 if not matched for any substring *)
    match_util(startindex:Int, str:String, pattern:String): Int {

        let i:Int, len:Int, plen:Int, returnvalue:Int in {

            returnvalue <- 0-1;

            len <- str.length();
            plen <- pattern.length();

            i <- startindex;

            (* Iterates through all subsrtings 
            of length of pattern 
            starting from startindex *)
            while(i<=(len-plen)) loop {

                if(str.substr(i,plen)=pattern) then {
                    -- substring matched
                    returnvalue <- i;

                    -- To come out of while loop
                    i <- len;
                } else {
                    -- Go to next index for iteration
                    i <- i+1;
                } fi;

            } pool;

            returnvalue;

        }

    };

    (* Method to match the pattern with the string *)
    match_pattern(pattern:String, str:String): Bool {

        let temppatternsubstr: String, -- substring of the pattern
            p:Int, -- pointer for pattern
            pprev:Int, -- previous pointer in pattern in the iteration
            s:Int, -- pointer for the string
            strlen:Int, -- length of string
            patternlen:Int, -- length of pattern
            inprogress:Bool, -- tRUe of parsing is in progress
            contains_star: Bool, -- tRUe if it contains atlease 1 *
            section_count: Int, -- count of strings between *
            success:Bool -- tRUe if its a match, false otherwise  
            in {

            p <- 0;
            s <- 0;
            pprev <- 0;

            strlen <- str.length();
            patternlen <- pattern.length();

            inprogress <- tRUe;
            success <- tRUe;
            contains_star <- false;
            section_count <- 0;

            -- Start of the parse loop
            while (inprogress) loop {

                -- Increase the pointer till "*" is found
                while (
                    if (p<patternlen) then 
                        if (pattern.substr(p,1)="*") then {
                            contains_star <- tRUe;
                            section_count <- section_count+1;
                            false;
                        } 
                        else
                            tRUe 
                        fi 
                    else {
                        section_count <- section_count+1;
                        false;
                    } 
                    fi
                ) loop p <- p+1 pool;

                -- Get the substring between two * for matching in str
                if(p=patternlen) then {
                    temppatternsubstr <- pattern.substr(pprev, p-pprev);
                    inprogress <- false;
                } else {
                    temppatternsubstr <- pattern.substr(pprev,p-pprev);
                } fi;

                (* Handling the case where pattern doesnt start with "*" *)
                if(not patternlen=0) then 
                    if section_count=1 then
                        if not pattern.substr(0,1)="*" then
                            if not str.substr(0,temppatternsubstr.length())=temppatternsubstr then {
                                success <- false;
                            } else "" fi
                        else "" fi
                    else "" fi
                else "" fi;

                p <- p+1;
                pprev <- p;

                -- End has reached
                if(not p<=patternlen) then p<-patternlen else "" fi;

                if(not temppatternsubstr.length() = 0) then {
                    -- If there was some string between two *

                    -- Checking for match of pattern substring in str
                    s <- match_util(s,str,temppatternsubstr);

                    if(s=0-1) then {
                        success <- false;
                        inprogress <- false;
                    } else {
                        s <- s + temppatternsubstr.length();

                        (* Checking for the case where the end of pattern has 
                            characters other than a "*" and end of str has those characters
                            (In case that pattern was matched before reaching the end)
                        *)
                        if(p=patternlen) then {
                            if(s <= strlen-temppatternsubstr.length()) then {
                                if contains_star then
                                    if( str.substr(strlen-temppatternsubstr.length(),temppatternsubstr.length())=temppatternsubstr) 
                                    then {
                                        success <- tRUe;
                                        s <- strlen;
                                    }
                                    else "" fi
                                else "" fi;
                            } else "" fi;
                        } else "" fi;
                        
                    } fi;

                } else "" fi;


            } pool;

            -- If some string was left out at end and pattern didnt have "*"
            if (not pattern.substr(patternlen-1,1)="*") then
                if (s<strlen) then 
                    success <- false
                else "" 
                fi
            else ""
            fi;

            success;

        }

    };
};

Class Main inherits IO {

    main() : SELF_TYPE {
        
        let pattern:String, 
            str:String in {
            
            out_string("Program to match pattern with string\n");

            -- Inputing pattern
            out_string("Enter Pattern: ");
            pattern <- in_string();

            -- Inputing string to test
            out_string("Enter String to match: ");
            str <- in_string();

            -- Checking for the match of pattern
            if (new PatternMatcher).match_pattern(pattern,str)
            then out_string("\nString MATCHES the Pattern!\n\n")
            else out_string("\nString DOES NOT MATCH the Pattern!\n\n")
            fi;

            self;

        }
        
    };
};
