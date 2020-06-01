/* Copyright 2017
        codigo basado en el libro Sistemas Empotrados en tiempo real 
1.5     Procesamiento Secuecial (Pagina 8)
1.5.1 Ejemplo: Un Termostato digital
se muestra un ejemplo sencillo de un sistema en tiempo real implantado mediante 
procesamiento secuencial. El sistema es un termostato para la calefacción. 
Como se puede observar, el sistema consta de cuatro tareas que se ejecutan continuamente:
- La primera verifica si hay alguna tecla pulsada (UP o DOWN) y en caso
afirmativo modifica la consigna de temperatura. Si no hay ninguna
tecla pulsada, simplemente termina de ejecutarse (no bloqueo).
- La segunda tarea realiza una medida de la temperatura de la habitación.
- La tercera ejecuta el control. Éste puede ser un control sencillo todo/nada, 
consistente en que si la temperatura es mayor que la consigna
se apaga la calefacción y si es inferior se enciende.
- Por último, la cuarta tarea se encarga de encender o apagar la cale-
facción en función de la salida de la tarea de control
 */

/*==================[inclusions]=============================================*/

#include "board.h"
#include "chip.h"

#include "main.h"

/*==================[macros and definitions]=================================*/

/*==================[internal data declaration]==============================*/

/*==================[internal functions declaration]=========================*/

/*==================[internal data definition]===============================*/

#define UP 2
#define DOWN 1
#define ON 1
#define OFF 0
#define HISTERESIS 3
#define LED_ROJO 4
#define LED_VERDE 5
int temp;
int consigna = 10;
int convertido = 0;
int fin_timer = 0;
int calefaccion;

/*==================[external data definition]===============================*/

/*==================[internal functions definition]==========================*/

static void initHardware(void)
{
    SystemCoreClockUpdate();
    Board_Init();
}

static void InitTimer(void) //el alcance esta afuera de este archivo
{
	Chip_RIT_Init(LPC_RITIMER);
	Chip_RIT_SetTimerInterval(LPC_RITIMER,1);
}

void RIT_IRQHandler(void) //el alcalce esta fuera de este archivo
{
	static int seg;
	static int ms;

        ms++;
        seg++;
	if (ms == 100){
		convertido = 1;
		ms = 0;
		}
        if(seg == 1000){
                Board_LED_Toggle(LED_VERDE); //actividad
		fin_timer = 1;
		seg = 0;
	}

	Chip_RIT_ClearInt(LPC_RITIMER);
}

static void InitSerie(void)
{
    Chip_UART_Init(LPC_USART2);
	Chip_UART_SetBaud(LPC_USART2, 9600);  /* Set Baud rate */
	Chip_UART_ConfigData(LPC_USART2, (UART_LCR_WLEN8 | UART_LCR_SBS_1BIT));
	Chip_UART_SetupFIFOS(LPC_USART2, UART_FCR_FIFO_EN | UART_FCR_TRG_LEV3); /* Modify FCR (FIFO Control Register)*/
	Chip_UART_TXEnable(LPC_USART2); /* Enable UART Transmission */
	Chip_SCU_PinMux(7, 1, MD_PDN, FUNC6);              /* P7_1,FUNC6: UART2_TXD */
	Chip_SCU_PinMux(7, 2, MD_PLN|MD_EZI|MD_ZI, FUNC6); /* P7_2,FUNC6: UART2_RXD */
}

static void SeriePuts(char *data)
{
	while(*data != 0)
	{
		while ((Chip_UART_ReadLineStatus(LPC_USART2) & UART_LSR_THRE) == 0) {}
		Chip_UART_SendByte(LPC_USART2, *data);
		data++;
	}
}

static uint8_t LeerTeclado(void)
{
        return Buttons_GetStatus();
}

static int Convirtiendo() {
	if (convertido == 0){
		return 0;
	}
	else {
		convertido = 0;
		return 1;
	}
}

static void LanzarConversionAD(void){
	}

static int LeerConversorAD(void){ //simulado
	if (calefaccion == 1) {
		temp = temp + 1;
	}
	else {
		temp = temp - 1;
	}
	return temp;
}
////////////////////////////////////////////////////////

static void LeerTeclas(void)
{
        uint8_t tecla;
	tecla = LeerTeclado();
	if(tecla == UP ){
		consigna ++;
	}
	if(tecla == DOWN ){
		consigna --;
	}
}

static void MedirTemperatura(void){
	LanzarConversionAD();
	while ( Convirtiendo());
	/* Esperar EOC */
	temp = LeerConversorAD();

}

static void Controlar(void){
	if(temp < consigna ){
		calefaccion = ON;
		Board_LED_Set(LED_ROJO, TRUE); //enciende led
		}
	else if(temp > consigna + HISTERESIS ){
		calefaccion = OFF;
		Board_LED_Set(LED_ROJO, FALSE); //apaga led
		}
}

static void ImprimirTemp(void)
{
	char cadena [50];
	sprintf (cadena , " Temp:%02d C - Consigna:%02d - calefaccion:%01d\n", temp,consigna,calefaccion);
	SeriePuts (cadena);
}


static void TareaInactiva (void)
{
	while ( ! fin_timer );
	fin_timer = 0;
}
/*==================[external functions definition]==========================*/

int main(void)
{
	initHardware(); /* Inicializa el Hardware del microcontrolador */
	InitTimer(); /* Inicializa timer RIT */
	InitSerie(); /* Inicializa puerto serie */

	NVIC_EnableIRQ(RITIMER_IRQn);

	for(;;){
		LeerTeclas();
		MedirTemperatura();
		Controlar();
		ImprimirTemp();
		//TareaInactiva(); 
	}
}

/*==================[end of file]============================================*/
