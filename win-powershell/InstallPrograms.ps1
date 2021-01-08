#Find all executable files and run them one by one pausing inbetween each of them.
$childItems = Get-ChildItem -Path .\*.exe -Name
$childItemsMsi = Get-ChildItem -Path .\*.msi -Name
foreach($item in $childItems){
    $filePath = ".\" + $item
	&$filePath
	Pause
}
foreach($item in $childItemsMsi){
    $filePath = ".\" + $item
    #If installer is Automate, Enter a check loop if it installed or failed. If it failed, the while returns true and the loop continues until it gets installed.
    if($filePath -contains "Agent*"){
        &$filePath /passive
        Pause
        &$filePath /passive
        Pause
    }
    else{
	    &$filePath /passive
	    Pause
    }
}
