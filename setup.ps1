$fluentbit_uri = "https://drive.usercontent.google.com/download?id=1BsOgJpUxsj9NGFtlCJ_l2bA8o_R8_wUP`&export=download`&authuser=0`&confirm=t`&uuid=4bd172b6-414a-43dd-93ea-346a3975519c`&at=APvzH3r7dH_ff-dnwkI4J4GLYtco:1735531420480"
$fluentbit_service = "fluentbit"
#  Get-ChildItem -Path "$API_FOLDER_PATH\API_HN212" -Recurse -Force |

Remove-Item -Path "C:\fluentbit.zip" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\fluentbit" -Recurse -Force -ErrorAction SilentlyContinue

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $fluentbit_uri -OutFile "C:\fluentbit.zip"
Expand-Archive -Path "C:\fluentbit.zip" -DestinationPath "C:\fluentbit" -Force
Get-ChildItem -Path "C:\fluentbit\fluentbit" -Recurse | Move-Item -Destination "C:\fluentbit" -Force
Remove-Item -Path "C:\fluentbit\fluentbit" -Recurse -Force


sc.exe stop $fluentbit_service
sc.exe delete $fluentbit_service
sc.exe create $fluentbit_service binPath= "C:\fluentbit\bin\fluent-bit.exe -c C:\fluentbit\conf\fluent-bit.conf" start= auto
sc.exe query $fluentbit_service
sc.exe start $fluentbit_service

Remove-Item -Path "C:\fluentbit.zip" -Recurse -Force -ErrorAction SilentlyContinue
# Remove-Item -Path "C:\fluentbit" -Recurse -Force -ErrorAction SilentlyContinue
