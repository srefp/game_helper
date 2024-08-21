#Include "./reg.ahk" ; 引入函数

newRoute(filePath) {
    routeItems := []
    fileContent := FileRead(filePath, "UTF-8")
;    routeLines := StrSplit(fileContent, "`n")

    Loop parse, fileContent, "`n", "`r" {
        line := A_LoopField
        routeItem := {}
        if (Trim(line) = "") {
            continue
        }

        ; 删除注释部分
        if (InStr(line, ';') != 0) {
            line := SubStr(line, 1, InStr(line, ';') - 1)

            if (Trim(line) = "") {
                continue
            }
        }

        ; 删除注释部分
        if (InStr(line, "--") != 0) {
            line := SubStr(line, 1, InStr(line, "--") - 1)

            if (Trim(line) = "") {
                continue
            }
        }

        keys := RegExMatchAll(line, ",* *(\w+): *")
        newLine := RegExReplaceEx(line, ",* *(\w+): *", (m)=>"@")
        values := StrSplit(newLine, "@")
        realValues := []
        for (val in values) {
            value := Trim(val)
            if (StrLen(value) != 0) {
                if (SubStr(value, 1, 1) = "[") {
                    value := StrReplace(value, "[")
                    value := StrReplace(value, "]")
                    nums := StrSplit(value, ",")
                    numValues := []
                    for (num in nums) {
                        if (StrLen(Trim(num)) = 6) {

                        }
                        numValues.push(Trim(num))
                    }
                    realValues.push(numValues)
                } else if (value = "false") {
                    realValues.push(false)
                } else if (value = "true") {
                    realValues.push(true)
                } else {
                    realValues.push(value)
                }
            }
        }
        len := keys.Length
        idx := 0
        while (idx < len) {
            idx++
            value := Trim(values[idx])
            routeItem.%keys[idx][1]% := realValues[idx]
        }
        routeItems.push(routeItem)
    }
    return routeItems
}
