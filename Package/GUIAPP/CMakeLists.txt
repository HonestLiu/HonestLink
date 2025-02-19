SET(SOURCES screens/ui_HomeScreen.c
    screens/ui_OfflineScreen.c
    screens/ui_PinMapScreen.c
    screens/ui_PWMScreen.c
    screens/ui_ElectricScreen.c
    screens/ui_ServosScreen.c
    screens/ui_LogicScreen.c
    screens/ui_DACScreen.c
    screens/ui_FileExplorerScreen.c
    ui.c
    components/ui_comp_hook.c
    ui_helpers.c
    images/ui_img_pinmap_png.c
    images/ui_img_offline_png.c
    images/ui_img_pwm_png.c
    images/ui_img_electric_png.c
    images/ui_img_servos_png.c
    images/ui_img_logic_png.c
    images/ui_img_waveform_png.c
    images/ui_img_voltage_png.c
    images/ui_img_current_png.c)

add_library(ui ${SOURCES})
