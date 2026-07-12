.data
B: .double 5.85
h: .double 13.4
valor: .double 2
res: .double 0
.code
l.d f1,B($zero)
l.d f2, h($zero)
mul.d f2,f2,f1
l.d f3,valor($zero)
div.d f2,f2,f3
s.d f2, res($zero)
halt

