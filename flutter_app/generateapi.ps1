param (
  $command, 
  $location = 'https://localhost:5000/swagger/v1/swagger.json',
  $path
)

function Get-WorkingPath {
  if ($path.Length -eq 0) {
    return Get-Location
  }

  return $path
}

function Get-Spec {
  $path = Get-WorkingPath
  $filePath = "$path\lib\swagger\zooinator.json"

  Invoke-RestMethod -Uri $location -Method Get -ContentType 'application/json' -Body @{} -OutFile $filePath
}

function Start-CodeGeneration {
  $path = Get-WorkingPath
  if (Test-Path -Path "$path\lib\generated_code\client_index.dart" -PathType Leaf) {
    Remove-Item "$path\lib\generated_code" -Recurse
  }
  Invoke-Expression "flutter pub run build_runner build"
}

switch ($command) {
  "remote" {
    Get-Spec
    Start-CodeGeneration

    break;
  }
  "local" {
    Start-CodeGeneration

    break;
  }
  Default {
    Write-Error "Unknown command"
  }
}