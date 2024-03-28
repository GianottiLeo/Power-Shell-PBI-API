## Global Parameters Declaration

$ErrorActionPreference = "Stop"
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
$publicEndpoint = "https://api.powerbi.com"
$apiUrl = "https://api.powerbi.com/v1.0/myorg"

## Authentication Process

$username = "Global Account User"
$password = Get-Content -Path "Path to password" | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($username, $password)

## PBI Service Connection

Connect-PowerBIServiceAccount -Credential $cred | Out-Null
#Connect-PowerBIServiceAccount
#Login-PowerBI
$token = (Get-PowerBIAccessToken)["Authorization"]
$response = Invoke-WebRequest -Uri "$publicEndpoint/metadata/cluster" -Headers @{ "Authorization"=$token }
#$workspaceData = $response.Content | ConvertFrom-Json
$accessToken = $response.access_token

## API URL setup

function GetApiUrl() {
    $response = Invoke-WebRequest -Uri "$publicEndpoint/metadata/cluster" -Headers @{ "Authorization"=$token }
    $cluster = $response.Content | ConvertFrom-Json
    return $cluster.backendUrl
}
$API = GetApiUrl

### Main

## Goals Workspace Parameters Declaration

$workspaceId = "Workspace Id code"
$i = 1
$scorecardparameters = New-Object -TypeName System.Collections.Generic.List[Object]

## Scorecards Info

# Scorecards Links Extraction

$URLaux = $API + "v1.0/myorg/groups/$workspaceId/scorecards"
$scorecardinvoke = Invoke-RestMethod -Method Get -Uri $URLaux -Headers @{ "Authorization"=$token }
$scorecardinvoke.value | Export-CSV -Path "Path to IDs CSV file" -Force -notypeinformation
$values = Import-Csv -Path "Path to IDs CSV file" | Select-Object -ExpandProperty Id

# Scorecards Table Construction

foreach ($value in $values) {
    $URL2 = $API + "v1.0/myorg/groups/$workspaceId/scorecards/$value"
    $scorecardinvoke = Invoke-RestMethod -Method Get -Uri $URL2 -Headers @{ "Authorization"=$token } 
    $scorecardparameters.Add($scorecardinvoke)
    #$scorecardparameters
    $scorecardparameters[$i] | Export-CSV -Path "Path to CSV file to store all information regarding scorecards" -Append -Force -notypeinformation
}

## Goals Info 

# Goals Table Construction # Adding /goals to the URL we get detailed information of each card in the Goals with the $value link

foreach ($value in $values) {
    $URL2 = $API + "v1.0/myorg/groups/$workspaceId/scorecards($($values[$i]))/goals"
    $goalInvoke = Invoke-RestMethod -Method Get -Uri $URL2 -Headers @{ "Authorization"=$token } 
    $goalParameters.Add($goalInvoke)
    #$goalParameters
    $goalParameters[$i] | Export-CSV -Path "Path to CSV file to store all information regarding goals" -Append -Force -notypeinformation
}

### Report Connections Workspaces Scans General

## Workspace 1 

$workspaceId = "23c211d1-c818-4548-8ce4-45b063207981"
$scorecardparameters = New-Object -TypeName System.Collections.Generic.List[Object]

# List Setup for Reports

$URLaux = $API + "v1.0/myorg/groups/$workspaceId/reports/"
$scorecardinvoke = Invoke-RestMethod -Method Get -Uri $URLaux -Headers @{ "Authorization"=$token } 
#$scorecardinvoke.value
$scorecardparameters.Add($scorecardinvoke.value)
$scorecardparameters[0] | Export-CSV -Path "Path to Workspace 1 CSV file" -Force -notypeinformation

## Workspace 2 

$workspaceId = "59804f26-a979-4547-a719-64fa361d1540"
$scorecardparameters = New-Object -TypeName System.Collections.Generic.List[Object]

# List Setup for Reports

$URLaux = $API + "v1.0/myorg/groups/$workspaceId/reports/"
$scorecardinvoke = Invoke-RestMethod -Method Get -Uri $URLaux -Headers @{ "Authorization"=$token } 
#$scorecardinvoke.value
$scorecardparameters.Add($scorecardinvoke.value)
$scorecardparameters[0] | Export-CSV -Path "Path to Workspace 2 CSV file" -Force -notypeinformation

## Workspace 3 

$workspaceId = "144c23ae-fa4d-494b-a2ba-ac8ea61bda63"
$scorecardparameters = New-Object -TypeName System.Collections.Generic.List[Object]

# List Setup for Reports

$URLaux = $API + "v1.0/myorg/groups/$workspaceId/reports/"
$scorecardinvoke = Invoke-RestMethod -Method Get -Uri $URLaux -Headers @{ "Authorization"=$token } 
#$scorecardinvoke.value
$scorecardparameters.Add($scorecardinvoke.value)
$scorecardparameters[0] | Export-CSV -Path "Path to Workspace 3 CSV file" -Force -notypeinformation

## Workspace 4 

$workspaceId = "aab32768-16ca-4f10-a9df-c9fb1dbb8c22"
$scorecardparameters = New-Object -TypeName System.Collections.Generic.List[Object]

# List Setup for Reports

$URLaux = $API + "v1.0/myorg/groups/$workspaceId/reports/"
$scorecardinvoke = Invoke-RestMethod -Method Get -Uri $URLaux -Headers @{ "Authorization"=$token } 
#$scorecardinvoke.value
$scorecardparameters.Add($scorecardinvoke.value)
$scorecardparameters[0] | Export-CSV -Path "Path to Workspace 4 CSV file" -Force -notypeinformation -Encoding "ASCII"
