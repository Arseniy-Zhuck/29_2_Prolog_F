// Learn more about F# at http://fsharp.net
// See the 'F# Tutorial' project for more help.
let max2 x y =
    if x>y then x
    else y
let min2 x y =
    if x<y then x
    else y
let sum2 x y = x+y
let pr x y =x*y



let rec cifri f n init= 
    if n=0 then init 
    else
        let ost = n%10
        f ost (cifri f (n/10) init) 


let p9_7 = 
    let x = System.Convert.ToInt32(System.Console.ReadLine())
    (cifri sum2 x 0, cifri pr x 1, cifri max2 x 0, cifri min2 x 10)


[<EntryPoint>]
let main argv = 
    let Ans= p9_7
    System.Console.Write(Ans)
    let z = System.Console.ReadKey() 
    
    printfn "%A" argv
    0 // return an integer exit code
