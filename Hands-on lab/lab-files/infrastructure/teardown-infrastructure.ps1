$studentprefix ="Your 3 letter abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix

$spobjectid = az ad sp list --display-name "fabmedical-$studentprefix" --query "[0].objectId" -o tsv 
az ad sp delete --id $spobjectid
az group delete --name $resourceGroupName

