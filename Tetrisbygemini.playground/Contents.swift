import SwiftUI
import PlaygroundSupport
import Combine // Timer를 위해 필요

// MARK: - 데이터 모델

// 테트로미노 모양 정의 (I, O, T, S, Z, J, L)
enum TetrominoShape: CaseIterable {
    case i, o, t, s, z, j, l

    // 각 모양의 기본 블록 위치 (회전 중심 기준) 및 색상
    var points: [(row: Int, col: Int)] {
        switch self {
        case .i: return [(0, -1), (0, 0), (0, 1), (0, 2)] // 가로로 긴 막대
        case .o: return [(0, 0), (0, 1), (1, 0), (1, 1)] // 네모
        case .t: return [(-1, 0), (0, 0), (1, 0), (0, 1)] // T자
        case .s: return [(0, 0), (1, 0), (0, 1), (-1, 1)] // S자
        case .z: return [(-1, 0), (0, 0), (0, 1), (1, 1)] // Z자 (S 반대)
        case .j: return [(-1, 1), (0, 1), (1, 1), (1, 0)] // J자
        case .l: return [(-1, 0), (0, 0), (1, 0), (1, 1)] // L자 (J 반대)
        }
    }

    var color: Color {
        switch self {
        case .i: return .cyan
        case .o: return .yellow
        case .t: return .purple
        case .s: return .green
        case .z: return .red
        case .j: return .blue
        case .l: return .orange
        }
    }
}

// 현재 움직이는 테트로미노 조각
struct Piece {
    var shape: TetrominoShape
    var position: (row: Int, col: Int) // 중심 블록의 보드 위 위치 (행, 열)
    var rotation: Int = 0 // 0, 1, 2, 3 (시계 방향 90도)

    // 현재 회전 상태에 맞는 블록들의 절대 보드 좌표 반환
    func currentPoints() -> [(row: Int, col: Int)] {
        let basePoints = shape.points
        let rotatedPoints: [(row: Int, col: Int)]

        // 회전 적용 (간단한 2D 회전 공식)
        switch rotation % 4 {
        case 0: // 0도
            rotatedPoints = basePoints
        case 1: // 90도
            rotatedPoints = basePoints.map { (-$0.col, $0.row) }
        case 2: // 180도
            rotatedPoints = basePoints.map { (-$0.row, -$0.col) }
        case 3: // 270도
            rotatedPoints = basePoints.map { ($0.col, -$0.row) }
        default: // Should not happen
             rotatedPoints = basePoints
        }

        // 보드 상의 절대 위치로 변환
        return rotatedPoints.map { (position.row + $0.row, position.col + $0.col) }
    }

    // 시계방향 회전된 Piece 반환 (실제 적용 전 테스트용)
    func rotated() -> Piece {
        var newPiece = self
        newPiece.rotation = (rotation + 1) % 4
        return newPiece
    }
}

// MARK: - 게임 로직 (ViewModel)

class TetrisGame: ObservableObject {
    // 게임 보드 크기
    static let boardWidth = 10
    static let boardHeight = 20

    // 게임 보드 상태 (비어있으면 nil, 채워져 있으면 색상)
    @Published var board: [[Color?]] = Array(
        repeating: Array(repeating: nil, count: boardWidth),
        count: boardHeight
    )

    // 현재 움직이는 조각
    @Published var currentPiece: Piece? = nil

    // 게임 점수
    @Published var score: Int = 0

    // 게임 오버 상태
    @Published var isGameOver: Bool = false

    // 게임 루프 타이머
    private var timer: AnyCancellable?
    private var speed: Double = 0.8 // 초당 떨어지는 속도 (작을수록 빠름)

    init() {
        startGame()
    }

    // 게임 시작
    func startGame() {
        // 보드 초기화
        board = Array(
            repeating: Array(repeating: nil, count: Self.boardWidth),
            count: Self.boardHeight
        )
        score = 0
        isGameOver = false
        speed = 0.8
        spawnNewPiece()
        startTimer()
    }

    // 게임 타이머 시작
    func startTimer() {
        timer?.cancel() // 기존 타이머 취소
        timer = Timer.publish(every: speed, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.gameLoop()
            }
    }

    // 게임 루프 (타이머마다 실행)
    private func gameLoop() {
        guard !isGameOver else { return }

        // 현재 조각을 아래로 한 칸 이동 시도
        if let piece = currentPiece {
            let nextPosition = (row: piece.position.row + 1, col: piece.position.col)
            if isValidPosition(piece: piece, position: nextPosition) {
                currentPiece?.position = nextPosition
            } else {
                // 이동 불가 시 조각 고정 및 다음 조각 처리
                placePiece()
                clearLines()
                spawnNewPiece()

                // 새 조각 생성 후 바로 충돌하면 게임 오버
                if let newPiece = currentPiece, !isValidPosition(piece: newPiece, position: newPiece.position) {
                    gameOver()
                }
            }
        }
    }

    // 새 테트로미노 생성
    private func spawnNewPiece() {
        guard !isGameOver else { return }
        let randomShape = TetrominoShape.allCases.randomElement()!
        // 시작 위치: 상단 중앙
        let startPosition = (row: 0, col: Self.boardWidth / 2 - 1)
        currentPiece = Piece(shape: randomShape, position: startPosition)
    }

    // 조각을 보드에 고정시키기
    private func placePiece() {
        guard let piece = currentPiece else { return }

        piece.currentPoints().forEach { point in
            // 보드 범위 내에 있는지 확인 후 고정
            if point.row >= 0 && point.row < Self.boardHeight && point.col >= 0 && point.col < Self.boardWidth {
                board[point.row][point.col] = piece.shape.color
            }
        }
        currentPiece = nil // 현재 조각 비우기
    }

    // 완성된 라인 제거 및 점수 처리
    private func clearLines() {
        var linesCleared = 0
        var newBoard = board

        for r in (0..<Self.boardHeight).reversed() { // 아래서부터 검사
            if !newBoard[r].contains(nil) { // 라인이 꽉 찼다면
                newBoard.remove(at: r) // 해당 라인 제거
                // 맨 위에 빈 라인 추가
                newBoard.insert(Array(repeating: nil, count: Self.boardWidth), at: 0)
                linesCleared += 1
            }
        }

        if linesCleared > 0 {
            board = newBoard // 변경된 보드로 업데이트
            // 점수 계산 (간단하게 라인당 10점, 추가 점수 가능)
            score += linesCleared * 10 * linesCleared // 한 번에 여러 줄 지우면 점수 증가
            // 속도 증가 (선택 사항)
             // speed = max(0.1, speed * 0.95)
             // startTimer() // 타이머 재시작 (변경된 속도 적용)
        }
    }

    // 특정 위치가 유효한지 검사 (범위 내, 다른 블록과 겹치지 않음)
    private func isValidPosition(piece: Piece, position: (row: Int, col: Int), rotation: Int? = nil) -> Bool {
        let checkPiece = Piece(shape: piece.shape, position: position, rotation: rotation ?? piece.rotation)

        for point in checkPiece.currentPoints() {
            // 1. 보드 좌우 경계 체크
            if point.col < 0 || point.col >= Self.boardWidth {
                return false
            }
            // 2. 보드 하단 경계 체크 (상단은 스폰 시 체크되므로 여기선 하단만)
            if point.row >= Self.boardHeight {
                return false
            }
            // 3. 보드 상단 경계 체크 (음수 행은 괜찮음 - 아직 보드 위에 있는 상태)
            if point.row < 0 {
                continue // 아직 보드 위에 있는 블록은 충돌 검사 안함
            }
            // 4. 다른 고정된 블록과 충돌 체크
            if board[point.row][point.col] != nil {
                return false
            }
        }
        return true
    }

    // --- 사용자 입력 처리 메서드 ---

    // 왼쪽 이동
    func moveLeft() {
        guard let piece = currentPiece, !isGameOver else { return }
        let nextPosition = (row: piece.position.row, col: piece.position.col - 1)
        if isValidPosition(piece: piece, position: nextPosition) {
            currentPiece?.position = nextPosition
        }
    }

    // 오른쪽 이동
    func moveRight() {
        guard let piece = currentPiece, !isGameOver else { return }
        let nextPosition = (row: piece.position.row, col: piece.position.col + 1)
        if isValidPosition(piece: piece, position: nextPosition) {
            currentPiece?.position = nextPosition
        }
    }

    // 아래로 이동 (Soft Drop)
    func moveDown() {
        guard !isGameOver else { return }
        gameLoop() // 다음 게임 틱을 즉시 실행하여 아래로 이동 시도
        // 타이머 재설정 (선택적: 더 부드러운 이동을 위해)
        // startTimer()
    }

    // 회전
    func rotate() {
        guard let piece = currentPiece, !isGameOver else { return }
        let nextRotation = (piece.rotation + 1) % 4
        // 단순 회전 시도
        if isValidPosition(piece: piece, position: piece.position, rotation: nextRotation) {
            currentPiece?.rotation = nextRotation
        }
        // TODO: Wall Kick 로직 추가 (회전 시 벽이나 다른 블록에 막힐 경우 옆으로 살짝 이동시키는 고급 기능)
    }

    // 맨 아래로 즉시 이동 (Hard Drop)
    func hardDrop() {
         guard var piece = currentPiece, !isGameOver else { return }
         var currentPosition = piece.position
         while isValidPosition(piece: piece, position: (row: currentPosition.row + 1, col: currentPosition.col)) {
             currentPosition.row += 1
         }
         // 최종 위치로 이동 후 즉시 고정 처리
         currentPiece?.position = currentPosition
         placePiece()
         clearLines()
         spawnNewPiece()
         if let newPiece = currentPiece, !isValidPosition(piece: newPiece, position: newPiece.position) {
             gameOver()
         }
        // 타이머 즉시 재시작 불필요 (placePiece 후 spawn이 처리)
    }

    // 게임 오버 처리
    private func gameOver() {
        isGameOver = true
        timer?.cancel() // 타이머 중지
        currentPiece = nil // 현재 조각 제거
        print("Game Over! Final Score: \(score)")
    }
}

// MARK: - SwiftUI 뷰

// 게임 보드 그리기 뷰
struct BoardView: View {
    let board: [[Color?]]
    let currentPiece: Piece?
    let blockSize: CGFloat = 20 // 각 블록의 크기

    var body: some View {
        ZStack(alignment: .topLeading) {
            // 배경 그리드 (고정된 블록들)
            VStack(spacing: 1) {
                ForEach(0..<board.count, id: \.self) { row in
                    HStack(spacing: 1) {
                        ForEach(0..<board[row].count, id: \.self) { col in
                            Rectangle()
                                .fill(board[row][col] ?? Color.black.opacity(0.8)) // 비어있으면 어두운 색
                                .frame(width: blockSize, height: blockSize)
                        }
                    }
                }
            }
            .border(Color.gray) // 보드 테두리

            // 현재 움직이는 조각 그리기
            if let piece = currentPiece {
                ForEach(0..<piece.currentPoints().count, id: \.self) { index in
                    let point = piece.currentPoints()[index]
                    // 보드 안에 있는 블록만 그리기
                    if point.row >= 0 && point.row < board.count && point.col >= 0 && point.col < (board.first?.count ?? 0) {
                         Rectangle()
                            .fill(piece.shape.color)
                            .frame(width: blockSize, height: blockSize)
                            .overlay(Rectangle().stroke(Color.white.opacity(0.5), lineWidth: 1)) // 블록 테두리
                            .offset(x: CGFloat(point.col) * (blockSize + 1), // +1 for spacing
                                    y: CGFloat(point.row) * (blockSize + 1))
                    }
                }
            }
        }
        .padding(5) // ZStack 주변에 약간의 패딩
    }
}

// 메인 컨텐츠 뷰
struct ContentView: View {
    @StateObject private var game = TetrisGame()

    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI Tetris")
                .font(.largeTitle)

            Text("Score: \(game.score)")
                .font(.title2)

            BoardView(board: game.board, currentPiece: game.currentPiece)

            if game.isGameOver {
                Text("GAME OVER")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)

                Button("Restart Game") {
                    game.startGame()
                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                // 게임 컨트롤 버튼
                HStack(spacing: 10) {
                    Button { game.moveLeft() } label: { Image(systemName: "arrow.left").font(.title) }
                    Button { game.rotate() } label: { Image(systemName: "arrow.clockwise").font(.title) }
                    Button { game.moveRight() } label: { Image(systemName: "arrow.right").font(.title) }
                }
                HStack(spacing: 10) {
                     Button { game.moveDown() } label: { Image(systemName: "arrow.down").font(.title) }
                     Button("DROP") { game.hardDrop() }.font(.headline).padding(.horizontal)
                }
                .padding(.top, 5)
            }
            Spacer() // 컨트롤을 아래쪽에 배치
        }
        .padding()
        .frame(width: 350, height: 650) // 플레이그라운드에서 보기 좋은 크기
        .background(Color.gray.opacity(0.2))
    }
}

// MARK: - Playground 실행 설정

// ContentView를 라이브 뷰로 설정
PlaygroundPage.current.setLiveView(ContentView())
