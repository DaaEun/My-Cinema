-- 영화
CREATE TABLE MOVIE (
    MVNO CHAR(7),               -- 식별문자 (MVXXXXX)        
    MVNAME VARCHAR2(40),        -- 제목
    MVRELEASEDATE DATE,         -- 개봉일
    MVDIRECTOR VARCHAR2(20),    -- 감독
    MVCLASS NUMBER(2),          -- 시청등급
    MVRUNTIME NUMBER(3),        -- 상영시간 (단위 : MIN)
    MVGENRE VARCHAR2(10),       -- 장르
    MVSTORY NVARCHAR2(1000),    -- 줄거리
    MVPREVIEW BLOB,             -- 예고편
    MVPOST BLOB,                -- 포스터
    PRIMARY KEY(MVNO)
);
 
-- 영화일정정보
CREATE TABLE MOVIESCHEDULE_INFO (
    STARTEDATE DATE,        -- 시작일
    CLOSEDATE DATE,         -- 종료일
    ISMOVIE BINARY_FLOAT,   -- 영화상영여부
    MVNO CHAR(7) REFERENCES MOVIE(MVNO),   -- 영화_식별문자
    PRIMARY KEY(MVNO)
);

-- 영화정보
CREATE TABLE MOVIE_INFO (
    MVBOOKRANK NUMBER(2),   -- 예매순위 
    MVBOOKRATE NUMBER(4,2), -- 예매율
    MVNO CHAR(7) REFERENCES MOVIE(MVNO),   -- 영화_식별문자
    PRIMARY KEY(MVNO)
);

-- 배우정보
CREATE TABLE ACTOR_INFO (
    ACTORNAME VARCHAR2(20), -- 배우이름
    MVNO CHAR(7) REFERENCES MOVIE(MVNO),   -- 영화_식별문자
    PRIMARY KEY(MVNO)
);

-- 본인인증
CREATE TABLE VERIFICATION (
    VERNAME VARCHAR2(10),   -- 이름
    VERPHONE NUMBER(11),    -- 전화번호
    VERBIRTH DATE           -- 생년월일 
);

-- 사용자
CREATE TABLE USERS ( 
    USERID VARCHAR2(20),    -- 식별아이디
    USERCODE NUMBER(1),     -- 구분코드 (0=비회원, 1=회원, 2=관리자)
    PRIMARY KEY(USERID)
);

-- 비회원정보
CREATE TABLE NONMEMBERS_INFO (
    NONMEMPWD VARCHAR2(20),         -- 임시비밀번호 
    NONMEMNAME VARCHAR2(10),        -- 이름
    NONMEMPHONE NUMBER(11),         -- 전화번호
    NONMEMBIRTH DATE,               -- 생년월일
    ISVERIFICATION BINARY_FLOAT,    -- 본인인증여부
    NONMEMID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE,    -- 임시아이디
    PRIMARY KEY(NONMEMID)
);

-- 회원정보
CREATE TABLE MEMBERS_INFO (
    MEMPWD VARCHAR2(20),            -- 비밀번호 
    MEMNAME VARCHAR2(10),           -- 이름
    MEMEMAIL VARCHAR2(40),          -- 이메일
    MEMPHONE NUMBER(11),            -- 전화번호
    MEMBIRTH DATE,                  -- 생년월일
    ISVERIFICATION BINARY_FLOAT,    -- 본인인증여부
    TOTALPOINT NUMBER(6),        -- 누적포인트
    MEMID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE,   -- 아이디
    PRIMARY KEY(MEMID)
);

-- 선호장르정보
CREATE TABLE FAVORGENRE_INFO (
    FAVORGENRE VARCHAR2(10),    -- 선호장르
    MEMID VARCHAR2(20) REFERENCES MEMBERS_INFO(MEMID) ON DELETE CASCADE, -- 회원정보_아이디
    PRIMARY KEY(MEMID)
);

-- 관리자정보
CREATE TABLE MANAGERS_INFO (
    MNGPWD VARCHAR2(20),        -- 비밀번호 
    MNGNAME VARCHAR2(10),       -- 이름
    MNGID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE, -- 아이디
    PRIMARY KEY(MNGID)
);

-- 지역
/* 정문통학마을, 학식러버마을, 후문자취마을, 하늘연못마을, 쪽운동장마을 */
CREATE TABLE LOCAL (
    LOCALNO CHAR(7),        -- 식별문자
    LOCALNAME VARCHAR2(20), -- 이름
    PRIMARY KEY(LOCALNO)
);

-- 영화관
/*
    정문통학마을 : 전농관, 자작마루, 건설공학관(건공관)
    학식러버마을 : 학생회관(학관), 21세기관(21관), 자연과학관(자과관)
    후문자취마을 : 창공관, 배봉관
    하늘연못마을 : 정보기술관(정기관), 인문학관, 음악관
    쪽운동장마을 : 과학기술관(과기관), 미래관, 100주년기념관(100기관)
*/
CREATE TABLE CINEMA (
    CINEMANO CHAR(8),           -- 식별문자
    CINEMANAME VARCHAR2(20),    -- 이름
    LOCALNO CHAR(7) REFERENCES LOCAL(LOCALNO),  -- 지역_식별문자
    PRIMARY KEY(CINEMANO)
);

-- 상영방식
/* 
    2D 3D 4DX SOUNDX 
    2D : 10000원 (DEFAULT)
    3D : 20000원 (X2)
    4D : 30000원 (X3)
    SOUNDX : 30000원 (X3)
*/
CREATE TABLE SCREENWAY (
    SCRWAYNO CHAR(8),       -- 식별문자
    SCRWAY VARCHAR2(8),     -- 상영방식
    SCRPRICE NUMBER(5),     -- 상영금액
    PRIMARY KEY(SCRWAYNO)
);

-- 상영관
CREATE TABLE THEATER (
    THEATERNO CHAR(9),      -- 식별문자
    SEATTTL NUMBER(3),      -- 총좌석수
    SEATCNT NUMBER(3),      -- 누적좌석수
    CINEMANO CHAR(8) REFERENCES CINEMA(CINEMANO) NOT NULL,      -- 영화관_식별문자
    SCRWAYNO CHAR(8) REFERENCES SCREENWAY(SCRWAYNO),            -- 상영방식_식별문자
    PRIMARY KEY(THEATERNO),
    CONSTRAINT THEATERNO_CINEMANO_KEY UNIQUE(THEATERNO, CINEMANO)
);

-- 상영일정
CREATE TABLE SCHEDULE (
    SCHNO CHAR(10), -- 식별문자
    SCHTIME DATE,   -- 상영일자 (날짜랑 시각 포함)
    THEATERNO CHAR(9) REFERENCES THEATER(THEATERNO),   -- 상영관_식별문자
    MVNO CHAR(7) REFERENCES MOVIE(MVNO),               -- 영화_식별문자
    PRIMARY KEY(SCHNO)
);

-- 좌석
CREATE TABLE SEAT (
    SEATNO CHAR(3),         -- 좌석문자
    ISEMPTY BINARY_FLOAT,   -- 좌석여부
    THEATERNO CHAR(9) REFERENCES THEATER(THEATERNO) NOT NULL,   -- 상영관_식별문자
    SCHNO CHAR(10) REFERENCES SCHEDULE(SCHNO) NOT NULL,         -- 상영일정_식별문자
    PRIMARY KEY(SEATNO),
    CONSTRAINT SEATNO_THEATERNO_SCHNO_KEY UNIQUE(SEATNO, THEATERNO, SCHNO)
);

-- 관객방식
/*  일반 청소년 경로 우대 
    일반 : DEFAULT
    청소년 : 0.8
    경로 : 0.6
    우대 : 0.4 
*/
CREATE TABLE MOVIEGOERS (
    GOERSNO CHAR(7),        -- 식별문자
    GOERSWAY VARCHAR2(10),   -- 관객방식
    GOERSDC NUMBER(2,1),    -- 할인율
    PRIMARY KEY(GOERSNO)
);

-- 예매
CREATE TABLE BOOKING (
    BOOKINGNO CHAR(11),     -- 식별문자 (BOOKINGXXXX)
    GOERSCNT NUMBER(2),     -- 관객수
    BOOKINGDATE TIMESTAMP,  -- 예매시각
    PRIMARY KEY(BOOKINGNO)
);

-- 예매좌석정보
CREATE TABLE BOOKSEAT_INFO (  
    BOOKINGNO CHAR(11) REFERENCES BOOKING(BOOKINGNO),   -- 예매_식별문자
    SEATNO CHAR(3) REFERENCES SEAT(SEATNO) NOT NULL,    -- 좌석_좌석문자
    GOERSNO CHAR(7) REFERENCES MOVIEGOERS(GOERSNO),     -- 관객방식_식별문자
    PRIMARY KEY(BOOKINGNO),
    CONSTRAINT BOOKINGNO_SEATNO UNIQUE(BOOKINGNO, SEATNO)
);

-- 예매자정보
CREATE TABLE BOOKER_INFO (
    ISCLASS BINARY_FLOAT,   -- 시청가능여부
    USERID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE, -- 사용자_식별아이디
    MVNO CHAR(7) REFERENCES MOVIE(MVNO),                            -- 영화_식별문자
    BOOKINGNO CHAR(11) REFERENCES BOOKING(BOOKINGNO),               -- 예매_식별문자
    PRIMARY KEY(USERID)
);

-- 결제방식
/* 카드 무통장입금 인터넷결제 */
CREATE TABLE PAYWAY (
    PAYWAYNO CHAR(7),       -- 식별문자 (PAYWAYX)
    PAYWAYCODE NUMBER(1),   -- 구분코드 (0=신용카드, 1=무통장입금, 2=인터넷결제)
    PRIMARY KEY(PAYWAYNO)
);

-- 신용카드정보
CREATE TABLE CREDITCARD_INFO (
    CARDNAME VARCHAR(20),   -- 카드사
    CARDNUM NUMBER(20),     -- 카드번호
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO),   -- 결제방식_식별문자
    PRIMARY KEY(PAYWAYNO)
);

-- 무통장입금정보
CREATE TABLE DEPOSIT_INFO (
    BANKNAME VARCHAR2(10),  -- 은행사
    ACOUNTNUM NUMBER(20),   -- 계좌번호
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO),   -- 결제방식_식별문자
    PRIMARY KEY(PAYWAYNO)
);

-- 인터넷결제정보
CREATE TABLE ONLINEPAY_INFO (
    QRCODE BLOB,    -- QR코드
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO),   -- 결제방식_식별문자
    PRIMARY KEY(PAYWAYNO)
);

-- 결제
CREATE TABLE PAYING (
    PAYNO CHAR(7),         -- 식별문자 (PAYXXXX)
    PRICE NUMBER(7),       -- 결제금액
    BOOKINGNO CHAR(11) REFERENCES BOOKING(BOOKINGNO),   -- 예매_식별문자
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO),       -- 결제방식_식별문자
    PRIMARY KEY(PAYNO)
);

-- 결제내역정보
CREATE TABLE PAYLIST_INFO (
    PAYDATE TIMESTAMP,       -- 결제시각
    ISVALID BINARY_FLOAT,    -- 유효여부
    ISWATCHED BINARY_FLOAT,  -- 시청여부
    PAYNO CHAR(7) REFERENCES PAYING(PAYNO) NOT NULL,    -- 결제_식별문자
    USERID VARCHAR2(20) REFERENCES USERS(USERID),       -- 사용자_식별아이디
    PRIMARY KEY(USERID),
    CONSTRAINT USERID_PAYNO_KEY UNIQUE(USERID, PAYNO)
);

-- 포인트
/*
적립은 5%, 소모는 언제든 가능
*/
CREATE TABLE POINT (
    POINTNO CHAR(9),        -- 식별문자(POINTXXXX)
    POINTWAY BINARY_FLOAT,  -- 활용방식
    POINTTMP NUMBER(6),     -- 활용포인트
    MEMID VARCHAR2(20) REFERENCES MEMBERS_INFO(MEMID) ON DELETE CASCADE,    -- 회원정보_아이디
    PAYNO CHAR(7) REFERENCES PAYING(PAYNO),                                 -- 결제_식별문자
    PRIMARY KEY(POINTNO)
);    

-- 포인트내역정보
CREATE TABLE POINTLIST_INFO (
    POINTDATE TIMESTAMP,    -- 활용시각
    ISVALID BINARY_FLOAT,   -- 유효여부
    POINTNO CHAR(9) REFERENCES POINT(POINTNO) NOT NULL,                     -- 포인트_식별문자
    MEMID VARCHAR2(20) REFERENCES MEMBERS_INFO(MEMID) ON DELETE CASCADE,    -- 회원정보_아이디
    PRIMARY KEY(MEMID),
    CONSTRAINT MEMID_POINTNO_KEY UNIQUE(MEMID, POINTNO)
);

-- 티켓
CREATE VIEW TICKET AS
SELECT
    USERS.USERID,           -- 사용자_식별아이디
    MOVIE.MVNAME,           -- 영화_이름
    MOVIE.MVCLASS,          -- 영화_시청등급
    LOCAL.LOCALNAME,        -- 지역_이름
    CINEMA.CINEMANAME,      -- 영화관_이름
    THEATER.THEATERNO,      -- 상영관_식별문자
    SCREENWAY.SCRWAY,       -- 상영방식_상영방식
    SCHEDULE.SCHTIME,       -- 상영일정_상영일자
    BOOKSEAT_INFO.SEATNO    -- 예매좌석정보_좌석_좌석문자
FROM PAYLIST_INFO, USERS, PAYING, BOOKING, BOOKSEAT_INFO, SEAT, SCHEDULE, MOVIE, THEATER, SCREENWAY, CINEMA, LOCAL
WHERE PAYLIST_INFO.USERID = USERS.USERID AND
    PAYLIST_INFO.PAYNO = PAYING.PAYNO AND 
    PAYING.BOOKINGNO = BOOKING.BOOKINGNO AND
    BOOKING.BOOKINGNO = BOOKSEAT_INFO.BOOKINGNO AND
    BOOKSEAT_INFO.SEATNO = SEAT.SEATNO AND
    SEAT.SCHNO = SCHEDULE.SCHNO AND
    SCHEDULE.MVNO = MOVIE.MVNO AND
    SCHEDULE.THEATERNO = THEATER.THEATERNO AND
    THEATER.SCRWAYNO = SCREENWAY.SCRWAYNO AND
    THEATER.CINEMANO = CINEMA.CINEMANO AND
    CINEMA.LOCALNO = LOCAL.LOCALNO;

-- 영수증
CREATE VIEW RECEIPT AS
SELECT
    USERS.USERID,           -- 사용자_식별아이디
    PAYWAY.PAYWAYCODE,      -- 결제방식_구분코드
    PAYING.PRICE,           -- 결제_결제금액
    PAYLIST_INFO.PAYDATE,   -- 결제내역정보_결제시각
    POINT.POINTWAY,         -- 포인트_활용방식
    POINT.POINTTMP          -- 포인트_활용포인트
FROM PAYLIST_INFO, USERS, PAYING, PAYWAY, POINT
WHERE PAYLIST_INFO.USERID = USERS.USERID AND 
    PAYLIST_INFO.PAYNO = PAYING.PAYNO AND
    PAYING.PAYWAYNO = PAYWAY.PAYWAYNO AND 
    PAYING.PAYNO = POINT.PAYNO;