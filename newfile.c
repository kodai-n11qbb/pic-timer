#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (Power-up Timer is disabled)
#pragma config CP = OFF         // Code Protection bit (Code protection disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>
#include <stdint.h>

#define DB4 PORTBbits.RB4
#define DB5 PORTBbits.RB5
#define DB6 PORTBbits.RB6
#define DB7 PORTBbits.RB7
#define RS PORTBbits.RB0
#define E PORTBbits.RB1
#define _XTAL_FREQ 10000000

void init_LCD(void);
void out_inst_LCD(unsigned char);
void out_str_LCD(unsigned char);
void LCD_wr_char(char);
void out_LCD(unsigned char);

volatile unsigned int tenthSeconds = 0;
volatile unsigned char timerRunning = 0;
volatile unsigned char overflowCount = 0;  // 新規追加：オーバーフロー回数のカウンタ

void startTimer(void) {
    TMR0 = 12;                              // プリロード値を設定（1オーバーフロー ≒25ms)
    OPTION_REG = 0b00000111;                  // Timer0, prescaler 1:256
    INTCON = 0b10100000;                      // Enable global and TMR0 interrupts
    timerRunning = 1;
}

void stopTimer(void) {
    INTCON &= ~0b00100000;      // Disable TMR0 interrupt
    timerRunning = 0;
}

// New function to set cursor position
void LCD_goto(unsigned char x, unsigned char y) {
    unsigned char pos = 0x80 | (x ? 0x40 : 0x00) | y;
    out_inst_LCD(pos >> 4);
    out_inst_LCD(pos & 0x0F);
}

void displayTime(void) {
    LCD_goto(1, 7);  // Move to second line, first position
    
    // Display tens digit
    LCD_wr_char('0' + (tenthSeconds / 100));
    // Display ones digit
    LCD_wr_char('0' + ((tenthSeconds / 10) % 10));
    // Display decimal point
    LCD_wr_char('.');
    // Display tenths
    LCD_wr_char('0' + (tenthSeconds % 10));
    // Display unit
    LCD_wr_char('s');
}

void __interrupt() ISR(void) {
    if (INTCON & 0b00000100) {                // TMR0IF is set
        INTCON &= ~0b00000100;                // Clear TMR0IF
        TMR0 = 12;                          // 再度プリロード
        if (timerRunning) {
            overflowCount++;
            if (overflowCount >= 4) {       // 4オーバーフローで約0.1秒
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
    
    __delay_ms(20);
    
    for (i = 0; i < 3; i++) {
        out_inst_LCD(0x03);
        __delay_ms(5);
    }
    
    out_inst_LCD(0x02);     //ファンクションセット;
    out_inst_LCD(0x02);     //ファンクションセット        上位4bit
    out_inst_LCD(0x08);     //ファンクションセット        下位4bit
    out_inst_LCD(0x00);     //表示ON/OFFコントロール    上位4bit 4bit
    out_inst_LCD(0x0c);     //表示ON/OFFコントロール    
                    //下位4bit 表示ON,カーソルOFF,ブリンクOFF
    out_inst_LCD(0x00);     //表示クリア            上位4bit 4bit
    out_inst_LCD(0x01);     //表示クリア            下位4bit
    out_inst_LCD(0x00);     //エントリモードセット        上位4bit
    out_inst_LCD(0x06);     //エントリモードセット        下位4bit
    
    __delay_ms(20);
}

// 文字データ送信関数
void LCD_wr_char(char c)
{
    char str_H, str_L;

    str_H = c & 0xf0;
    str_H = str_H >> 4;     // 上位データ
    str_L = c & 0x0f;       // 下位データ

    out_str_LCD(str_H);     // 文字コード出力（上位データ）
    out_str_LCD(str_L);     // 文字コード出力（下位データ）
}

// インストラクションコード出力関数
void out_inst_LCD(unsigned char out_data)
{
    out_LCD(out_data);      // LCDにデータ出力
    RS = 0; E = 1;          // E:1,RS:0
    E = 0;                  // E:0
    __delay_ms(5);
}

// 文字コード出力関数
void out_str_LCD(unsigned char out_data)
{
    out_LCD(out_data);      // LCDにデータ出力
    RS = 1; E = 1;          // E:1,RS:1
    E = 0;                  // E:0
    __delay_us(100);
}

// LCD出力関数
void out_LCD(unsigned char data)
{
    // 配列を使用せず、直接ビット操作で出力
    DB4 = (data & 0x01);
    DB5 = (data & 0x02) >> 1;
    DB6 = (data & 0x04) >> 2;
    DB7 = (data & 0x08) >> 3;
}

void main(void) {
    TRISA = 0b00000000;
    TRISB = 0b00001100;
    PORTA = 0x00;
    PORTB = 0x00;        

    init_LCD();            

    // Initialize display using direct character output
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