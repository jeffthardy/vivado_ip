

/***************************** Include Files *******************************/
#include "leds.h"


void setLEDConstant(u32 BaseAddress, int pattern)
{
  LEDS_mWriteReg(BaseAddress, LEDS_S00_AXI_SLV_REG0_OFFSET, 0);
  LEDS_mWriteReg(BaseAddress, LEDS_S00_AXI_SLV_REG1_OFFSET, pattern);
}


void setLEDBlink(u32 BaseAddress, int rate)
{
  LEDS_mWriteReg(BaseAddress, LEDS_S00_AXI_SLV_REG0_OFFSET, 1);
  LEDS_mWriteReg(BaseAddress, LEDS_S00_AXI_SLV_REG1_OFFSET, rate);
}


void setLEDScan(u32 BaseAddress, int rate)
{
  LEDS_mWriteReg(BaseAddress, LEDS_S00_AXI_SLV_REG0_OFFSET, 2);
  LEDS_mWriteReg(BaseAddress, LEDS_S00_AXI_SLV_REG1_OFFSET, rate);
}



/************************** Function Definitions ***************************/
