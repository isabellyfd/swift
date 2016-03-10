//
//  main.swift
//  Forca_Mod
//
//  Created by Isabelly Damascena on 3/10/16.
//  Copyright © 2016 Isabelly Damascena. All rights reserved.
//

import Foundation

extension String {
    subscript (i: Int) -> Character{
        return self[self.startIndex.advancedBy(i)]
    }
}

func printSpaces()-> Void {
    for _ in (0...99){
        print("\n")
    }
}

func getWord ( var word: String ) -> String {
    word =  input().lowercaseString
    return word
}

func getResult ( word: String ) ->  String {
    var result : String = ""
    for _  in word.characters {
        result += "_"
    }
    return result
}

func alreadyMissed (missed : [Character]) -> Bool {
    return (missed != [])
}

var errors : Int = 6
var missed : [Character] = []
var word : String = ""
var done : Bool = false
var result : String = ""

print("Digite uma mensagem para seu amiguinho advinhar:")
word = getWord(word)
printSpaces()
result = getResult(word)

while !done {
    
    if result != word{
        if alreadyMissed(missed) {
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
            //print( x ==  letter[0])
            if x == letter[0]{
                var iterate : Int = 0
                var string = ""
                while iterate < result.characters.count {
                    if result[iterate] == "_" && word[iterate] ==  letter[0]{
                        string = string + String(letter[0]).uppercaseString
                        print("Entrou")
                        point = true
                    }
                    else{
                        string = string + String(result[iterate]).uppercaseString
                    }
                    iterate += 1
                }
                result = string
                //print(result)
            }
        }
        
        if !point {
            errors -= 1
            missed.append(letter[0])
        }
        
        if errors == 0 {
            done = true
        }
        
    }else {
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