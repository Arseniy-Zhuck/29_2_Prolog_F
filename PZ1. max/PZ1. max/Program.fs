// Learn more about F# at http://fsharp.net
// See the 'F# Tutorial' project for more help.
let max2 x y =
    if x>y then x
    else y

let p1_1 = 
    let b = System.Convert.ToInt32(System.Console.ReadLine())
    let c = System.Convert.ToInt32(System.Console.ReadLine())
    max2 b c

[<EntryPoint>]
let main argv =
    let Ans = p1_1
    System.Console.Write(Ans)
    let z = System.Console.ReadKey()
//    let Ans1 = p1_2
  //  System.Console.Write(Ans1)
    //let z = System.Console.ReadKey()
    0 // return an integer exit code
