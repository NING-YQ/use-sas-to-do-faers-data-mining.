





data drug drugelse;  
    set rowdata.drug;  
    if index(drugname, 'RITUXIMAB') > 0 or index(prod_ai, 'RITUXIMAB') > 0 then do;  
        output drug;  
    end;  
    else do;  
        output drugelse;  
    end;  
run;



proc sql;  
    create table Reac as  
    select *  
    from rowdata.reac  
    where primaryid in (select distinct primaryid from drug) ;  
quit; 


proc sql;  
    create table Reacelse as  
    select *  
    from rowdata.reac  
    where primaryid in (select distinct primaryid from drugelse) ;  
quit; 
