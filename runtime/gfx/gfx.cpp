#include "gfx.h"
#include "gl.h"
void gfxInit(std::string info) {
    printf("engin init : %s \n", info.c_str());
}
void gfxResize(int w, int h) {
    printf("engin resize : %d,%d \n", w, h);
}
void gfxTick() {

}