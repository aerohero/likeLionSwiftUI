import Foundation

// 게임 보드를 표현하는 열거형
enum Piece: String {
    case empty = " "
    case x = "x"
    case o = "o"
}

//typealias Line = Array<Piece>
typealias Line = [Piece]
typealias Board = [Line]


// 게임 상태를 표현하는 프로토콜
protocol GameState {
    var currentPlayer: Piece { get }
//    var board: [[Piece]] { get }
    var board: Board { get }
    func isValidMove(row: Int, column: Int) -> Bool
}

// 게임 로직을 담당하는 클래스
class TicTacToe: GameState {
    var currentPlayer: Piece
    var board: [[Piece]]
    // [[Piece]] 는 타입별칭을 만들 수 있다.
        
    init() {
        board = [
            [.empty, .empty, .empty],
            [.empty, .empty, .empty],
            [.empty, .empty, .empty],
        ]
        currentPlayer = .x // x가 첫번째 플레이어
    }
    
    func isValidMove(row: Int, column: Int) -> Bool {
        // TODO: isValidMove 메서드 구현
        // 이동 범위 확인 (0-2 사이인지)
        guard row >= 0 && row < 3, column >= 0 && column < 3 else {
            return false
        }
        // 빈칸인지 확인
        return board[row][column] == .empty // 정만; 해당 칸이 비어 있을 때만 다음 단계로 넘어 갈 수 있도록 한다. true or false
    }
    
    func makeMove(row: Int, column: Int) -> Bool {
        // TODO: 플레이어 이동 메서드 구현
        // 위치 선정이 적합한지 판단
        guard isValidMove(row: row, column: column) else {
            return false
        }
        
        // 해당 위치에 현재 플레이어의 피스를 할당
        board[row][column] = currentPlayer
        
        // 위치 선정이 끝나면(함수 실행의 마지막), 플레이어 전환
        defer {
            currentPlayer = (currentPlayer == .x) ? .o : .x
        }
//        if currentPlayer == .x {
//            currentPlayer = .o
//        } else {
//            currentPlayer = .x
//        }
        
        // 정상적으로 할당이 끝나면 true
        return true
    }
    
    func checkWinner() -> Piece? {
        // 메서드 구현
        var lines = [Line]()
        
        // 정답지를 작성하는 방식
        // 가로
        lines.append([board[0][0],board[0][1],board[0][2]])
        lines.append([board[1][0],board[1][1],board[1][2]])
        lines.append([board[2][0],board[2][1],board[2][2]])
        // 세로
        lines.append([board[0][0],board[1][0],board[2][0]])
        lines.append([board[0][1],board[1][1],board[2][1]])
        lines.append([board[0][2],board[1][2],board[2][2]])
        // 대각선
        lines.append([board[0][0],board[1][1],board[2][2]])
        lines.append([board[2][0],board[1][1],board[0][2]])

        for line in lines {
            if line.allSatisfy({$0 == .x}) {
                return .x
            }
            if line.allSatisfy({$0 == .o}) {
                return .o
            }
            for line in lines {
                if line.contains(.empty) && (Set<Piece>(line).count < 3) {
                    return nil
                }
            }
        }
//
//        // 세로 확인
//        for row in 0...2 {
//            if board[row][0] != .empty && board[row][0] == board[row][1] && board[row][1] == board[row][2] {
//                return board[row][0]
//            }
//        }
//        
//        // 가로 확인
//        for column in 0...2 {
//            if board[0][column] != .empty && board[0][column] == board[1][column] && board[1][column] == board[2][column] {
//                return board[0][column]
//            }
//        }
//        
//        // 대각선 확인
//        
//        if board[0][0] != .empty && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
//            return board[0][0]
//        }
//        if board[0][2] != .empty && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
//            return board[0][2]
//        }
//        
//        for diagonal in 0...2 {
//            if board[diagonal][diagonal] != .empty && board[diagonal][diagonal] == board[diagonal][1] && board[diagonal][1] == board[diagonal][2] {
//                return board[diagonal][diagonal]
//            }
//        }
//        
//        // 무승부
//        let
        return .empty
    }
    
    func printBoard() {
        // 보드를 출력하는 코드
        print("\n")
        
        print("\n현재 플레이어: \(currentPlayer)")
            print("---------")
            for row in board {
                print("| \(row[0].rawValue) \(row[1].rawValue) \(row[2].rawValue) |")
            }
            print("---------")
//
//        for row in 0...2 {
//            for column in 0...2 {
//                print("\(board[row][column].rawValue)", terminator: "")
//                if column < 2 {
//                    print("|", terminator: "")
//                }
//                if row < 2 {
//                    print("-----------------")
//                }
//            }
//        }
        print("\n")
    }
}

var game = TicTacToe()

while true {
    game.printBoard()
    print("\n현재 플레이어: \(game.currentPlayer)")
    print("행(row number) 입력 (0-2) ('q' 입력시 종료):", terminator: "")
    
    let rowInput = readLine() ?? ""
    if rowInput == "q" { break }
    guard let row = Int(rowInput) else { continue }
    
    print("열(Column number) 입력 (0-2) ('q' 입력시 종료):", terminator: "")
    
    let colInput = readLine() ?? ""
    if colInput == "q" { break }
    guard let column = Int(colInput) else { continue }
    
    if !game.makeMove(row: row, column: column) {
        print("잘못된 위치입니다. 다시 시도해주세요.")
        continue
    }
    
    if let winner = game.checkWinner() {
        game.printBoard()
        if winner == .empty {
            print("무승부")
        } else {
            print("\(winner) 승리")
        }
        break
    }
}
