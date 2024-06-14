pov1 set p0.0    ;  ������ �������� 1
pov2 set p0.1    ;  ������ �������� 2
pov3 set p0.2    ;  ������ �������� 3
stop set p0.3    ;  ������ ����
vclc set p0.4    ;  ������ ������
vcpv1 set p0.5   ;  ������ ���� 1
vcpv2 set p0.6   ;  ������ ���� 2
vcpv3 set p0.7   ;  ������ ���� 3
dat1   set p1.0  ;  ������ 1 �������
dat2   set p1.1  ;  ������ 2 �������
dat3   set p1.2  ;  ������ 3 �������
dver   set p1.3  ;  ������ �� ������
led_p1 set p1.4  ;  �������� ��������� 1
led_p2 set p1.5  ;  �������� ��������� 2
led_p3 set p1.6  ;  �������� ��������� 3
led_dvgn set p1.7   ;  ������
led_sugn set p2.0   ;  ������

s0:
    clr led_p1
    clr led_p2
    clr led_p3
    clr led_dvgn
    clr led_sugn

s1:
    jb pov1, s11
    jb pov2, s12
    jb pov3, s13
    jb stop, s0
    jb vcpv1, s11
    jb vcpv2, s12
    jb vcpv3, s13
    jmp s1

s11:
    jb stop, s_stop
    jb vclc, call_disp
    jb dver, s11   ; ���������� �������� ������
    setb led_dvgn
    jb dat1, s21
    jmp s11

s12:
    jb stop, s_stop
    jb vclc, call_disp
    jb dver, s12   ; ���������� �������� ������
    setb led_dvgn
    jb dat2, s22
    jmp s12

s13:
    jb stop, s_stop
    jb vclc, call_disp
    jb dver, s13   ; ���������� �������� ������
    setb led_dvgn
    jb dat3, s23
    jmp s13

s21:
    clr led_dvgn
    setb led_p1
    clr led_p2
    clr led_p3
    jmp s1

s22:
    clr led_dvgn
    clr led_p1
    setb led_p2
    clr led_p3
    jmp s1

s23:
    clr led_dvgn
    clr led_p1
    clr led_p2
    setb led_p3
    jmp s1

s_stop:
    clr led_dvgn
    jmp s1

call_disp:
    setb led_sugn
    clr led_dvgn
    jmp s1

