# ones_and_zeros
This label on a fairly good bottle of wine caught my eye. Is there an encoded
message?

![alt text](https://github.com/aaronferrucci/ones_and_zeros/blob/master/ones_and_zeros.jpg "JPG image of label")

Result:
```
$ perl decode.pl raw_data.txt
       ' '          e        ' '         hi xx1x0x01
       ' '          e        ' '   GOW_gow⌂       EUeu
       ' '          e        ' '         mí       %e¥å
#black--------------------------------------
      hilm          c       hijk         vw          c
        dl         eå       dfln     ' '"$&          e
  pqrstuvw         gw         s{ ►↑' '(08          g
#black--------------------------------------
         e 01xxxxxx xxxxxxxx  ►' '0@P`p          h
       ' '         de     ' '!"# xxxx0001          d
         e          n       deäå xx10xx00          n
#black--------------------------------------
         e          h 011xxxxx ' '!`a ¡àá          h
         n        ' ' 011xxxx0         aq       ' ' 
       ' '          l 0xxxx00x         t|         ,l
#red----------------------------------------
       ' '         sw xxxx0000   ♂ +/KOko         Ss
       ' '       %e¥å ' '(`h "àè       sw{⌂         eu
      tuvw     ' '!"#         pt       `ahi     ' '0 °
#black--------------------------------------
        sw       aeim         rs        ' ' 01xx0x0x
        br      ►' '0          b         rò     ' '` à
0010xxxx         tô        ' ' 011xxxxx          t
```

Result, restricted to printable characters:
```
$ perl decode.pl raw_data.txt
       ' '          e        ' '         hi   !%15aequ
       ' '          e        ' '    GOW_gow       EUeu
       ' '          e        ' '          m         %e
#black--------------------------------------
      hilm          c       hijk         vw          c
        dl          e       dfln     ' '"$&          e
  pqrstuvw         gw         s{     ' '(08          g
#black--------------------------------------
         e 01xxxxxx xxxxxxxx   ' '0@P`p          h
       ' '         de     ' '!"#     !1AQaq          d
         e          n         de ' '$(,`dhl          n
#black--------------------------------------
         e          h 011xxxxx     ' '!`a          h
         n        ' ' 011xxxx0         aq        ' '
       ' '          l 0xxxx00x         t|         ,l
#red----------------------------------------
       ' '         sw   ' '0@P`p     +/KOko         Ss
       ' '         %e     ' '(`h        sw{         eu
      tuvw     ' '!"#         pt       `ahi       ' '0
#black--------------------------------------
        sw       aeim         rs        ' ' 01xx0x0x
        br       ' '0          b          r       ' '`
0010xxxx          t        ' ' 011xxxxx          t
```
