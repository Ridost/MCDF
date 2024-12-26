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
![image](https://github.com/user-attachments/assets/2b708b40-468b-4100-b7ac-3495cf0b9576)

Formatter準備發送數據時，先將fmt_req設為1，同時等待接收端的fmt_grant

收到fmt_grant後，在下一個周期將fmt_req設為0，並且同時將fmt_start設為1維持一個週期，開始發送數據

數據傳輸不允許有空白週期，要連續發送，最後結束時將fmt_end設為1維持一個週期。

(至少要經過一個週期fmt_req才可以再次設為1)

#### register接口時序如下
![image](https://github.com/user-attachments/assets/e9693d6d-8753-4fbd-ad67-88c2a6c9fc63)

每一個時鐘周期都要解析cmd

當cmd = WR時，需要把數據cmd_data_in寫入到cmd_addr對應的reg中

當cmd = RD時，需要從cmd_addr對應的reg中讀取數據，並在下一個週期將數據驅動到cmd_data_out

#### register描述
| 地址  | 名稱 |
| ------------ | ------------- |
| 0x00  | 通道1-32bits讀寫reg  |
| 0x04  | 通道2-32bits讀寫reg  |
| 0x08  | 通道3-32bits讀寫reg  |
| 0x10  | 通道1-狀態32bits唯讀reg  |
| 0x14  | 通道2-狀態32bits唯讀reg  |
| 0x18  | 通道3-狀態32bits唯讀reg  |

**讀寫reg**:

bit(0): 通道enable信號，1為開,0為關

bit(2:1): 優先級。0最高，3最低

bit(5:3): 數據包長度，0:4,1:8,2:16,3:32,其它(4~7):32

bit(31:6): 保留位，無法寫入

**狀態reg**

bit(7:0): 上行數據從端FIFO的剩餘可寫入量，同FIFO數據量同步變化。

bit(31:8): 保留位


