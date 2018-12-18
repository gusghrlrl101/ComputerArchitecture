# ComputerArchitecture
Verilog를 이용한 두 삼각형의 충돌 여부 판단 CPU

input.txt 에 명령을 입력한 후 Assembly.exe를 실행시키면 output.txt에 변환된 기계어 생성

생성된 코드를 Data_Cache.v 파일 내에 붙여넣기

Vivado 18.02 를 사용했음


Register	4bit
0	general register
...
10
11	ccw return adress
12	ccw return value
13	intersect return address
14	intersect return value
15	function finish


Data cache	16bit
0	A1	// 좌표 저장용
1	A2
2	B1
3	B2
4	C1
5	C2
6	D1
7	D2
8	E1
9	E2
10	F1
11	F2
12	a1	// intersect 계산용
13	a2
14	b1
15	b2
16	c1
17	c2
18	d1
19	d2
20	ccw1	// ccw 값
21	ccw2
22	ccw3
23	ccw4
...
255	non-use
