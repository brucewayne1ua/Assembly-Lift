
; Определение портов и переменных
POV1    EQU P0.0    ; кнопка всередені ліфта 1 поверх
POV2    EQU P0.1    ; кнопка всередені ліфта 2 поверх
POV3    EQU P0.2    ; кнопка всередені ліфта 3 поверх
STOP    EQU P0.3    ; кнопка стоп
VCLC    EQU P0.4    ; кнопка виклик
VCPV1   EQU P0.5    ; кнопка виклику ліфта ззовні 1 поверх
VCPV2   EQU P0.6    ; кнопка виклику ліфта ззовні 2 поверх
VCPV3   EQU P0.7    ; кнопка виклику ліфта ззовні 3 поверх
DAT1    EQU P1.0    ; кнопка що рахується за датчик 1 поверх
DAT2    EQU P1.1    ; кнопка що рахується за датчик 2 поверх
DAT3    EQU P1.2    ; кнопка що рахується за датчик 3 поверх
DVER    EQU P1.3    ; кнопка що рахується за датчик закриті двері
LED_P1  EQU P1.4    ; лампочка індикатор на якому поверсі зараз ліфт 1 поверх
LED_P2  EQU P1.5    ; лампочка індикатор на якому поверсі зараз ліфт 2 поверх
LED_P3  EQU P1.6    ; лампочка індикатор на якому поверсі зараз ліфт 3 поверх
LED_DVGN EQU P1.7   ; лампочка що імітує двигун
LED_SUGN EQU P2.0   ; лампочка сигнал диспетчеру

; Инициализация состояния
S0:
    CLR LED_P1
    CLR LED_P2
    CLR LED_P3
    CLR LED_DVGN
    CLR LED_SUGN
    JMP S1

; Главный цикл
S1:
    JB POV1, S11
    JB POV2, S12
    JB POV3, S13
    JB STOP, S_STOP
    JB VCPV1, S11
    JB VCPV2, S12
    JB VCPV3, S13
    JMP S1

; Логика для лифта на 1 поверх
S11:
    JB STOP, S_STOP
    JB VCLC, CALL_DISP
    JB DVER, S11   ; Очікування закриття дверей
    SETB LED_DVGN
    JB DAT1, S21
    CLR LED_DVGN   ; Сброс двигуна после достижения поверху
    JMP S11

; Логика для лифта на 2 поверх
S12:
    JB STOP, S_STOP
    JB VCLC, CALL_DISP
    JB DVER, S12   ; Очікування закриття дверей
    SETB LED_DVGN
    JB DAT2, S22
    CLR LED_DVGN   ; Сброс двигуна после достижения поверху
    JMP S12

; Логика для лифта на 3 поверх
S13:
    JB STOP, S_STOP
    JB VCLC, CALL_DISP
    JB DVER, S13   ; Очікування закриття дверей
    SETB LED_DVGN
    JB DAT3, S23
    CLR LED_DVGN   ; Сброс двигуна после достижения поверху
    JMP S13

; Логика для досягнення 1 поверху
S21:
    CLR LED_DVGN
    SETB LED_P1
    CLR LED_P2
    CLR LED_P3
    JMP S1

; Логика для досягнення 2 поверху
S22:
    CLR LED_DVGN
    CLR LED_P1
    SETB LED_P2
    CLR LED_P3
    JMP S1

; Логика для досягнення 3 поверху
S23:
    CLR LED_DVGN
    CLR LED_P1
    CLR LED_P2
    SETB LED_P3
    JMP S1

; Обробка зупинки
S_STOP:
    CLR LED_DVGN
    JMP S1

; Виклик диспетчера
CALL_DISP:
    SETB LED_SUGN
    CLR LED_DVGN
    JMP S1

