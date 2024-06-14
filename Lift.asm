
; ����������� ������ � ����������
POV1    EQU P0.0    ; ������ �������� ���� 1 ������
POV2    EQU P0.1    ; ������ �������� ���� 2 ������
POV3    EQU P0.2    ; ������ �������� ���� 3 ������
STOP    EQU P0.3    ; ������ ����
VCLC    EQU P0.4    ; ������ ������
VCPV1   EQU P0.5    ; ������ ������� ���� ����� 1 ������
VCPV2   EQU P0.6    ; ������ ������� ���� ����� 2 ������
VCPV3   EQU P0.7    ; ������ ������� ���� ����� 3 ������
DAT1    EQU P1.0    ; ������ �� �������� �� ������ 1 ������
DAT2    EQU P1.1    ; ������ �� �������� �� ������ 2 ������
DAT3    EQU P1.2    ; ������ �� �������� �� ������ 3 ������
DVER    EQU P1.3    ; ������ �� �������� �� ������ ������ ����
LED_P1  EQU P1.4    ; �������� ��������� �� ����� ������ ����� ��� 1 ������
LED_P2  EQU P1.5    ; �������� ��������� �� ����� ������ ����� ��� 2 ������
LED_P3  EQU P1.6    ; �������� ��������� �� ����� ������ ����� ��� 3 ������
LED_DVGN EQU P1.7   ; �������� �� ���� ������
LED_SUGN EQU P2.0   ; �������� ������ ����������

; ������������� ���������
S0:
    CLR LED_P1
    CLR LED_P2
    CLR LED_P3
    CLR LED_DVGN
    CLR LED_SUGN
    JMP S1

; ������� ����
S1:
    JB POV1, S11
    JB POV2, S12
    JB POV3, S13
    JB STOP, S_STOP
    JB VCPV1, S11
    JB VCPV2, S12
    JB VCPV3, S13
    JMP S1

; ������ ��� ����� �� 1 ������
S11:
    JB STOP, S_STOP
    JB VCLC, CALL_DISP
    JB DVER, S11   ; ���������� �������� ������
    SETB LED_DVGN
    JB DAT1, S21
    CLR LED_DVGN   ; ����� ������� ����� ���������� �������
    JMP S11

; ������ ��� ����� �� 2 ������
S12:
    JB STOP, S_STOP
    JB VCLC, CALL_DISP
    JB DVER, S12   ; ���������� �������� ������
    SETB LED_DVGN
    JB DAT2, S22
    CLR LED_DVGN   ; ����� ������� ����� ���������� �������
    JMP S12

; ������ ��� ����� �� 3 ������
S13:
    JB STOP, S_STOP
    JB VCLC, CALL_DISP
    JB DVER, S13   ; ���������� �������� ������
    SETB LED_DVGN
    JB DAT3, S23
    CLR LED_DVGN   ; ����� ������� ����� ���������� �������
    JMP S13

; ������ ��� ���������� 1 �������
S21:
    CLR LED_DVGN
    SETB LED_P1
    CLR LED_P2
    CLR LED_P3
    JMP S1

; ������ ��� ���������� 2 �������
S22:
    CLR LED_DVGN
    CLR LED_P1
    SETB LED_P2
    CLR LED_P3
    JMP S1

; ������ ��� ���������� 3 �������
S23:
    CLR LED_DVGN
    CLR LED_P1
    CLR LED_P2
    SETB LED_P3
    JMP S1

; ������� �������
S_STOP:
    CLR LED_DVGN
    JMP S1

; ������ ����������
CALL_DISP:
    SETB LED_SUGN
    CLR LED_DVGN
    JMP S1

