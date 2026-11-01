# 數位系統與硬體描述語言實習 (Digital System & HDL Design Labs)

> 本倉庫收錄「數位系統實習」課程之 Verilog HDL 專案原始碼與實驗報告，涵蓋組合邏輯最佳化、資料路徑控制、有限狀態機（FSM）、算術邏輯單元（ALU）以及 Xilinx FPGA 硬體板端驗證。

---

## 🛠️ 開發環境與驗證工具 (Environment & Toolchains)

* **硬體描述語言**：Verilog HDL (IEEE 1364-2001)
* **模擬驗證平台**：
  * EDA Playground (EPWave 波形分析)
* **FPGA 綜合與實現工具**：
  * Xilinx ISE 14.1 
* **目標硬體開發板**：
  * Xilinx FPGA

---

## 📂 實驗單元與課程架構 (Curriculum & Directory Structure)

專案僅收錄核心 Verilog 原始碼（`.v`）與實驗報告（`.pdf`），中間暫存與編譯輸出已由 `.gitignore` 過濾：

| 單元 (Lab) | 實驗主題 (Topic) | 核心電路設計與功能描述 | 驗證方式 |
| :--- | :--- | :--- | :--- |
| **Lab4** | Combinational Circuit using HDL | 依身分證號碼列出真值表，經卡諾圖化簡布林代數後，設計組合邏輯閘電路 | EDA Playground (EPWave 波形驗證) |
| **Lab5** | MUX using HDL | 應用多工器原理設計組合邏輯電路，以 `case` 語法依輸入訊號映射輸出結果 | EDA Playground 模擬與 Xilinx Spartan-3AN FPGA 板端驗證 |
| **Lab5-1** | Code Converter using HDL | 設計七段顯示器解碼器（4 bits 輸入轉 7 bits 輸出），以 `case` 語法實現字形編碼轉換 | EDA Playground (EPWave 波形驗證) |
| **Lab6** | Counter using HDL | 4-bit 升降計數器設計，含重置控制與利用計數器最低位元實現之除頻輸出（`counterdiv`） | EDA Playground (EPWave 波形驗證) |
| **Lab7** | LED shift using HDL | 8-bit LED 跑馬燈電路，依據學號條件控制循環左移與右移之次數與切換 | EDA Playground (EPWave 波形驗證) |
| **Lab8** | Seven Segment using Verilog | 階層化模組設計（`led` 除頻計數器與 `hextoseg` 解碼器），控制實體七段顯示器自動跳轉計數 | Xilinx ISE 14.1 綜合分析與 FPGA 板端實體顯示 |
| **Lab9** | Finite State Machine using Verilog | 交通號誌有限狀態機設計，依輸入控制訊號 $X_1X_2$ 進行紅、黃、綠燈之狀態跳轉 | EDA Playground (EPWave 波形驗證) |
| **Lab10** | Function (full_add / full_sub) | 撰寫 Verilog `function` 設計 4-bit 全加器與全減器模組 | EDA Playground 波形驗證（檢查進位 COUT 與借位 CIN） |
| **Lab11** | 進階循序電路實作 | 撰寫循序邏輯硬體描述語言與對應 Testbench | EDA 工具模擬驗證 |
| **Lab12** | 數位系統綜合實作 | 整合組合與循序邏輯之硬體電路設計 | 模擬與硬體驗證 |

---
