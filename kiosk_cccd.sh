#!/bin/bash

# Đường dẫn đến file đích
output_file="/mnt/d/kiosk_cccd.txt"

# Xóa nội dung cũ (nếu có) trước khi ghi mới
> "$output_file"

# Danh sách các dòng JSON
json_lines=(
  '{"@t":"2024-12-26T03:19:17.2047127Z","@mt":"[99992][] Device HANEL-55001145 do step: SCANCARD; status: START; message=Start ScanCard to get key...."}'
  '{"@t":"2024-12-26T03:19:17.2955291Z","@mt":"[99992][8HBXI64PRO] Event: Card inserted. A card is present in the reader."}'
  '{"@t":"2024-12-26T03:19:18.3467677Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: SCANCARD; status: SUCCESS; message=Scancard success, total time=00:00:01.1370806ms."}'
  '{"@t":"2024-12-26T03:19:18.3505616Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: CONNECT_CARD; status: START; message=Connect to card...."}'
  '{"@t":"2024-12-26T03:19:18.4183015Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: CONNECT_CARD; status: SUCCESS; message=Connected, total time: 00:00:00.0677923ms."}'
  '{"@t":"2024-12-26T03:19:18.4210201Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: PACE; status: START; message=Start PACE...."}'
  '{"@t":"2024-12-26T03:19:18.8917326Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: PACE; status: SUCCESS; message=PACE success, total time=00:00:00.3801015ms."}'
  '{"@t":"2024-12-26T03:19:18.8921196Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: READ_DGS; status: START; message=Start read DGs...."}'
  '{"@t":"2024-12-26T03:19:20.3052351Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: READ_DGS; status: SUCCESS; message=Read DGs success, total time:00:00:01.4130098ms."}'
  '{"@t":"2024-12-26T03:19:20.3057086Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: VERIFY_SOD; status: START; message=Start Verify SOD...."}'
  '{"@t":"2024-12-26T03:19:20.3109281Z","@mt":"[99992][8HBXI64PRO] Device HANEL-55001145 do step: VERIFY_SOD; status: SUCCESS; message=Verify SOD success, total time:00:00:00.0052338ms."}'
  '{"@t":"2024-12-26T04:21:14.9314338Z","@mt":"[99992][WX8DVP73WO] Device HANEL-55001145 do step: FINISH; status: FAILURE; message=Scancard failed!."}'
'{"@t":"2024-12-26T04:21:14.9322125Z","@mt":"[99992][WX8DVP73WO] Error occurred: Scancard failed!","@l":"Error"}'
)

# Ghi từng dòng vào file
while true; do
    for line in "${json_lines[@]}"; do
    echo "$line" >> "$output_file"
    sleep 1
    done ;
done

echo "Tất cả các dòng đã được ghi vào $output_file"
