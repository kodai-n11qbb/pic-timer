
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
	
	out_inst_LCD(0x02);		//�t�@���N�V�����Z�b�g;
	out_inst_LCD(0x02);		//�t�@���N�V�����Z�b�g		���4bit
	out_inst_LCD(0x08);		//�t�@���N�V�����Z�b�g		����4bit
	out_inst_LCD(0x00);		//�\��ON/OFF�R���g���[��	���4bit 4bit
	out_inst_LCD(0x0c);		//�\��ON/OFF�R���g���[��	
					//����4bit �\��ON,�J�[�\��OFF,�u�����NOFF
	out_inst_LCD(0x00);		//�\���N���A			���4bit 4bit
	out_inst_LCD(0x01);		//�\���N���A			����4bit
	out_inst_LCD(0x00);		//�G���g�����[�h�Z�b�g		���4bit
	out_inst_LCD(0x06);		//�G���g�����[�h�Z�b�g		����4bit
    
    __delay_ms(20);
}

// ?������f�[�^���M�֐�
void LCD_wr(char *str_p, unsigned char x, unsigned char y)
{
	unsigned char posi = 0x80;	// DDRAM ADDRESS����̂��߂�inst�Z�b�g
	unsigned char posiH, posiL;

	posi |= (x ? 0x40+y : 0x00+y);	// DDRAM ADDRESS������
	posiH = posi & 0xf0;		// ���bit
	posiH = posiH >> 4;		// ��ʂ��牺�ʂ�
	posiL = posi & 0x0f;		// ����bit

	out_inst_LCD(posiH);		// DDRAM ADDRESS�Z�b�g�i���4bit�j
	out_inst_LCD(posiL);		// DDRAM ADDRESS�Z�b�g�i����4bit�j
	
	// LCD�ɕ�����𑗐M
	while(*str_p)
	{
		LCD_wr_char(*str_p);	// �����f�[�^���M
		str_p++;
	}
}

// ?�����f�[�^���M�֐�
void LCD_wr_char(char c)
{
	char str_H, str_L;

	str_H = c & 0xf0;
	str_H = str_H >> 4;		// ����ް�
	str_L = c & 0x0f;		// �����ް�

	out_str_LCD(str_H);		// �����R�[�h�o�́i����ް��j
	out_str_LCD(str_L);		// �����R�[�h�o�́i�����ް��j
}

// ?�C���X�g���N�V�����R�[�h�o�͊֐�
void out_inst_LCD(unsigned char out_data)
{
	out_LCD(out_data);		// LCD���ް��o��
	RS = 0;	E = 1;			// E:1,RS:0
	E = 0;				// E:0
	__delay_ms(5);
}

// ?�����R�[�h�o�͊֐�
void out_str_LCD(unsigned char out_data)
{
	out_LCD(out_data);		// LCD���ް��o��
	RS = 1;	E = 1;			// E:1,RS:1
	E = 0;				// E:0
	__delay_us(100);
}

// ?LCD�o�͊֐�
void out_LCD(unsigned char data)
{
	unsigned char d[4];
	unsigned char i;
	
	// 1�r�b�g�����ް��ɕϊ�
	for (i = 0; i < 4; i++){
		d[i] = data & 0x01;
		data >>= 1;
	}
	
	// �r�b�g�����ް��o��
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

    LCD_wr("Timer Start!",0,0);  // 1�s�ڂ̕\����ύX
    LCD_wr("Time: 0 sec",1,0);   // �����b���\��

    while(1) {
        // ���C�����[�v�͋�̂܂�
    }
    
    return;
}