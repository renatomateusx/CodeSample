func generatePascalTriangle(numRows: Int){
    var results = [[Int]]()
    
    if (numRows == 0) {
        return
    }

    for i in 0..<numRows {
        var currentResults = [Int]()

        // Print spaces
        for _ in 0..<(numRows - i - 1) {
            print(" ", terminator:"")
        }

        // Print values
        for j in 0...i {
            if (i > 1 && j > 0 && j < i) {
                let value = results[i-1][j] + results[i-1][j-1]
                currentResults.append(value)

                print("\(value) ", terminator: "")
            } else {
                currentResults.append(1)
                print("\(1) ", terminator: "")
            }
        }
        
        results.append(currentResults)
        print("\n")
    }
}

// Prompt the user for the number of rows through the console e.g "10"
print("Insert the number of rows for the triangle:")
let numberOfRows:Int? = 6

// Print the pascals triangle in the console with the given number of rows
generatePascalTriangle(numRows: numberOfRows!)
