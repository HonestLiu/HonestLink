SET(SOURCES screens/ui_Home.c
    screens/ui_OfflineDownload.c
    screens/ui_FileExplorer.c
    ui.c
    components/ui_comp_hook.c
    ui_helpers.c)

add_library(ui ${SOURCES})
