Write-Host "Downloading the latest scripts...." 

## Downloads the latest docker-compose file and manifest-docker-install powershell script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/matt953/Windows-Docker/master/manifest-docker-install.ps1" -outfile "manifest-docker-install.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/matt953/Windows-Docker/master/docker-compose.yml" -outfile "docker-compose.yml"

Write-Host "updating...." 

## If Manifest is running this command will stop the instance while the update takes place
docker-compose down

## Pulls the latest docker-images based on the downloaded docker-compose file
docker-compose pull

## Runs the manifest-docker-install script which will restart the manifest instance with the updated images as well as reconfirming all of the required enviroment variables
$PSScriptRoot
& "$PSScriptRoot\manifest-docker-install.ps1"



