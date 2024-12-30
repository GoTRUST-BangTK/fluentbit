$fluentbit_uri = "https://drive.usercontent.google.com/download?id=1n-FgJtU7BaBgp6xbKWffGVlg_RrVwJe2`&export=download`&authuser=0`&confirm=t`&uuid=a77803ac-5b89-457f-ac51-60486665040a`&at=APvzH3qwrvx2CebjckPoPhuCYfUb:1735524643289"
$fluentbit_service = "fluentbit"
#  Get-ChildItem -Path "$API_FOLDER_PATH\API_HN212" -Recurse -Force |

Remove-Item -Path "C:\fluentbit.zip" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\fluentbit" -Recurse -Force -ErrorAction SilentlyContinue

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $fluentbit_uri -OutFile "C:\fluentbit.zip"
Expand-Archive -Path "C:\fluentbit.zip" -DestinationPath "C:\fluentbit" -Force
Get-ChildItem -Path "C:\fluentbit" -Recurse | Move-Item -Destination "C:\fluentbit" -Force

sc stop $fluentbit_service
sc delete $fluentbit_service
sc create $fluentbit_service binPath= "C:\fluentbit\bin\fluent-bit.exe -c C:\fluentbit\conf\fluent-bit.conf" start= auto
sc query $fluentbit_service
sc start $fluentbit_service

Remove-Item -Path "C:\fluentbit.zip" -Recurse -Force -ErrorAction SilentlyContinue
# Remove-Item -Path "C:\fluentbit" -Recurse -Force -ErrorAction SilentlyContinue
