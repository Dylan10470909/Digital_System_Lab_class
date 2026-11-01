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
| **Lab4** | 組合邏輯電路設計 (Combinational Circuit) | 卡諾圖（K-Map）化簡布林代數、閘級與資料流建模 | QuestaSim / EPWave |
| **Lab5** | 多工器邏輯與硬體實現 (MUX & FPGA) | 16-to-1 MUX 布林映射、七段解碼與 Spartan-3AN 燒錄驗證 | QuestaSim / FPGA 板端 |
| **Lab6** | 4-bit 升降計數器 (Up-Down Counter) | 時序邏輯、非同步重置（Async Reset）與計數除頻邏輯 | QuestaSim / EPWave |
| **Lab7** | 雙向跑馬燈 (Bidirectional Shift Register) | 8-bit 雙向移位暫存器與有限循環計數狀態控制 | QuestaSim / EPWave |
| **Lab8** | 七段顯示器動態掃描 (7-Segment Controller) | 模組化階層整合（Top / LED / Hextoseg）與大計數除頻延遲 | Spartan-3AN 實體顯示 |
| **Lab9** | 有限狀態機設計 (FSM: Traffic Light) | 三段式狀態機紅黃綠燈時序控制、狀態編碼與條件跳轉 | QuestaSim / EPWave |
| **Lab10** | 4-bit 算術單元 (Function-based ALU) | 使用 Verilog `function signed [1:0]` 建立全加器與全減器 | 功能性波形驗證 |
| **Lab11** | 循序邏輯與進階控制實作 | 進階暫存器傳輸級（RTL）控制與資料路徑整合 | QuestaSim / EPWave |
| **Lab12** | 數位系統綜合實作專題 | 整合前述模組之端到端數位控制系統驗證 | ISE 綜合 / FPGA 驗證 |

---

## 🏗️ 核心技術特點 (Key Engineering Highlights)

### 1. 結構化硬體模組化 (Function-based Arithmetic Unit)
在 **Lab10** 中，改以 Verilog 語法中的 `function` 封裝單級全加與全減運算器，串接為 4-bit 行波進位資料路徑：
* **全加器核心邏輯**：
  $$S = A \oplus B \oplus CIN$$
  $$COUT = (A \cdot B) + (CIN \cdot (A \oplus B))$$
* **全減器核心邏輯**：
  $$D = A \oplus B \oplus COUT$$
  $$CIN = (\overline{A} \cdot (B \oplus COUT)) + (B \cdot COUT)$$

### 2. 階層化硬體整合 (Hierarchical Module Integration)
在 **Lab8** 中，設計採用模組化架構區分**控制邏輯**與**顯示解碼**：
* **`led` 模組**：利用 24-bit 計數器（$24\text{'hEB8D80}$）進行時脈除頻，達到人眼可辨識的跳轉延遲。
* **`hextoseg` 模組**：將 4-bit 十六進位數值轉換為共陽極七段顯示器字形（Active Low）。
* **Top 模組**：透過頂層連線綁定，並利用 User Constraints File (`.ucf`) 配置 FPGA 實體接腳。

### 3. 有限狀態機控制 (Finite State Machine)
在 **Lab9** 中實現標準有限狀態機架構：
* 狀態編碼定義：`Green (3'b100)`、`Yellow (3'b010)`、`Red (3'b001)`。
* 透過二位元控制訊號 $X_1X_2$ 實現防呆鎖定與狀態跳轉邏輯。

---

## 📊 FPGA 實現與資源利用率 (Device Utilization Summary)

在 Xilinx Spartan-3AN (`xc3s200an-5ftg256`) 平台綜合（Synthesis）與實現後之資源消耗：

| 評估項目 | 邏輯切片 (Slices) | 4-Input LUTs | 正反器 (Flip-Flops) | 綁定引腳 (Bonded IOBs) | Timing Score |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Lab5 (MUX Logic)** | 1 / 1,792 (1%) | 1 / 3,584 (1%) | 0 (純組合邏輯) | 5 / 195 (2%) | 0 (Met) |
| **Lab8 (7-Segment)** | 88 / 1,792 (4%) | 171 / 3,584 (4%) | 30 / 3,584 (1%) | 18 / 195 (9%) | 0 (Met) |

---

## 🚀 模擬執行指南 (Simulation Guide)

各單元 Testbench 均相容於標準 Verilog 模擬器：

```bash
# 透過 Icarus Verilog 與 GTKWave 進行本地模擬（以 Lab6 計數器為例）
cd Lab6
iverilog -o sim.out lab06.v lab06testbench.v
vvp sim.out
gtkwave dump.vcd &
