//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Level 1 문자열 내 p와 y의 개수
//대문자와 소문자가 섞여있는 문자열 s가 주어집니다. s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 return 하는 solution를 완성하세요. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴합니다. 단, 개수를 비교할 때 대문자와 소문자는 구별하지 않습니다.
//
//예를들어 s가 pPoooyY면 true를 return하고 Pyy라면 false를 return합니다.
// Test Case
//pPoooyY    true
//Pyy    false


func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    let string = s.uppercased()
    if (string.components(separatedBy: "P").count == string.components(separatedBy: "Y").count){
        ans = true
        return ans
    } else {
        return ans
    }
    
}

solution("pPoooyY") // True
solution("asdfsdf") // True
solution("Pyy") // False



// Level 1 문자열 내림차순으로 배치하기
//문자열 s에 나타나는 문자를 큰것부터 작은 순으로 정렬해 새로운 문자열을 리턴하는 함수, solution을 완성해주세요.
//s는 영문 대소문자로만 구성되어 있으며, 대문자는 소문자보다 작은 것으로 간주합니다.
// Test case
// Zbcdefg    gfedcbZ

func lowerString(_ s:String) -> String {
    let ans = String(s.sorted() {$0 > $1})
    return ans
}

lowerString("Zbcdefg")

// Level 1 자연수 뒤집어 배열로 만들기
//자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.
//
//제한 조건
//n은 10,000,000,000이하인 자연수입니다.
// Test case
//    12345    [5,4,3,2,1]

func intSort(_ n:Int64) -> [Int] {
    return [1,2,3,4,5]
}

intSort(54321)

/**
 추석 트래픽
 
 이번 추석에도 시스템 장애가 없는 명절을 보내고 싶은 어피치는 서버를 증설해야 할지 고민이다. 장애 대비용 서버 증설 여부를 결정하기 위해 작년 추석 기간인 9월 15일 로그 데이터를 분석한 후 초당 최대 처리량을 계산해보기로 했다. 초당 최대 처리량은 요청의 응답 완료 여부에 관계없이 임의 시간부터 1초(=1,000밀리초)간 처리하는 요청의 최대 개수를 의미한다.
 
 입력 형식
 
 solution 함수에 전달되는 lines 배열은 N(1 ≦ N ≦ 2,000)개의 로그 문자열로 되어 있으며, 각 로그 문자열마다 요청에 대한 응답완료시간 S와 처리시간 T가 공백으로 구분되어 있다.
 응답완료시간 S는 작년 추석인 2016년 9월 15일만 포함하여 고정 길이 2016-09-15 hh:mm:ss.sss 형식으로 되어 있다.
 처리시간 T는 0.1s, 0.312s, 2s 와 같이 최대 소수점 셋째 자리까지 기록하며 뒤에는 초 단위를 의미하는 s로 끝난다.
 예를 들어, 로그 문자열 2016-09-15 03:10:33.020 0.011s은 2016년 9월 15일 오전 3시 10분 **33.010초**부터 2016년 9월 15일 오전 3시 10분 **33.020초**까지 **0.011초** 동안 처리된 요청을 의미한다. (처리시간은 시작시간과 끝시간을 포함)
 서버에는 타임아웃이 3초로 적용되어 있기 때문에 처리시간은 0.001 ≦ T ≦ 3.000이다.
 lines 배열은 응답완료시간 S를 기준으로 오름차순 정렬되어 있다.
 출력 형식
 
 solution 함수에서는 로그 데이터 lines 배열에 대해 초당 최대 처리량을 리턴한다.
 입출력 예제
 
 예제1
 
 입력: [
 2016-09-15 01:00:04.001 2.0s,
 2016-09-15 01:00:07.000 2s
 ]
 
 출력: 1
 
 예제2
 
 입력: [
 2016-09-15 01:00:04.002 2.0s,
 2016-09-15 01:00:07.000 2s
 ]
 
 출력: 2
 
 설명: 처리시간은 시작시간과 끝시간을 포함하므로
 첫 번째 로그는 01:00:02.003 ~ 01:00:04.002에서 2초 동안 처리되었으며,
 두 번째 로그는 01:00:05.001 ~ 01:00:07.000에서 2초 동안 처리된다.
 따라서, 첫 번째 로그가 끝나는 시점과 두 번째 로그가 시작하는 시점의 구간인 01:00:04.002 ~ 01:00:05.001 1초 동안 최대 2개가 된다.
 
 예제3
 
 입력: [
 2016-09-15 20:59:57.421 0.351s,
 2016-09-15 20:59:58.233 1.181s,
 2016-09-15 20:59:58.299 0.8s,
 2016-09-15 20:59:58.688 1.041s,
 2016-09-15 20:59:59.591 1.412s,
 2016-09-15 21:00:00.464 1.466s,
 2016-09-15 21:00:00.741 1.581s,
 2016-09-15 21:00:00.748 2.31s,
 2016-09-15 21:00:00.966 0.381s,
 2016-09-15 21:00:02.066 2.62s
 ]
 
 출력: 7

 **/


func traffic(_ lines:[String]) -> Int {
    return 0
}





/**
 뉴스 클러스터링
 
 여러 언론사에서 쏟아지는 뉴스, 특히 속보성 뉴스를 보면 비슷비슷한 제목의 기사가 많아 정작 필요한 기사를 찾기가 어렵다. Daum 뉴스의 개발 업무를 맡게 된 신입사원 튜브는 사용자들이 편리하게 다양한 뉴스를 찾아볼 수 있도록 문제점을 개선하는 업무를 맡게 되었다.
 
 개발의 방향을 잡기 위해 튜브는 우선 최근 화제가 되고 있는 카카오 신입 개발자 공채 관련 기사를 검색해보았다.
 
 카카오 첫 공채..'블라인드' 방식 채용
 카카오, 합병 후 첫 공채.. 블라인드 전형으로 개발자 채용
 카카오, 블라인드 전형으로 신입 개발자 공채
 카카오 공채, 신입 개발자 코딩 능력만 본다
 카카오, 신입 공채.. 코딩 실력만 본다
 카카오 코딩 능력만으로 2018 신입 개발자 뽑는다
 기사의 제목을 기준으로 블라인드 전형에 주목하는 기사와 코딩 테스트에 주목하는 기사로 나뉘는 걸 발견했다. 튜브는 이들을 각각 묶어서 보여주면 카카오 공채 관련 기사를 찾아보는 사용자에게 유용할 듯싶었다.
 
 유사한 기사를 묶는 기준을 정하기 위해서 논문과 자료를 조사하던 튜브는 자카드 유사도라는 방법을 찾아냈다.
 
 자카드 유사도는 집합 간의 유사도를 검사하는 여러 방법 중의 하나로 알려져 있다. 두 집합 A, B 사이의 자카드 유사도 J(A, B)는 두 집합의 교집합 크기를 두 집합의 합집합 크기로 나눈 값으로 정의된다.
 
 예를 들어 집합 A = {1, 2, 3}, 집합 B = {2, 3, 4}라고 할 때, 교집합 A ∩ B = {2, 3}, 합집합 A ∪ B = {1, 2, 3, 4}이 되므로, 집합 A, B 사이의 자카드 유사도 J(A, B) = 2/4 = 0.5가 된다. 집합 A와 집합 B가 모두 공집합일 경우에는 나눗셈이 정의되지 않으니 따로 J(A, B) = 1로 정의한다.
 
 자카드 유사도는 원소의 중복을 허용하는 다중집합에 대해서 확장할 수 있다. 다중집합 A는 원소 1을 3개 가지고 있고, 다중집합 B는 원소 1을 5개 가지고 있다고 하자. 이 다중집합의 교집합 A ∩ B는 원소 1을 min(3, 5)인 3개, 합집합 A ∪ B는 원소 1을 max(3, 5)인 5개 가지게 된다. 다중집합 A = {1, 1, 2, 2, 3}, 다중집합 B = {1, 2, 2, 4, 5}라고 하면, 교집합 A ∩ B = {1, 2, 2}, 합집합 A ∪ B = {1, 1, 2, 2, 3, 4, 5}가 되므로, 자카드 유사도 J(A, B) = 3/7, 약 0.42가 된다.
 
 이를 이용하여 문자열 사이의 유사도를 계산하는데 이용할 수 있다. 문자열 FRANCE와 FRENCH가 주어졌을 때, 이를 두 글자씩 끊어서 다중집합을 만들 수 있다. 각각 {FR, RA, AN, NC, CE}, {FR, RE, EN, NC, CH}가 되며, 교집합은 {FR, NC}, 합집합은 {FR, RA, AN, NC, CE, RE, EN, CH}가 되므로, 두 문자열 사이의 자카드 유사도 J("FRANCE", "FRENCH") = 2/8 = 0.25가 된다.
 
 입력 형식
 
 입력으로는 str1과 str2의 두 문자열이 들어온다. 각 문자열의 길이는 2 이상, 1,000 이하이다.
 입력으로 들어온 문자열은 두 글자씩 끊어서 다중집합의 원소로 만든다. 이때 영문자로 된 글자 쌍만 유효하고, 기타 공백이나 숫자, 특수 문자가 들어있는 경우는 그 글자 쌍을 버린다. 예를 들어 ab+가 입력으로 들어오면, ab만 다중집합의 원소로 삼고, b+는 버린다.
 다중집합 원소 사이를 비교할 때, 대문자와 소문자의 차이는 무시한다. AB와 Ab, ab는 같은 원소로 취급한다.
 출력 형식
 
 입력으로 들어온 두 문자열의 자카드 유사도를 출력한다. 유사도 값은 0에서 1 사이의 실수이므로, 이를 다루기 쉽도록 65536을 곱한 후에 소수점 아래를 버리고 정수부만 출력한다.
 
 예제 입출력
 
 str1    str2    answer
 FRANCE    french    16384
 handshake    shake hands    65536
 aa1+aa2    AAAA12    43690
 E=M*C^2    e=m*c^2
 
 필요한 것 ? String 2글자씩 나누기, 배열로 저장해서 크기만큼 반환하는거
 유사도 체크 후  * 65536 Int 반환
 **/






//func news(_ str1:String, _ str2:String) -> Int {
//    var arr: [String] = []
////    arr.append(str1)
//    // 한글자씩 쪼개버릴때..?
//    for i in str1.characters.indices {
//        arr.append(String(str1[i]))
//    }
////    str1.indices
//    print(arr)
//    return 0
//}

//news("FRANCE", "french")

/**
 셔틀버스
 
 카카오에서는 무료 셔틀버스를 운행하기 때문에 판교역에서 편하게 사무실로 올 수 있다. 카카오의 직원은 서로를 '크루'라고 부르는데, 아침마다 많은 크루들이 이 셔틀을 이용하여 출근한다.
 
 이 문제에서는 편의를 위해 셔틀은 다음과 같은 규칙으로 운행한다고 가정하자.
 
 셔틀은 09:00부터 총 n회 t분 간격으로 역에 도착하며, 하나의 셔틀에는 최대 m명의 승객이 탈 수 있다.
 셔틀은 도착했을 때 도착한 순간에 대기열에 선 크루까지 포함해서 대기 순서대로 태우고 바로 출발한다. 예를 들어 09:00에 도착한 셔틀은 자리가 있다면 09:00에 줄을 선 크루도 탈 수 있다.
 일찍 나와서 셔틀을 기다리는 것이 귀찮았던 콘은, 일주일간의 집요한 관찰 끝에 어떤 크루가 몇 시에 셔틀 대기열에 도착하는지 알아냈다. 콘이 셔틀을 타고 사무실로 갈 수 있는 도착 시각 중 제일 늦은 시각을 구하여라.
 
 단, 콘은 게으르기 때문에 같은 시각에 도착한 크루 중 대기열에서 제일 뒤에 선다. 또한, 모든 크루는 잠을 자야 하므로 23:59에 집에 돌아간다. 따라서 어떤 크루도 다음날 셔틀을 타는 일은 없다.
 
 입력 형식
 
 셔틀 운행 횟수 n, 셔틀 운행 간격 t, 한 셔틀에 탈 수 있는 최대 크루 수 m, 크루가 대기열에 도착하는 시각을 모은 배열 timetable이 입력으로 주어진다.
 
 0 ＜ n ≦ 10
 0 ＜ t ≦ 60
 0 ＜ m ≦ 45
 timetable은 최소 길이 1이고 최대 길이 2000인 배열로, 하루 동안 크루가 대기열에 도착하는 시각이 HH:MM 형식으로 이루어져 있다.
 크루의 도착 시각 HH:MM은 00:01에서 23:59 사이이다.
 출력 형식
 
 콘이 무사히 셔틀을 타고 사무실로 갈 수 있는 제일 늦은 도착 시각을 출력한다. 도착 시각은 HH:MM 형식이며, 00:00에서 23:59 사이의 값이 될 수 있다.
 
 입출력 예제
 
 n    t    m    timetable    answer
 1    1    5    [08:00, 08:01, 08:02, 08:03]    09:00
 2    10    2    [09:10, 09:09, 08:00]    09:09
 2    1    2    [09:00, 09:00, 09:00, 09:00]    08:59
 1    1    5    [00:01, 00:01, 00:01, 00:01, 00:01]    00:00
 1    1    1    [23:59]    09:00
 10    60    45    [23:59,23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59, 23:59]

 **/



func shuttle(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    return ""
}




/**
 카카오 코딩테스트 1번문제
 오픈채팅방
 카카오톡 오픈채팅방에서는 친구가 아닌 사람들과 대화를 할 수 있는데, 본래 닉네임이 아닌 가상의 닉네임을 사용하여 채팅방에 들어갈 수 있다.
 
 신입사원인 김크루는 카카오톡 오픈 채팅방을 개설한 사람을 위해, 다양한 사람들이 들어오고, 나가는 것을 지켜볼 수 있는 관리자창을 만들기로 했다. 채팅방에 누군가 들어오면 다음 메시지가 출력된다.
 
 [닉네임]님이 들어왔습니다.
 
 채팅방에서 누군가 나가면 다음 메시지가 출력된다.
 
 [닉네임]님이 나갔습니다.
 
 채팅방에서 닉네임을 변경하는 방법은 다음과 같이 두 가지이다.
 
 채팅방을 나간 후, 새로운 닉네임으로 다시 들어간다.
 채팅방에서 닉네임을 변경한다.
 닉네임을 변경할 때는 기존에 채팅방에 출력되어 있던 메시지의 닉네임도 전부 변경된다.
 
 예를 들어, 채팅방에 Muzi와 Prodo라는 닉네임을 사용하는 사람이 순서대로 들어오면 채팅방에는 다음과 같이 메시지가 출력된다.
 
 Muzi님이 들어왔습니다.
 Prodo님이 들어왔습니다.
 
 채팅방에 있던 사람이 나가면 채팅방에는 다음과 같이 메시지가 남는다.
 
 Muzi님이 들어왔습니다.
 Prodo님이 들어왔습니다.
 Muzi님이 나갔습니다.
 
 Muzi가 나간후 다시 들어올 때, Prodo 라는 닉네임으로 들어올 경우 기존에 채팅방에 남아있던 Muzi도 Prodo로 다음과 같이 변경된다.
 
 Prodo님이 들어왔습니다.
 Prodo님이 들어왔습니다.
 Prodo님이 나갔습니다.
 Prodo님이 들어왔습니다.
 
 채팅방은 중복 닉네임을 허용하기 때문에, 현재 채팅방에는 Prodo라는 닉네임을 사용하는 사람이 두 명이 있다. 이제, 채팅방에 두 번째로 들어왔던 Prodo가 Ryan으로 닉네임을 변경하면 채팅방 메시지는 다음과 같이 변경된다.
 
 Prodo님이 들어왔습니다.
 Ryan님이 들어왔습니다.
 Prodo님이 나갔습니다.
 Prodo님이 들어왔습니다.
 
 채팅방에 들어오고 나가거나, 닉네임을 변경한 기록이 담긴 문자열 배열 record가 매개변수로 주어질 때, 모든 기록이 처리된 후, 최종적으로 방을 개설한 사람이 보게 되는 메시지를 문자열 배열 형태로 return 하도록 solution 함수를 완성하라.
 
 제한사항
 record는 다음과 같은 문자열이 담긴 배열이며, 길이는 1 이상 100,000 이하이다.
 다음은 record에 담긴 문자열에 대한 설명이다.
 모든 유저는 [유저 아이디]로 구분한다.
 [유저 아이디] 사용자가 [닉네임]으로 채팅방에 입장 - Enter [유저 아이디] [닉네임] (ex. Enter uid1234 Muzi)
 [유저 아이디] 사용자가 채팅방에서 퇴장 - Leave [유저 아이디] (ex. Leave uid1234)
 [유저 아이디] 사용자가 닉네임을 [닉네임]으로 변경 - Change [유저 아이디] [닉네임] (ex. Change uid1234 Muzi)
 첫 단어는 Enter, Leave, Change 중 하나이다.
 각 단어는 공백으로 구분되어 있으며, 알파벳 대문자, 소문자, 숫자로만 이루어져있다.
 유저 아이디와 닉네임은 알파벳 대문자, 소문자를 구별한다.
 유저 아이디와 닉네임의 길이는 1 이상 10 이하이다.
 채팅방에서 나간 유저가 닉네임을 변경하는 등 잘못 된 입력은 주어지지 않는다.
 
 입출력 예
 record    result
 [Enter uid1234 Muzi, Enter uid4567 Prodo,Leave uid1234,Enter uid1234 Prodo,Change uid4567 Ryan]    [Prodo님이 들어왔습니다., Ryan님이 들어왔습니다., Prodo님이 나갔습니다., Prodo님이 들어왔습니다.]
 
 
 **/

func openChat(_ record:[String]) -> [String] {
    
    let enter = "Enter"
    let change = "Change"
    let leave = "Leave"
    var result = ""
    var ans: [String] = []
    var idStack: [String] = []
    var uid = ""
    record.count
    for i in 0..<record.count {
        var tmp = record[i].split(separator: " ")
        var action = tmp[0]
        uid = "\(tmp[1])"
        
//        print(action)
        
//        print(nickName)
//        print(tmp)
        
        if action == enter {
            result = "\(tmp[2])님이 들어왔습니다."
            print(result)
            idStack.append(uid)
            print(idStack)
            ans.append(result)
            
        }
    }
    
    print(ans)
    return ans
}

openChat( ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"] )




/**
 2번 문제
 슈퍼 게임 개발자 오렐리는 큰 고민에 빠졌다. 그녀가 만든 프랜즈 오천성이 대성공을 거뒀지만, 요즘 신규 사용자의 수가 급감한 것이다. 원인은 신규 사용자와 기존 사용자 사이에 스테이지 차이가 너무 큰 것이 문제였다.
 
 이 문제를 어떻게 할까 고민 한 그녀는 동적으로 게임 시간을 늘려서 난이도를 조절하기로 했다. 역시 슈퍼 개발자라 대부분의 로직은 쉽게 구현했지만, 실패율을 구하는 부분에서 위기에 빠지고 말았다. 오렐리를 위해 실패율을 구하는 코드를 완성하라.
 
 실패율은 다음과 같이 정의한다.
 스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수 / 스테이지에 도달한 플레이어 수
 전체 스테이지의 개수 N, 게임을 이용하는 사용자가 현재 멈춰있는 스테이지의 번호가 담긴 배열 stages가 매개변수로 주어질 때, 실패율이 높은 스테이지부터 내림차순으로 스테이지의 번호가 담겨있는 배열을 return 하도록 solution 함수를 완성하라.
 
 제한사항
 스테이지의 개수 N은 1 이상 500 이하의 자연수이다.
 stages의 길이는 1 이상 200,000 이하이다.
 stages에는 1 이상 N + 1 이하의 자연수가 담겨있다.
 각 자연수는 사용자가 현재 도전 중인 스테이지의 번호를 나타낸다.
 단, N + 1 은 마지막 스테이지(N 번째 스테이지) 까지 클리어 한 사용자를 나타낸다.
 만약 실패율이 같은 스테이지가 있다면 작은 번호의 스테이지가 먼저 오도록 하면 된다.
 스테이지에 도달한 유저가 없는 경우 해당 스테이지의 실패율은 0 으로 정의한다.
 입출력 예
 N    stages    result
 5    [2, 1, 2, 6, 2, 4, 3, 3]    [3,4,2,1,5]
 4    [4,4,4,4,4]    [4,1,2,3]
 입출력 예 설명
 입출력 예 #1
 1번 스테이지에는 총 8명의 사용자가 도전했으며, 이 중 1명의 사용자가 아직 클리어하지 못했다. 따라서 1번 스테이지의 실패율은 다음과 같다.
 
 1 번 스테이지 실패율 : 1/8
 2번 스테이지에는 총 7명의 사용자가 도전했으며, 이 중 3명의 사용자가 아직 클리어하지 못했다. 따라서 2번 스테이지의 실패율은 다음과 같다.
 
 2 번 스테이지 실패율 : 3/7
 마찬가지로 나머지 스테이지의 실패율은 다음과 같다.
 
 3 번 스테이지 실패율 : 2/4
 4번 스테이지 실패율 : 1/2
 5번 스테이지 실패율 : 0/1
 각 스테이지의 번호를 실패율의 내림차순으로 정렬하면 다음과 같다.
 
 [3,4,2,1,5]
 입출력 예 #2
 
 모든 사용자가 마지막 스테이지에 있으므로 4번 스테이지의 실패율은 1이며 나머지 스테이지의 실패율은 0이다.
 
 [4,1,2,3]
 **/
func orellyGame(_ N:Int, _ stages:[Int]) -> [Int] {
//    var user = stages.count
//    for i in 1...stages.count - 1 {
//        var per: Int = 0
//        if stages[i] == i {
//            per = user / i
//            print(per)
//        }
//    }
//    print(user)
    return []
}

orellyGame(5, [2,1,2,6,2,4,3,3])




// 4번 문제
func foodTV(_ food_times:[Int], _ k:Int64) -> Int {
    
    
    return 0
}


foodTV([3, 1, 2], 5)

//[[100,ryan,music,2],[200,apeach,math,2],[300,tube,computer,3],[400,con,computer,4],[500,muzi,music,3],[600,apeach,music,2]]


func candidateKey(_ relation:[[String]]) -> Int {
    var sn: [String] = []
    print("3번 문제")
    print(relation[0].first!)
    for i in 0..<relation.count {
        let tmp = "\(relation[i].first!)"
        print("tmp : \(tmp)")
        sn.append(relation[i].first!)
        print(sn)
       
        
    }
    
    return 0
}


candidateKey([["100","ryan","music","2"],["100","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]])


