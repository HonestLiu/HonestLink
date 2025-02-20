/**
 * @author HonestLiu
 * @date 2025.2.19
 * */

#ifndef __PAGEMANAGER_H__
#define __PAGEMANAGER_H__

#include "ui.h"
#include "main.h"
#include "lvgl.h"

// 页面栈深度
#define MAX_DEPTH 6

//管理页面枚举
enum {
    HomePage = 0,
    PinMapPage,
    OfflineDAPPage,
    PWMPage,
    ElectricPage,
    ServosPage,
    LogicPage,
    DACPage,
    FilePage,
};

// 页面结构体
//其本质就是对页面及其初始化、反初始化函数的封装，每个UI文件内都定义了这个结构体
typedef struct {
    uint8_t id;
    void (*init)(void);

    void (*deinit)(void);

    lv_obj_t **page_obj;
} Page_t;

//默认页面(仍然需要对生成页面进行改造)
extern Page_t page_Home;
#define DEFAULT_PAGE page_Home

// 页面堆栈结构体
// 其本质就是维护了一个页面数组
typedef struct {
    Page_t *pages[MAX_DEPTH];
    uint8_t top;
} PageStack_t;

extern PageStack_t PageStack;


Page_t *Page_Get_NowPage(void);

void Page_Back(void);

void Page_Back_Bottom(void);

void Page_Load(Page_t *newPage);

void Pages_init(void);


#endif //__PAGEMANAGER_H__
