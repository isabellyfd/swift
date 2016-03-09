//
//  main.swift
//  Forca
//
//  Created by Isabelly Damascena on 3/9/16.
//  Copyright © 2016 Isabelly Damascena. All rights reserved.
//

import Foundation

extension String {
    subscript (i: Int) -> Character{
        return self[self.startIndex.advancedBy(i)]
    }
}

var errors : Int = 6
var missed : [Character] = []
print ("Digite uma palavra para seu amigo adivinhar:🐔🐔")
var word : String = input().lowercaseString
var done : Bool = false

var result : String =  ""

for x in word.characters {
    result = result + "_"
}

var i : Int = 0

while i < 100 {
    print("\n")
    i += 1
}



while !done {
    
    if result != word {
        if missed != []{
            print("voce ja tentou as letras ", missed)
        }
        
        print(result)
        
        print("Voce pode errar ate", errors, "vezes, digite uma letra:")
        var letter : String =  input().lowercaseString
        
        while letter.characters.count > 1{
            print("Digite 'uma'letra:")
            letter = input().lowercaseString
        }
        
        
        var point :  Bool = false
        
        for x in word.characters {
            //print(x)
            
            if x == letter[0]{
                var iterate : Int = 0
                var string = ""
                while iterate < result.characters.count {
                    if result[iterate] == "_" && word[iterate] ==  letter[0]{
                        string = string + String(letter[0]).uppercaseString
                        //print("Entrou")
                        point = true
                    }
                    else{
                        string = string + String(result[iterate]).uppercaseString
                    }
                    iterate += 1
                }
                result = string
            }
        }
        
        if !point {
            errors -= 1
            missed.append(letter[0])
        }
        
        if errors == 0{
            done = true
        }
        
    }
    else{
        done = true
    }
    
}


if done {
    print("Muito bem, carinha!!")
    print("A palavra era", word)
}
else{
    print("A palavra era", word)
    print("Sorry!!!")
}