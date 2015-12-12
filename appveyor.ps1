$ErrorActionPreference = "Stop"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Accept", "application/json")
$headers.Add("Travis-API-Version", "3")
$headers.Add("Authorization", "token $($env:TRAVIS_TOKEN)")

$body = "
{""request"": {
  ""message"": ""Override the commit message: this is an api request"",
  ""branch"": ""master"",
  ""config"": {
    ""env"": {
      ""matrix"": [""TEST=nightly""]
    },
    ""script"": ""echo Hello""
  }
}}
"

Write-Host $body

Invoke-RestMethod -Method POST -Headers $headers -Uri "https://api.travis-ci.com/repo/SonarSource%2Fbuild-wrapper/requests" -Body $body
