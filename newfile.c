
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (Power-up Timer is disabled)
#pragma config CP = OFF         // Code Protection bit (Code protection disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>




#define		DB4		PORTBbits.RB4
#define		DB5		PORTBbits.RB5
#define		DB6		PORTBbits.RB6
#define		DB7		PORTBbits.RB7
#define		RS		PORTBbits.RB0
#define		E		PORTBbits.RB1
#define _XTAL_FREQ 10000000

#include <stdio.h>
#include <string.h>                  

void init_LCD(void);
void out_inst_LCD(unsigned char);
void out_str_LCD(unsigned char);
void LCD_wr(char*, unsigned char, unsigned char);
void LCD_wr_char(char);
void out_LCD(unsigned char);

void init_LCD(void)
{
	int i;
	
    __delay_ms(20);
	
	for (i = 0; i < 3; i++) {
		out_inst_LCD(0x03);
		__delay_ms(5);
	}
	
	out_inst_LCD(0x02);		//ファンクションセット;
	out_inst_LCD(0x02);		//ファンクションセット		上位4bit
	out_inst_LCD(0x08);		//ファンクションセット		下位4bit
	out_inst_LCD(0x00);		//表示ON/OFFコントロール	上位4bit 4bit
	out_inst_LCD(0x0c);		//表示ON/OFFコントロール	
					//下位4bit 表示ON,カーソルOFF,ブリンクOFF
	out_inst_LCD(0x00);		//表示クリア			上位4bit 4bit
	out_inst_LCD(0x01);		//表示クリア			下位4bit
	out_inst_LCD(0x00);		//エントリモードセット		上位4bit
	out_inst_LCD(0x06);		//エントリモードセット		下位4bit
    
    __delay_ms(20);
}

// ?文字列データ送信関数
void LCD_wr(char *str_p, unsigned char x, unsigned char y)
{
	unsigned char posi = 0x80;	// DDRAM ADDRESS制御のためのinstセット
	unsigned char posiH, posiL;

	posi |= (x ? 0x40+y : 0x00+y);	// DDRAM ADDRESSを合成
	posiH = posi & 0xf0;		// 上位bit
	posiH = posiH >> 4;		// 上位から下位へ
	posiL = posi & 0x0f;		// 下位bit

	out_inst_LCD(posiH);		// DDRAM ADDRESSセット（上位4bit）
	out_inst_LCD(posiL);		// DDRAM ADDRESSセット（下位4bit）
	
	// LCDに文字列を送信
	while(*str_p)
	{
		LCD_wr_char(*str_p);	// 文字データ送信
		str_p++;
	}
}

// ?文字データ送信関数
void LCD_wr_char(char c)
{
	char str_H, str_L;

	str_H = c & 0xf0;
	str_H = str_H >> 4;		// 上位ﾃﾞｰﾀ
	str_L = c & 0x0f;		// 下位ﾃﾞｰﾀ

	out_str_LCD(str_H);		// 文字コード出力（上位ﾃﾞｰﾀ）
	out_str_LCD(str_L);		// 文字コード出力（下位ﾃﾞｰﾀ）
}

// ?インストラクションコード出力関数
void out_inst_LCD(unsigned char out_data)
{
	out_LCD(out_data);		// LCDにﾃﾞｰﾀ出力
	RS = 0;	E = 1;			// E:1,RS:0
	E = 0;				// E:0
	__delay_ms(5);
}

// ?文字コード出力関数
void out_str_LCD(unsigned char out_data)
{
	out_LCD(out_data);		// LCDにﾃﾞｰﾀ出力
	RS = 1;	E = 1;			// E:1,RS:1
	E = 0;				// E:0
	__delay_us(100);
}

// ?LCD出力関数
void out_LCD(unsigned char data)
{
	unsigned char d[4];
	unsigned char i;
	
	// 1ビット毎のﾃﾞｰﾀに変換
	for (i = 0; i < 4; i++){
		d[i] = data & 0x01;
		data >>= 1;
	}
	
	// ビット毎のﾃﾞｰﾀ出力
	DB4 = d[0];
	DB5 = d[1];
	DB6 = d[2];
	DB7 = d[3];
}


void main(void) {
    TRISA = 0b00000000;
    TRISB = 0b00000000;  
    PORTA = 0x00;
    PORTB = 0x00;        

    init_LCD();			

    LCD_wr("Timer Start!",0,0);  // 1行目の表示を変更
    LCD_wr("Time: 0 sec",1,0);   // 初期秒数表示

    while(1) {
        // メインループは空のまま
    }
    
    return;
}