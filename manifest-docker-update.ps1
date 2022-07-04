Write-Host "Downloading the latest script...." 

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/matt953/Windows-Docker/master/manifest-docker-install.ps1" -outfile "manifest-docker-install.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/matt953/Windows-Docker/master/docker-compose.yml" -outfile "docker-compose.yml"

Write-Host "updating...." 
docker-compose down
docker-compose pull

$PSScriptRoot
& "$PSScriptRoot\manifest-docker-install.ps1"



