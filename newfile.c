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
volatile unsigned char overflowCount = 0;  // �V�K�ǉ��F�I�[�o�[�t���[�񐔂̃J�E���^

void startTimer(void) {
    TMR0 = 12;                              // �v�����[�h�l��ݒ�i1�I�[�o�[�t���[ ��25ms)
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
        TMR0 = 12;                          // �ēx�v�����[�h
        if (timerRunning) {
            overflowCount++;
            if (overflowCount >= 4) {       // 4�I�[�o�[�t���[�Ŗ�0.1�b
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
    
    out_inst_LCD(0x02);     //�t�@���N�V�����Z�b�g;
    out_inst_LCD(0x02);     //�t�@���N�V�����Z�b�g        ���4bit
    out_inst_LCD(0x08);     //�t�@���N�V�����Z�b�g        ����4bit
    out_inst_LCD(0x00);     //�\��ON/OFF�R���g���[��    ���4bit 4bit
    out_inst_LCD(0x0c);     //�\��ON/OFF�R���g���[��    
                    //����4bit �\��ON,�J�[�\��OFF,�u�����NOFF
    out_inst_LCD(0x00);     //�\���N���A            ���4bit 4bit
    out_inst_LCD(0x01);     //�\���N���A            ����4bit
    out_inst_LCD(0x00);     //�G���g�����[�h�Z�b�g        ���4bit
    out_inst_LCD(0x06);     //�G���g�����[�h�Z�b�g        ����4bit
    
    __delay_ms(20);
}

// �����f�[�^���M�֐�
void LCD_wr_char(char c)
{
    char str_H, str_L;

    str_H = c & 0xf0;
    str_H = str_H >> 4;     // ��ʃf�[�^
    str_L = c & 0x0f;       // ���ʃf�[�^

    out_str_LCD(str_H);     // �����R�[�h�o�́i��ʃf�[�^�j
    out_str_LCD(str_L);     // �����R�[�h�o�́i���ʃf�[�^�j
}

// �C���X�g���N�V�����R�[�h�o�͊֐�
void out_inst_LCD(unsigned char out_data)
{
    out_LCD(out_data);      // LCD�Ƀf�[�^�o��
    RS = 0; E = 1;          // E:1,RS:0
    E = 0;                  // E:0
    __delay_ms(5);
}

// �����R�[�h�o�͊֐�
void out_str_LCD(unsigned char out_data)
{
    out_LCD(out_data);      // LCD�Ƀf�[�^�o��
    RS = 1; E = 1;          // E:1,RS:1
    E = 0;                  // E:0
    __delay_us(100);
}

// LCD�o�͊֐�
void out_LCD(unsigned char data)
{
    // �z����g�p�����A���ڃr�b�g����ŏo��
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