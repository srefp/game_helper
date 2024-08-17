newRoute(filePath) {
    routeItems := []
    fileContent := FileRead(filePath, "UTF-8")
    routeLines := StrSplit(fileContent, "`n")
    for line in routeLines {
        if (Trim(line) = "") {
            continue
        }
        FoundPos := RegExMatch(line, ",* *(\w+): *")
        MsgBox("FoundPos: " . FoundPos . "`n")
    }

}

newRoute("../../timing/骗骗花.txt")
