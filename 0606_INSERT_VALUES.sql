/*
    # 2021년 기준 02년생까지 청불 영화가능
*/

-- 영화 도메인(영화 크롤링) 


-- 사용자 도메인
-- INSERT INTO USERS VALUES(식별아이디, 구분코드);
INSERT INTO USERS VALUES('bubble3jh456', 2);
INSERT INTO USERS VALUES('daaeun123', 2);


-- 관리자 도메인
-- INSERT INTO MANAGERS_INFO VALUES(비밀번호, 이름, 아이디);
INSERT INTO MANAGERS_INFO VALUES('aaa1111!', '강진호', 'bubble3jh456');
INSERT INTO MANAGERS_INFO VALUES('bbb2222!', '양다은', 'daaeun123');


-- 본인인증 도메인
-- INSERT INTO VERIFICATION VALUES(이름, 전화번호, 생년월일);
INSERT INTO VERIFICATION VALUES('유재석', 01011112222, '90/12/04');
INSERT INTO VERIFICATION VALUES('박명수', 01022223333, '84/06/23');
INSERT INTO VERIFICATION VALUES('하하', 01033334444, '87/12/27');
INSERT INTO VERIFICATION VALUES('정준하', 01044445555, '77/04/21');
INSERT INTO VERIFICATION VALUES('양세형', 01055556666, '00/05/05');
INSERT INTO VERIFICATION VALUES('조세호', 01066667777, '03/08/13');    -- 청소년
INSERT INTO VERIFICATION VALUES('강호동', 01077778888, '01/01/02');
INSERT INTO VERIFICATION VALUES('이상민', 01088889999, '97/03/08');
INSERT INTO VERIFICATION VALUES('서장훈', 01099990000, '01/11/12');
INSERT INTO VERIFICATION VALUES('김영철', 01012345678, '75/06/30');
INSERT INTO VERIFICATION VALUES('이수근', 01022334455, '74/02/20');
INSERT INTO VERIFICATION VALUES('김희철', 01066778899, '01/10/22');
INSERT INTO VERIFICATION VALUES('민경훈', 01087654321, '07/12/25');    -- 청소년


-- 지역 도메인
-- INSERT INTO LOCAL VALUES(식별문자, 이름);
INSERT INTO LOCAL VALUES('LOCAL01', '정문통학마을');
INSERT INTO LOCAL VALUES('LOCAL02', '학식러버마을');
INSERT INTO LOCAL VALUES('LOCAL03', '후문자취마을');
INSERT INTO LOCAL VALUES('LOCAL04', '하늘연못마을');
INSERT INTO LOCAL VALUES('LOCAL05', '쪽운동장마을');


-- 영화관 도메인
-- INSERT INTO CINEMA VALUES(식별문자, 이름, 지역_식별문자);
INSERT INTO CINEMA VALUES('CINEMA01', '전농관', 'LOCAL01');
INSERT INTO CINEMA VALUES('CINEMA02', '자작마루', 'LOCAL01');
INSERT INTO CINEMA VALUES('CINEMA03', '건공관', 'LOCAL01');
INSERT INTO CINEMA VALUES('CINEMA04', '학관', 'LOCAL02');
INSERT INTO CINEMA VALUES('CINEMA05', '21관', 'LOCAL02');
INSERT INTO CINEMA VALUES('CINEMA06', '자과관', 'LOCAL02');
INSERT INTO CINEMA VALUES('CINEMA07', '창공관', 'LOCAL03');
INSERT INTO CINEMA VALUES('CINEMA08', '배봉관', 'LOCAL03');
INSERT INTO CINEMA VALUES('CINEMA09', '정기관', 'LOCAL04');
INSERT INTO CINEMA VALUES('CINEMA10', '인문학관', 'LOCAL04');
INSERT INTO CINEMA VALUES('CINEMA11', '음악관', 'LOCAL04');
INSERT INTO CINEMA VALUES('CINEMA12', '과기관', 'LOCAL05');
INSERT INTO CINEMA VALUES('CINEMA13', '미래관', 'LOCAL05');
INSERT INTO CINEMA VALUES('CINEMA14', '백기관', 'LOCAL05');


-- 상영방식 도메인
-- INSERT INTO SCREENWAY VALUES(식별문자, 상영방식, 상영금액);
INSERT INTO SCREENWAY VALUES('SCRWAY01', '2D', 10000);
INSERT INTO SCREENWAY VALUES('SCRWAY02', '3D', 20000);
INSERT INTO SCREENWAY VALUES('SCRWAY03', '4DX', 30000);
INSERT INTO SCREENWAY VALUES('SCRWAY04', 'SOUNDX', 30000);

-- 상영관 도메인
-- INSERT INTO THEATER VALUES(식별문자, 총좌석수, 누적좌석수, 영화관_식별문자, 상영방식_식별문자);
INSERT INTO THEATER VALUES('THEATER01', 100, 100, 'CINEMA01', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER02', 80, 80, 'CINEMA01', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER03', 60, 60, 'CINEMA01', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER04', 40, 40, 'CINEMA01', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER05', 20, 20, 'CINEMA01', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER06', 100, 100, 'CINEMA02', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER07', 80, 80, 'CINEMA02', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER08', 60, 60, 'CINEMA02', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER09', 40, 40, 'CINEMA02', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER10', 20, 20, 'CINEMA02', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER11', 100, 100, 'CINEMA03', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER12', 80, 80, 'CINEMA03', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER13', 60, 60, 'CINEMA03', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER14', 40, 40, 'CINEMA03', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER15', 20, 20, 'CINEMA03', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER16', 100, 100, 'CINEMA04', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER17', 80, 80, 'CINEMA04', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER18', 60, 60, 'CINEMA04', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER19', 40, 40, 'CINEMA04', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER20', 20, 20, 'CINEMA04', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER21', 100, 100, 'CINEMA05', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER22', 80, 80, 'CINEMA05', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER23', 60, 60, 'CINEMA05', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER24', 40, 40, 'CINEMA05', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER25', 20, 20, 'CINEMA05', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER26', 100, 100, 'CINEMA06', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER27', 80, 80, 'CINEMA06', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER28', 60, 60, 'CINEMA06', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER29', 40, 40, 'CINEMA06', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER30', 20, 20, 'CINEMA06', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER31', 100, 100, 'CINEMA07', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER32', 80, 80, 'CINEMA07', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER33', 60, 60, 'CINEMA07', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER34', 40, 40, 'CINEMA07', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER35', 20, 20, 'CINEMA07', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER36', 100, 100, 'CINEMA08', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER37', 80, 80, 'CINEMA08', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER38', 60, 60, 'CINEMA08', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER39', 40, 40, 'CINEMA08', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER40', 20, 20, 'CINEMA08', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER41', 100, 100, 'CINEMA09', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER42', 80, 80, 'CINEMA09', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER43', 60, 60, 'CINEMA09', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER44', 40, 40, 'CINEMA09', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER45', 20, 20, 'CINEMA09', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER46', 100, 100, 'CINEMA10', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER47', 80, 80, 'CINEMA10', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER48', 60, 60, 'CINEMA10', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER49', 40, 40, 'CINEMA10', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER50', 20, 20, 'CINEMA10', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER51', 100, 100, 'CINEMA11', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER52', 80, 80, 'CINEMA11', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER53', 60, 60, 'CINEMA11', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER54', 40, 40, 'CINEMA11', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER55', 20, 20, 'CINEMA11', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER56', 100, 100, 'CINEMA12', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER57', 80, 80, 'CINEMA12', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER58', 60, 60, 'CINEMA12', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER59', 40, 40, 'CINEMA12', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER60', 20, 20, 'CINEMA12', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER61', 100, 100, 'CINEMA13', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER62', 80, 80, 'CINEMA13', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER63', 60, 60, 'CINEMA13', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER64', 40, 40, 'CINEMA13', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER65', 20, 20, 'CINEMA13', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER66', 100, 100, 'CINEMA14', 'SCRWAY02');
INSERT INTO THEATER VALUES('THEATER67', 80, 80, 'CINEMA14', 'SCRWAY03');
INSERT INTO THEATER VALUES('THEATER68', 60, 60, 'CINEMA14', 'SCRWAY04');
INSERT INTO THEATER VALUES('THEATER69', 40, 40, 'CINEMA14', 'SCRWAY01');
INSERT INTO THEATER VALUES('THEATER70', 20, 20, 'CINEMA14', 'SCRWAY02');

-- 좌석 도메인
-- INSERT INTO SEAT VALUES(좌석문자, 상영관_식별문자, 좌석여부, 상영일정_식별문자);
-- 상영일정이 등록되면 생성된다. 지금 구현 불가능.

-- 관객방식 도메인
-- INSERT INTO MOVIEGOERS VALUES(식별문자, 관객방식, 할인율);
INSERT INTO MOVIEGOERS VALUES('GOERS01', '일반', 1.0);
INSERT INTO MOVIEGOERS VALUES('GOERS02', '청소년', 0.8);
INSERT INTO MOVIEGOERS VALUES('GOERS03', '경로', 0.6);
INSERT INTO MOVIEGOERS VALUES('GOERS04', '우대', 0.4);