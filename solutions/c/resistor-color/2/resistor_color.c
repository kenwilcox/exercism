#include "resistor_color.h"

int color_code(resistor_band_t c) 
{
    return (int)c;
}

resistor_band_t *colors(){
    static resistor_band_t arr[10];

    for(resistor_band_t i = BLACK;i <= WHITE; i++)
        arr[i] = i;
    
    return arr;
}