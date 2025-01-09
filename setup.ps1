$fluentbit_uri = "https://drive.usercontent.google.com/download?id=1blK-swTWSMV-gBtUyZLc4kH3pVes8unU`&export=download`&authuser=0`&confirm=t`&uuid=3fb2c611-4787-4b5d-8fb3-e376f76b4386`&at=AIrpjvO2RuXGfEML8JPEY40wVNdq:1736395742906"
$fluentbit_service = "fluentbit"
#  Get-ChildItem -Path "$API_FOLDER_PATH\API_HN212" -Recurse -Force |

sc.exe stop $fluentbit_service
sc.exe delete $fluentbit_service
Remove-Item -Path "C:\fluentbit.zip" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\fluentbit" -Recurse -Force -ErrorAction SilentlyContinue

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $fluentbit_uri -OutFile "C:\fluentbit.zip"
Expand-Archive -Path "C:\fluentbit.zip" -DestinationPath "C:\fluentbit" -Force
Get-ChildItem -Path "C:\fluentbit\fluentbit" -Recurse | Move-Item -Destination "C:\fluentbit" -Force
Remove-Item -Path "C:\fluentbit\fluentbit" -Recurse -Force

sc.exe create $fluentbit_service binPath= "C:\fluentbit\bin\fluent-bit.exe -c C:\fluentbit\conf\fluent-bit.conf" start= auto
sc.exe query $fluentbit_service
sc.exe start $fluentbit_service

Remove-Item -Path "C:\fluentbit.zip" -Recurse -Force -ErrorAction SilentlyContinue
# Remove-Item -Path "C:\fluentbit" -Recurse -Force -ErrorAction SilentlyContinue
