/**
 * @author HonestLiu
 * @date 2025.2.19
 * */

#include "pageManager.h"

PageStack_t PageStack;

/**
 * @brief 初始化页面栈
 * */
static void page_stack_init(PageStack_t *stack) {
    stack->top = 0;//初始化栈顶为0
}

/**
 * @brief 入栈操作
 * */
static uint8_t page_stack_push(PageStack_t *stack, Page_t *page) {
    //堆栈中页面数超过预设值
    if (stack->top >= MAX_DEPTH) {
        return -1;
    }
    //更新top,并将栈顶设置为新入栈页面
    stack->pages[stack->top++] = page;
    return 0;
}

/**
 * @brief 出栈操作
 * */
static uint8_t page_stack_pop(PageStack_t *stack) {
    //堆栈中没有页面
    if (stack->top <= 0) {
        return -1;
    }
    //修改top并对页面进行反初始化
    stack->pages[--stack->top]->deinit();
    return 0;
}

/**
 * @brief 判断页面堆栈是否为空
 * */
static uint8_t page_stack_is_empty(const PageStack_t *stack) {
    return stack->top == 0;
}

/**
 * @brief 获取栈顶页面
 * */
static Page_t *get_top_page(PageStack_t *stack) {
    //检查栈是否为空
    if (stack->top == 0) {
        return NULL;//如果栈为空，返回NULL
    }
    //返回栈顶页面的指针
    return stack->pages[stack->top - 1];
}

/**
 * @brief 获取当前页面(栈顶页面)的指针
 * @param NULL
 * @return 当前页面的指针，栈为空则返回NULL
 * */
Page_t *Page_Get_NowPage(void) {
    return get_top_page(&PageStack);
}


/**
 * @brief 返回上一页函数
 * @param NULL
 * @return NULL
 * */
void Page_Back(void) {
    LV_LOG_USER("Page_Back Enter\r\n");
    if (page_stack_is_empty(&PageStack)) {
        //栈为空时，则直接返回
        LV_LOG_USER("Page_Back empty\r\n");
        return;
    }

    //弹出当前页面
    LV_LOG_USER("Page_Back pop\r\n");
    page_stack_pop(&PageStack);
    LV_LOG_USER("Page_Back top:%d\r\n", PageStack.top);

    if (page_stack_is_empty(&PageStack)) {
        //弹出页面后栈为空，则切入默认页面
        LV_LOG_USER("Stack is Empty, Load Default Page\r\n");
        page_stack_push(&PageStack, &DEFAULT_PAGE);
        DEFAULT_PAGE.init();
        lv_scr_load_anim(*DEFAULT_PAGE.page_obj, LV_SCR_LOAD_ANIM_MOVE_RIGHT, 100, 0, true);
    } else {
        //切换到上一个页面
        LV_LOG_USER("Page_Back Return\r\n");
        Page_t *previous_page = PageStack.pages[PageStack.top - 1];
        previous_page->init();
        lv_scr_load_anim(*previous_page->page_obj, LV_SCR_LOAD_ANIM_MOVE_RIGHT, 100, 0, true);
    }
}

/**
 * @brief 返回栈低页
 * @param NULL
 * @return NULL
 * */
void Page_Back_Bottom(void) {
    if (page_stack_is_empty(&PageStack)) {
        //栈为空时，则直接返回
        return;
    }
    //弹出除栈底的所有页面
    while (PageStack.top > 1) {
        page_stack_pop(&PageStack);
    }
    PageStack.pages[PageStack.top - 1]->init();//初始化新的页面(栈底页)
    lv_scr_load_anim(*PageStack.pages[PageStack.top - 1]->page_obj, LV_SCR_LOAD_ANIM_MOVE_RIGHT, 100, 0,
                     true); // 加载并应用动画
}

/**
 * @brief 加载新页面到栈顶
 * @param newPage 新页面
 * @return NULL
 * */
void Page_Load(Page_t *newPage) {
    //检查栈顶是否已满
    LV_LOG_USER("Page_Load Enter\r\n");
    if (PageStack.top >= MAX_DEPTH - 1) {
        //错误处理: 堆栈满
        return;
    }
    LV_LOG_USER("Page_Load Enter 1\r\n");
    //如果堆栈非空，反初始化当前页面
    if (PageStack.top > 0) {
        PageStack.pages[PageStack.top - 1]->deinit();
    }
    LV_LOG_USER("Page_Load Enter 2\r\n");
    //将新页面推入堆栈
    page_stack_push(&PageStack, newPage);
    LV_LOG_USER("Page_Load Init ing\r\n");
    newPage->init();//初始化新页面
    LV_LOG_USER("Page_Load Init done\r\n");

    //加载页面
    LV_LOG_USER("Page_Load loading\r\n");
    lv_scr_load_anim(*newPage->page_obj, LV_SCR_LOAD_ANIM_MOVE_RIGHT, 100, 0, true);
}

/**
 * @brief 初始化页面管理和启动默认页面
 * @param NULL
 * @return NULL
 * */
void Pages_init(void) {
    page_stack_init(&PageStack);
    page_stack_push(&PageStack, &DEFAULT_PAGE);
    DEFAULT_PAGE.init();
    lv_disp_load_scr(*DEFAULT_PAGE.page_obj);
}