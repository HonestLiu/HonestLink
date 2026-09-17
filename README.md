# HonestLink

基于 **STM32F407ZGTx** 的多功能工具型硬件编程器 / 调试器,以 `USB-DAPLink 调试器` 为核心,同时集成了脱机烧录、逻辑分析、PWM、舵机控制、DAC 波形输出等多种实用功能,并配有基于 LVGL 的彩色触控屏交互界面。

## 功能特性

| 功能 | 说明 | 状态 |
| --- | --- | --- |
| 🖥️ 在线 DAPLink | 通过 USB 连接上位机进行 SWD 在线调试 / 烧录 | ✅ |
| 📦 脱机 DAPLink | 脱离上位机,从 SD 卡读取固件直接烧录目标芯片 | ✅ |
| 📈 PWM 输出 | 可配置的 PWM 信号输出 | ✅ |
| 🦾 舵机控制 | 通过触控屏控制舵机角度 | ✅ |
| 📊 逻辑分析仪 | 依赖外挂树莓派 Pico | 🚧 计划中 |
| 〰️ DAC 波形输出 | 可输出任意波形 | ✅        |

## 硬件平台

- **主控芯片**: STM32F407ZGTx (Cortex-M4, FPU)
- **显示交互**: 彩色触控屏 + LVGL
- **存储**: SD 卡 (FATFS, SDIO),用于离线固件存放
- **USB**: USB_OTG_FS (CherryUSB 协议栈),承载 DAPLink 与 CDC 串口
- **实时系统**: FreeRTOS
- **工具链**: CMake + arm-none-eabi-gcc (hard-float)

## 端口说明

| 功能 | 引脚 |
| --- | --- |
| SWCLK | PE7 |
| SWDIO | PE8 |
| TX | PD8 |
| RX | PD9 |

> 更多外设引脚映射请参考 `HonestLink.ioc`(CubeMX 工程文件)。

## 项目结构

```
HonestLink/
├── Core/                  # 主程序、外设驱动、FreeRTOS 任务
├── Drivers/               # STM32 HAL 驱动
├── Middlewares/           # 中间件
├── Package/
│   ├── CherryUSB/         # USB 协议栈 (DAPLink / CDC)
│   ├── CherryRB/          # 环形缓存
│   ├── LVGL/              # LVGL 图形库
│   ├── lv_lib_100ask/     # LVGL 扩展库
│   ├── GUIAPP/            # SquareLine Studio 生成的 UI
│   ├── PageManager/       # 页面管理
│   ├── DAPLink/           # DAPLink 固件逻辑
│   ├── offline_download/  # 脱机下载逻辑
│   └── flmparse/          # FLM 算法 / 固件解析
├── FATFS/                 # 文件系统
├── Config/ Debug/         # 配置与构建产物
└── HonestLink.ioc         # CubeMX 工程
```

## 开发注意

1. **IDE 重新生成后(重点)**：在 CubeMX 重新生成项目后,需手动在 Cmake 文件中补全源文件列表,并取消 FPU 的注释:

   ```c
   file(GLOB_RECURSE SOURCES "Core/*.*" "Package/LVGL/*.*" "FATFS/*.*" "Middlewares/*.*" "Drivers/*.*"
           "Package/CherryUSB/core/usbd_core.c"
           "Package/CherryUSB/class/cdc/usbd_cdc.c"
           "Package/CherryUSB/port/dwc2/usb_dc_dwc2.c"
           "Package/CherryUSB/port/dwc2/usb_glue_st.c"
           "Package/CherryRB/chry_ringbuffer.c"
           "Package/DAPLink/*.*"
           "Package/GUIAPP/*.*"
           "Package/lv_lib_100ask/src/*.*"
           "Package/offline_download/*.*"
           "Package/flmparse/*.*"
           "Package/PageManager/*.*"
   )
   ```

   参考 `CMakeLists_template.txt`。

2. **CubeMX 新增外设后**: 需要到 `main.c` 中把对应外设的初始化从 `#if 0` 中拉出来(这是为了 USB 正常工作而做的),否则每次重新生成都要手动注释很麻烦

## TODO

- [ ] 添加页面管理:目前只有「脱机下载」一个界面,后续需根据页面执行不同逻辑
- [ ] 添加更多功能

## 更新日志

- **DAC 波形输出**:功能已实现(待示波器验证)。
- **舵机控制**:新增舵机控制;注意舵机旋转时存在**供电不足**问题(屏幕亮度会随之变暗)。
- **修复脱机下载功能**:
  1. UI 切换导致空间名称不同,选择路径返回时修改了不该动的路径,导致系统卡死。
  2. UI 文件增大导致 FreeRTOS 内存不足,使离线下载线程未启动、算法解析 `malloc` 失败,最终下载失败。

## 脱机下载逻辑

![](./img/6F403CBB-4202-40B6-83F8-507D1094A524.png)
