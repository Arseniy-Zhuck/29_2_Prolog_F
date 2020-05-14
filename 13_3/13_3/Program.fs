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

let count list el =
    let rec count1 n el = function
        [] -> n
        |h::t -> if el=h then count1 (n+1) el t
                        else count1 n el t
    count1 0 el list

let prog list=
    let rec prog1 sublist list = function
        [] -> sublist
        |h::t ->    let l1=h::sublist
                    if (h%2=0)&&((count list h)%2=0)    then prog1 l1 list t
                                else prog1 sublist list t
    prog1 [] list list

let rec write_list (list:int list)=
    match list with 
    |[] ->  let z=System.Console.ReadKey()
            0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t   


[<EntryPoint>]
let main argv = 
    let l=read_data
    let l2= prog l
    write_list l2 // return an integer exit code
