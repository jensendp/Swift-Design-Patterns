protocol TranslationStrategy {
    func translate(string: String)
}

class SpanishTranslation: TranslationStrategy {
    func translate(string: String) {
        print("Spanish - \(string)")
    }
}

class GermanTranslation: TranslationStrategy {
    func translate(string: String) {
        print("German - \(string)")
    }
}

class Translator {
    private var strategy: TranslationStrategy
    
    init(strategy: TranslationStrategy) {
        self.strategy = strategy
    }
    
    func setStrategy(strategy: TranslationStrategy) {
        self.strategy = strategy
    }
    
    func translate(string: String) {
        strategy.translate(string: string)
    }
}

let german = GermanTranslation()
let spanish = SpanishTranslation()

let translator = Translator(strategy: german)

translator.translate(string: "Hello there")
translator.setStrategy(strategy: spanish)
translator.translate(string: "How are you?")