Loaded: /home/profs/aycock/411/sw/share/spim/exceptions.s
if ((A && B) || C) {...} else {...}, with A=false B=false C=false
evaluated A
evaluated C
else-part executed

if ((A && B) || C) {...} else {...}, with A=false B=false C=true
evaluated A
evaluated C
if-part executed

if ((A && B) || C) {...} else {...}, with A=false B=true C=false
evaluated A
evaluated C
else-part executed

if ((A && B) || C) {...} else {...}, with A=false B=true C=true
evaluated A
evaluated C
if-part executed

if ((A && B) || C) {...} else {...}, with A=true B=false C=false
evaluated A
evaluated B
evaluated C
else-part executed

if ((A && B) || C) {...} else {...}, with A=true B=false C=true
evaluated A
evaluated B
evaluated C
if-part executed

if ((A && B) || C) {...} else {...}, with A=true B=true C=false
evaluated A
evaluated B
if-part executed

if ((A && B) || C) {...} else {...}, with A=true B=true C=true
evaluated A
evaluated B
if-part executed

x = (A && !B) || C, with A=false B=false C=false
evaluated A
evaluated C
x=false

x = (A && !B) || C, with A=false B=false C=true
evaluated A
evaluated C
x=true

x = (A && !B) || C, with A=false B=true C=false
evaluated A
evaluated C
x=false

x = (A && !B) || C, with A=false B=true C=true
evaluated A
evaluated C
x=true

x = (A && !B) || C, with A=true B=false C=false
evaluated A
evaluated B
x=true

x = (A && !B) || C, with A=true B=false C=true
evaluated A
evaluated B
x=true

x = (A && !B) || C, with A=true B=true C=false
evaluated A
evaluated B
evaluated C
x=false

x = (A && !B) || C, with A=true B=true C=true
evaluated A
evaluated B
evaluated C
x=true
