# ComputerArchitecture

Verilog를 이용한 두 삼각형의 충돌 여부 판단 CPU

Vivado 18.02

# Data Path

![DataPath](./image/image.png)

4 cycle, PipeLine 

# Schemetic

![Schemetic](./image/image2.png)

# 설명

### Register (4 bit)

num | used
--- | ---
0	~ 10 | general register
11 | ccw return adress
12 | ccw return value
13 | intersect return address
14 | intersect return value
15 | function finish

### Data cache (16 bit)

num | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 |
-- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |  -- |
used | A1 | A2 | B1 | B2 | C1 | C2 | D1 | D2 | E1 | E2 | F1 | F2 | 

num | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 ~ 255 |
-- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
used | a1 | a2 | b1 | b2 | c1 | c2 | d1 | d2 | ccw1 | ccw2 | ccw3 | ccw4 | non-used |

# 실행 방법

![Assembly](./image/image3.png)

1. input.txt 에 명령을 입력한 후 Assembly.exe를 실행시키면 output.txt에 변환된 기계어 생성

2. 생성된 코드를 Data_Cache.v 파일 내에 붙여넣기

3. 시뮬레이션을 이용하여 결과 확인

# 실행 결과

#### 교차하는 경우

![Example1](./image/image4.png)

#### 교차하지 않는 경우

![Example2](./image/image5.png)

