// Learn more about F# at http://fsharp.net
// See the 'F# Tutorial' project for more help.
let y b =
    b*b

[<EntryPoint>]
let main argv = 
    

    let solve a b c =
        let D = b*b - 4.0*a*c
        ((-b-sqrt(D))/(2.0*a),(-b+sqrt(D))/(2.0*a))
    printfn "%A%A" solve (1.0, 2.0, -3.0)
    
    let x = y 10 in    
        printfn "%i" x
    let z = System.Console.ReadKey()
    
    printfn "%A" argv
    
    0 // return an integer exit code
