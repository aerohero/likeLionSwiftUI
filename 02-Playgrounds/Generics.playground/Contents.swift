
class RecentList {
    var slot1: String?
    var slot2: String?
    var slot3: String?
    var slot4: String?
    var slot5: String?
    
    func add(recent: String) {
        // 각 슬롯을 1칸씩 아래로
        slot5 = slot4
        slot4 = slot3
        
    }
}
