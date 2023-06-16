import UIKit

var str = "Hello, playground"
let opening_Hours = "בתיאום מראש"
let result = opening_Hours.split(separator: ",")
let resultEnter = opening_Hours.components(separatedBy: "  ")
print(result.count)
var newOpening_Hours = "שעות פתיחה" + "\n"
print(resultEnter.count)
if resultEnter.count < 2{
    if result.count > 0{
        for i in 0...result.count-1{
            print(result[i])
            newOpening_Hours = newOpening_Hours + result[i] + "\n"
            
        }
    }
}
else{
    for i in 0...resultEnter.count-1{
        for char in resultEnter[i].unicodeScalars {
            if char.isASCII {
                print(resultEnter[i])
                newOpening_Hours = newOpening_Hours + resultEnter[i] + "\n"
                break
            }
            
        }
    }
}
print( newOpening_Hours)
