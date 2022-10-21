function Add-Migration {
    param (
        [string] $Name
    )

    if ([string]::IsNullOrWhiteSpace($Name)) {
        Write-Error "The migration must have a name!"

        return;
    }
    if ($Name -like "* *") {
        Write-Error "You should not have spaces in your migration names";

        return;
    }
    
    Invoke-Expression ("dotnet ef --startup-project ../../../AspNetCore migrations add '" + $Name + "' --context FoodDbContext")
}

function Remove-Migration
{
    Invoke-Expression ("dotnet ef --startup-project ../../../AspNetCore migrations remove --context FoodDbContext")
}

$command = $args[0];
switch ($command) {
    "add" {
        Add-Migration($args[1]);

        break;
    }
    "remove" {
        Remove-Migration;

        break;
    }
    Default {
        Write-Error "Unknown command";
    }
}