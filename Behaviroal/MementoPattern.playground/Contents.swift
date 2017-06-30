protocol Memento {
    func getSavedState() -> String
}

class EditorMemento: Memento {
    private let editorState: String
    
    init(editorState: String) {
        self.editorState = editorState
    }
    
    func getSavedState() -> String {
        return editorState
    }
}

class Editor {
    private var contents: String = ""
    private var states: [EditorMemento] = []
    
    func setContents(contents: String) {
        self.contents = contents
    }
    
    func save() {
        states.append(EditorMemento(editorState: contents))
    }
    
    func undo() {
        let lastState = states.removeLast()
        contents = lastState.getSavedState()
    }
    
    func getContents() -> String {
        return contents
    }
}

let editor = Editor()
editor.setContents(contents: "My name is")
editor.save()
editor.setContents(contents: "My name is Derek")
editor.save()
editor.setContents(contents: "My name is")
editor.save()
editor.setContents(contents: "My name is Juan")

editor.undo()
editor.undo()

editor.getContents()