// Learn more about F# at http://fsharp.net
// See the 'F# Tutorial' project for more help.

let non_del X Y = 
    if X % Y =0   then false
                  else true

let rec pros X Y =
        if X=Y then true
        else (non_del X Y) && (pros X (Y+1))


let pr n = 
    match n with
    | 2 -> true
    | _ -> pros n 2 

let p9_5 = 
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    pr a

[<EntryPoint>]
let main argv = 
    
    let Ans = p9_5
    System.Console.Write(Ans)
    let z=System.Console.ReadKey()
    
    0 // return an integer exit code
