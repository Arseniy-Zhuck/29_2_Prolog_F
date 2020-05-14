// Learn more about F# at http://fsharp.net
// See the 'F# Tutorial' project for more help.

let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

let prov H = H%2=0

let rec prog2 prov h t =
    match t with
    |[] -> h
    |head::tail -> if ((prov h) = (prov head))&&(head>h) then prog2 prov head tail
                                                         else prog2 prov h tail 

let prog list =
    match list with
    | []-> 0
    | head::tail -> prog2 prov head tail 


[<EntryPoint>]
let main argv =
    let l= read_data
    let Ans= prog l
    System.Console.WriteLine(Ans)
    let z=System.Console.ReadKey()
    printfn "%A" argv
    0 // return an integer exit code
