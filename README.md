# MCDF
Verification project of Multi-Channel Data Formatter
## MCDF的設計結構
![image](https://github.com/user-attachments/assets/f3c1cc1f-6fa6-469b-9b3c-e3b6a3039639)
 - Channel Slave: 負責接收上行數據，並保存在其FIFO中
 - Arbiter: 選擇從不同FIFO中讀取數據，並發送到Formatter
 - Formatter: 將數據按照一定接口時序發送到下行接收端
 - Control Registers: 有專用的暫存器讀寫接口，負責接收命令並控制MCDF的功能

