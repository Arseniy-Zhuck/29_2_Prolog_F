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

let rec npd x y = 
    if (x%y = 0)&&(pr y) then y
    else npd x (y-1) 
    

let n_pd a = npd a a

let p9_8 = 
    let a= System.Convert.ToInt32(System.Console.ReadLine())
    n_pd a

let rec gcd x y =
    if y =0 then x
    else gcd y (x % y)

let p9_9 =
    let c= System.Convert.ToInt32(System.Console.ReadLine())
    let d= System.Convert.ToInt32(System.Console.ReadLine())
    gcd c d

let rec fe a b c = 
    if (b = 0) then c
    else if (gcd a b = 1) then fe a (b-1) (c+1)
    else fe a (b-1) c
       

let p9_10 =
    let a= System.Convert.ToInt32(System.Console.ReadLine())
    fe a (a-1) 0


[<EntryPoint>]
let main argv = 
    let Ans = p9_8
    System.Console.Write(Ans)
    let z = System.Console.ReadKey() 
    
    printfn "%A" argv
    0 // return an integer exit code
