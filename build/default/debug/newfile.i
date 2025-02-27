# 1 "newfile.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "newfile.c" 2
#pragma config FOSC = HS
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF





# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 1 3
# 18 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 3
extern const char __xc8_OPTIM_SPEED;

extern double __fpnormalize(double);



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\xc8debug.h" 1 3
# 13 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\xc8debug.h" 3
#pragma intrinsic(__builtin_software_breakpoint)
extern void __builtin_software_breakpoint(void);
# 23 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 2 3




# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic.h" 1 3




# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\htc.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 1 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\htc.h" 2 3
# 5 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic.h" 2 3








# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic_chip_select.h" 1 3
# 2523 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic_chip_select.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 1 3
# 44 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\__at.h" 1 3
# 44 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 2 3








extern volatile unsigned char INDF __attribute__((address(0x000)));

__asm("INDF equ 00h");




extern volatile unsigned char TMR0 __attribute__((address(0x001)));

__asm("TMR0 equ 01h");




extern volatile unsigned char PCL __attribute__((address(0x002)));

__asm("PCL equ 02h");




extern volatile unsigned char STATUS __attribute__((address(0x003)));

__asm("STATUS equ 03h");


typedef union {
    struct {
        unsigned C :1;
        unsigned DC :1;
        unsigned Z :1;
        unsigned nPD :1;
        unsigned nTO :1;
        unsigned RP :2;
        unsigned IRP :1;
    };
    struct {
        unsigned :5;
        unsigned RP0 :1;
        unsigned RP1 :1;
    };
    struct {
        unsigned CARRY :1;
        unsigned :1;
        unsigned ZERO :1;
    };
} STATUSbits_t;
extern volatile STATUSbits_t STATUSbits __attribute__((address(0x003)));
# 159 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char FSR __attribute__((address(0x004)));

__asm("FSR equ 04h");




extern volatile unsigned char PORTA __attribute__((address(0x005)));

__asm("PORTA equ 05h");


typedef union {
    struct {
        unsigned RA0 :1;
        unsigned RA1 :1;
        unsigned RA2 :1;
        unsigned RA3 :1;
        unsigned RA4 :1;
    };
} PORTAbits_t;
extern volatile PORTAbits_t PORTAbits __attribute__((address(0x005)));
# 210 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char PORTB __attribute__((address(0x006)));

__asm("PORTB equ 06h");


typedef union {
    struct {
        unsigned RB0 :1;
        unsigned RB1 :1;
        unsigned RB2 :1;
        unsigned RB3 :1;
        unsigned RB4 :1;
        unsigned RB5 :1;
        unsigned RB6 :1;
        unsigned RB7 :1;
    };
} PORTBbits_t;
extern volatile PORTBbits_t PORTBbits __attribute__((address(0x006)));
# 272 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char EEDATA __attribute__((address(0x008)));

__asm("EEDATA equ 08h");




extern volatile unsigned char EEADR __attribute__((address(0x009)));

__asm("EEADR equ 09h");




extern volatile unsigned char PCLATH __attribute__((address(0x00A)));

__asm("PCLATH equ 0Ah");


typedef union {
    struct {
        unsigned PCLATH :5;
    };
} PCLATHbits_t;
extern volatile PCLATHbits_t PCLATHbits __attribute__((address(0x00A)));
# 306 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char INTCON __attribute__((address(0x00B)));

__asm("INTCON equ 0Bh");


typedef union {
    struct {
        unsigned RBIF :1;
        unsigned INTF :1;
        unsigned T0IF :1;
        unsigned RBIE :1;
        unsigned INTE :1;
        unsigned T0IE :1;
        unsigned EEIE :1;
        unsigned GIE :1;
    };
    struct {
        unsigned :2;
        unsigned TMR0IF :1;
        unsigned :2;
        unsigned TMR0IE :1;
    };
} INTCONbits_t;
extern volatile INTCONbits_t INTCONbits __attribute__((address(0x00B)));
# 384 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char OPTION_REG __attribute__((address(0x081)));

__asm("OPTION_REG equ 081h");


typedef union {
    struct {
        unsigned PS :3;
        unsigned PSA :1;
        unsigned T0SE :1;
        unsigned T0CS :1;
        unsigned INTEDG :1;
        unsigned nRBPU :1;
    };
    struct {
        unsigned PS0 :1;
        unsigned PS1 :1;
        unsigned PS2 :1;
    };
} OPTION_REGbits_t;
extern volatile OPTION_REGbits_t OPTION_REGbits __attribute__((address(0x081)));
# 454 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char TRISA __attribute__((address(0x085)));

__asm("TRISA equ 085h");


typedef union {
    struct {
        unsigned TRISA0 :1;
        unsigned TRISA1 :1;
        unsigned TRISA2 :1;
        unsigned TRISA3 :1;
        unsigned TRISA4 :1;
    };
} TRISAbits_t;
extern volatile TRISAbits_t TRISAbits __attribute__((address(0x085)));
# 498 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char TRISB __attribute__((address(0x086)));

__asm("TRISB equ 086h");


typedef union {
    struct {
        unsigned TRISB0 :1;
        unsigned TRISB1 :1;
        unsigned TRISB2 :1;
        unsigned TRISB3 :1;
        unsigned TRISB4 :1;
        unsigned TRISB5 :1;
        unsigned TRISB6 :1;
        unsigned TRISB7 :1;
    };
} TRISBbits_t;
extern volatile TRISBbits_t TRISBbits __attribute__((address(0x086)));
# 560 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char EECON1 __attribute__((address(0x088)));

__asm("EECON1 equ 088h");


typedef union {
    struct {
        unsigned RD :1;
        unsigned WR :1;
        unsigned WREN :1;
        unsigned WRERR :1;
        unsigned EEIF :1;
    };
} EECON1bits_t;
extern volatile EECON1bits_t EECON1bits __attribute__((address(0x088)));
# 604 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile unsigned char EECON2 __attribute__((address(0x089)));

__asm("EECON2 equ 089h");
# 617 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic16f84a.h" 3
extern volatile __bit CARRY __attribute__((address(0x18)));


extern volatile __bit DC __attribute__((address(0x19)));


extern volatile __bit EEIE __attribute__((address(0x5E)));


extern volatile __bit EEIF __attribute__((address(0x444)));


extern volatile __bit GIE __attribute__((address(0x5F)));


extern volatile __bit INTE __attribute__((address(0x5C)));


extern volatile __bit INTEDG __attribute__((address(0x40E)));


extern volatile __bit INTF __attribute__((address(0x59)));


extern volatile __bit IRP __attribute__((address(0x1F)));


extern volatile __bit PS0 __attribute__((address(0x408)));


extern volatile __bit PS1 __attribute__((address(0x409)));


extern volatile __bit PS2 __attribute__((address(0x40A)));


extern volatile __bit PSA __attribute__((address(0x40B)));


extern volatile __bit RA0 __attribute__((address(0x28)));


extern volatile __bit RA1 __attribute__((address(0x29)));


extern volatile __bit RA2 __attribute__((address(0x2A)));


extern volatile __bit RA3 __attribute__((address(0x2B)));


extern volatile __bit RA4 __attribute__((address(0x2C)));


extern volatile __bit RB0 __attribute__((address(0x30)));


extern volatile __bit RB1 __attribute__((address(0x31)));


extern volatile __bit RB2 __attribute__((address(0x32)));


extern volatile __bit RB3 __attribute__((address(0x33)));


extern volatile __bit RB4 __attribute__((address(0x34)));


extern volatile __bit RB5 __attribute__((address(0x35)));


extern volatile __bit RB6 __attribute__((address(0x36)));


extern volatile __bit RB7 __attribute__((address(0x37)));


extern volatile __bit RBIE __attribute__((address(0x5B)));


extern volatile __bit RBIF __attribute__((address(0x58)));


extern volatile __bit RD __attribute__((address(0x440)));


extern volatile __bit RP0 __attribute__((address(0x1D)));


extern volatile __bit RP1 __attribute__((address(0x1E)));


extern volatile __bit T0CS __attribute__((address(0x40D)));


extern volatile __bit T0IE __attribute__((address(0x5D)));


extern volatile __bit T0IF __attribute__((address(0x5A)));


extern volatile __bit T0SE __attribute__((address(0x40C)));


extern volatile __bit TMR0IE __attribute__((address(0x5D)));


extern volatile __bit TMR0IF __attribute__((address(0x5A)));


extern volatile __bit TRISA0 __attribute__((address(0x428)));


extern volatile __bit TRISA1 __attribute__((address(0x429)));


extern volatile __bit TRISA2 __attribute__((address(0x42A)));


extern volatile __bit TRISA3 __attribute__((address(0x42B)));


extern volatile __bit TRISA4 __attribute__((address(0x42C)));


extern volatile __bit TRISB0 __attribute__((address(0x430)));


extern volatile __bit TRISB1 __attribute__((address(0x431)));


extern volatile __bit TRISB2 __attribute__((address(0x432)));


extern volatile __bit TRISB3 __attribute__((address(0x433)));


extern volatile __bit TRISB4 __attribute__((address(0x434)));


extern volatile __bit TRISB5 __attribute__((address(0x435)));


extern volatile __bit TRISB6 __attribute__((address(0x436)));


extern volatile __bit TRISB7 __attribute__((address(0x437)));


extern volatile __bit WR __attribute__((address(0x441)));


extern volatile __bit WREN __attribute__((address(0x442)));


extern volatile __bit WRERR __attribute__((address(0x443)));


extern volatile __bit ZERO __attribute__((address(0x1A)));


extern volatile __bit nPD __attribute__((address(0x1B)));


extern volatile __bit nRBPU __attribute__((address(0x40F)));


extern volatile __bit nTO __attribute__((address(0x1C)));
# 2523 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic_chip_select.h" 2 3
# 13 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic.h" 2 3
# 30 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic.h" 3
#pragma intrinsic(__nop)
extern void __nop(void);
# 78 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic.h" 3
__attribute__((__unsupported__("The " "FLASH_READ" " macro function is no longer supported. Please use the MPLAB X MCC."))) unsigned char __flash_read(unsigned short addr);

__attribute__((__unsupported__("The " "FLASH_WRITE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_write(unsigned short addr, unsigned short data);

__attribute__((__unsupported__("The " "FLASH_ERASE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_erase(unsigned short addr);



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\eeprom_routines.h" 1 3
# 114 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\eeprom_routines.h" 3
extern void eeprom_write(unsigned char addr, unsigned char value);
extern unsigned char eeprom_read(unsigned char addr);
# 85 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic.h" 2 3






#pragma intrinsic(_delay)
extern __attribute__((nonreentrant)) void _delay(unsigned long);
#pragma intrinsic(_delaywdt)
extern __attribute__((nonreentrant)) void _delaywdt(unsigned long);
# 137 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\pic.h" 3
extern __bank0 unsigned char __resetbits;
extern __bank0 __bit __powerdown;
extern __bank0 __bit __timeout;
# 27 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\xc.h" 2 3
# 9 "newfile.c" 2

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 1 3
# 13 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef signed char int8_t;






typedef signed int int16_t;







typedef __int24 int24_t;







typedef signed long int int32_t;
# 52 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef unsigned char uint8_t;





typedef unsigned int uint16_t;






typedef __uint24 uint24_t;






typedef unsigned long int uint32_t;
# 88 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef signed char int_least8_t;







typedef signed int int_least16_t;
# 109 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef __int24 int_least24_t;
# 118 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef signed long int int_least32_t;
# 136 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef unsigned char uint_least8_t;






typedef unsigned int uint_least16_t;
# 154 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef __uint24 uint_least24_t;







typedef unsigned long int uint_least32_t;
# 181 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef signed char int_fast8_t;






typedef signed int int_fast16_t;
# 200 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef __int24 int_fast24_t;







typedef signed long int int_fast32_t;
# 224 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef unsigned char uint_fast8_t;





typedef unsigned int uint_fast16_t;
# 240 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef __uint24 uint_fast24_t;






typedef unsigned long int uint_fast32_t;
# 268 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef int32_t intmax_t;
# 282 "C:\\Program Files\\Microchip\\xc8\\v2.10\\pic\\include\\c90\\stdint.h" 3
typedef uint32_t uintmax_t;






typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 10 "newfile.c" 2
# 20 "newfile.c"
void init_LCD(void);
void out_inst_LCD(unsigned char);
void out_str_LCD(unsigned char);
void LCD_wr_char(char);
void out_LCD(unsigned char);

volatile unsigned int tenthSeconds = 0;
volatile unsigned char timerRunning = 0;
volatile unsigned char overflowCount = 0;

void startTimer(void) {
    TMR0 = 12;
    OPTION_REG = 0b00000111;
    INTCON = 0b10100000;
    timerRunning = 1;
}

void stopTimer(void) {
    INTCON &= ~0b00100000;
    timerRunning = 0;
}


void LCD_goto(unsigned char x, unsigned char y) {
    unsigned char pos = 0x80 | (x ? 0x40 : 0x00) | y;
    out_inst_LCD(pos >> 4);
    out_inst_LCD(pos & 0x0F);
}

void displayTime(void) {
    LCD_goto(1, 7);


    LCD_wr_char('0' + (tenthSeconds / 100));

    LCD_wr_char('0' + ((tenthSeconds / 10) % 10));

    LCD_wr_char('.');

    LCD_wr_char('0' + (tenthSeconds % 10));

    LCD_wr_char('s');
}

void __attribute__((picinterrupt(("")))) ISR(void) {
    if (INTCON & 0b00000100) {
        INTCON &= ~0b00000100;
        TMR0 = 12;
        if (timerRunning) {
            overflowCount++;
            if (overflowCount >= 4) {
                overflowCount = 0;
                tenthSeconds++;
                displayTime();
            }
        }
    }
}

void init_LCD(void)
{
    int i;

    _delay((unsigned long)((20)*(10000000/4000.0)));

    for (i = 0; i < 3; i++) {
        out_inst_LCD(0x03);
        _delay((unsigned long)((5)*(10000000/4000.0)));
    }

    out_inst_LCD(0x02);
    out_inst_LCD(0x02);
    out_inst_LCD(0x08);
    out_inst_LCD(0x00);
    out_inst_LCD(0x0c);

    out_inst_LCD(0x00);
    out_inst_LCD(0x01);
    out_inst_LCD(0x00);
    out_inst_LCD(0x06);

    _delay((unsigned long)((20)*(10000000/4000.0)));
}


void LCD_wr_char(char c)
{
    char str_H, str_L;

    str_H = c & 0xf0;
    str_H = str_H >> 4;
    str_L = c & 0x0f;

    out_str_LCD(str_H);
    out_str_LCD(str_L);
}


void out_inst_LCD(unsigned char out_data)
{
    out_LCD(out_data);
    PORTBbits.RB0 = 0; PORTBbits.RB1 = 1;
    PORTBbits.RB1 = 0;
    _delay((unsigned long)((5)*(10000000/4000.0)));
}


void out_str_LCD(unsigned char out_data)
{
    out_LCD(out_data);
    PORTBbits.RB0 = 1; PORTBbits.RB1 = 1;
    PORTBbits.RB1 = 0;
    _delay((unsigned long)((100)*(10000000/4000000.0)));
}


void out_LCD(unsigned char data)
{

    PORTBbits.RB4 = (data & 0x01);
    PORTBbits.RB5 = (data & 0x02) >> 1;
    PORTBbits.RB6 = (data & 0x04) >> 2;
    PORTBbits.RB7 = (data & 0x08) >> 3;
}

void main(void) {
    TRISA = 0b00000000;
    TRISB = 0b00001100;
    PORTA = 0x00;
    PORTB = 0x00;

    init_LCD();


    LCD_goto(1, 7);
    LCD_wr_char('0');
    LCD_wr_char('0');
    LCD_wr_char('.');
    LCD_wr_char('0');
    LCD_wr_char('s');

    while(1) {
  if(PORTBbits.RB3 == 1) {
   stopTimer();
  }

        if(PORTBbits.RB2 == 1) {
            startTimer();
        }
    }
}
