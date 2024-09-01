


 
        [CmdletBinding()]
        param (
            [Parameter(parametersetname='keyword')]
            [string]
            $keyword
            ,# 
            [Parameter(parametersetname='Name')]
            [validateset([item_class])]
            [string]
            $type
            ,
            # Parameter help description
            [Parameter(parametersetname='Name')]
            [validateset([item_name])]
            [string]
            $name
        )
        $itemlist = import-csv c:\ex-sys\csv\item.csv
        
        switch ($pscmdlet.parametersetname) {
            Name {
                
                $itemlist |Where-Object {$_.name -like "*$name*" -and $_.class -like "*$type*"}
             }

         keyword { 

            
            $itemlist |Where-Object {$_.name -like "*$keyword*"  -or $_.class -like "*$keyword*" }
         }
        } 
    

