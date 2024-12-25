# MCDF
Verification project of Multi-Channel Data Formatter
## 功能描述
MCDF可以將多個Channel的資料經過內部的FIFO以data packet的方式送出
## MCDF的設計結構
![image](https://github.com/user-attachments/assets/f3c1cc1f-6fa6-469b-9b3c-e3b6a3039639)
 - Channel Slave: 負責接收上行數據，並保存在其FIFO中
 - Arbiter: 選擇從不同FIFO中讀取數據，並發送到Formatter
 - Formatter: 將數據按照一定接口時序發送到下行接收端
 - Control Registers: 有專用的暫存器讀寫接口，負責接收命令並控制MCDF的功能

## 接口時序
#### Channel slave接口時序如下
![image](https://github.com/user-attachments/assets/76e5dfc1-0c84-4cbd-aeeb-fe059ce4569c)

valid = 1, 表示寫入數據

該時鐘週期ready為1，表示已經將數據寫入。

該時鐘週期ready為0，須等到ready為1的時鐘週期才可以寫入數據。

#### Formatter接口時序如下

