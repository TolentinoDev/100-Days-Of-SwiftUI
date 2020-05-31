protocol Strokeable {
    var fluffiness: Int { get }
}

protocol Buildable {
    var numberOfBricks: Int { get set }
    var materials: [String] { get set }
}

protocol MakesDiagnoses {
    func evaluate(patient: String) -> String
}
protocol PrescribesMedicine {
    func prescribe(drug: String)
}
protocol Doctor: MakesDiagnoses, PrescribesMedicine { }



protocol Buyable {
    var cost: Int {get }
}
protocol Sellable {
    func findBuyers() -> [String]
}
protocol FineArt: Buyable, Sellable { }

//Extensions
extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

extension Int {
    func times(_ action: () -> Void) {
        for _ in 0..<self {
            action()
        }
    }
}

extension Int {
    var isAnswerToLifeUniverseAndEverything: Bool {
        let target = 42
        if self == target{
            return true
        }
        else{return false}
    }
}


extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}

protocol Chef {
    func getRecipes() -> [String]
}
extension Chef {
    func getRecipes() -> [String] {
        return ["Macaroni Cheese"]
    }
}


protocol Club {
    func organizeMeeting(day: String)
}
extension Club {
    func organizeMeeting(day: String) {
        print("We're going to meet on \(day).")
    }
}


protocol SuperHeroMovie {
    func writeScript() -> String
}
extension SuperHeroMovie {
    func makeScript() -> String {
        return """
        Lots of special effects,
        some half-baked jokes,
        and a hint of another
        sequel at the end.
        """
    }
}
