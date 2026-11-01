# 數位系統與硬體描述語言實習 (Digital System & HDL Design Labs)

> 本倉庫收錄國立高雄科技大學（NKUST）「數位系統實習」課程之完整 Verilog HDL 專案原始碼與實驗報告，涵蓋組合邏輯最佳化、資料路徑控制、有限狀態機（FSM）、算術邏輯單元（ALU）以及 Xilinx FPGA 硬體板端驗證。

---

## 🛠️ 開發環境與驗證工具 (Environment & Toolchains)

* **硬體描述語言**：Verilog HDL (IEEE 1364-2001)
* **模擬驗證平台**：
  * EDA Playground (Mentor QuestaSim / EPWave 波形分析)
* **FPGA 綜合與實現工具**：
  * Xilinx ISE 14.1 (Project Navigator / XST Synthesis / Map / PAR)
* **目標硬體開發板**：
  * Xilinx Spartan-3AN FPGA Starter Kit (`xc3s200an-5ftg256`)

---

## 📂 實驗單元與課程架構 (Curriculum & Directory Structure)

專案僅收錄核心 Verilog 原始碼（`.v`）與實驗報告（`.pdf`），中間暫存與編譯輸出已由 `.gitignore` 過濾：

| 單元 (Lab) | 實驗主題 (Topic) | 核心電路設計與功能描述 | 驗證方式 |
| :--- | :--- | :--- | :--- |
| **Lab4** | 組合邏輯電路設計 (Combinational Circuit) | 卡諾圖（K-Map）化簡布林代數、閘級與資料流建模 |EPWave |
| **Lab5** | 多工器邏輯與硬體實現 (MUX & FPGA) | 16-to-1 MUX 布林映射、七段解碼與 Spartan-3AN 燒錄驗證 | EPWave / FPGA 板 |
| **Lab6** | 4-bit 升降計數器 (Up-Down Counter) | 時序邏輯、非同步重置（Async Reset）與計數除頻邏輯 | EPWave |
| **Lab7** | 雙向跑馬燈 (Bidirectional Shift Register) | 8-bit 雙向移位暫存器與有限循環計數狀態控制 | EPWave |
| **Lab8** | 七段顯示器動態掃描 (7-Segment Controller) | 模組化階層整合（Top / LED / Hextoseg）與大計數除頻延遲 | EPWave / FPGA 板 |
| **Lab9** | 有限狀態機設計 (FSM: Traffic Light) | 三段式狀態機紅黃綠燈時序控制、狀態編碼與條件跳轉 | EPWave |
| **Lab10** | 4-bit 算術單元 (Function-based ALU) | 使用 Verilog `function signed [1:0]` 建立全加器與全減器 | 功能性波形驗證 |
| **Lab11** | 循序邏輯與進階控制實作 | 進階暫存器傳輸級（RTL）控制與資料路徑整合 |  EPWave |
| **Lab12** | 數位系統綜合實作專題 | 整合前述模組之端到端數位控制系統驗證 |  FPGA 驗證 |

---
