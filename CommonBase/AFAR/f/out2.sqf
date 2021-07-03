if(!r_dn_ && !r_up_)exitWith{};params["_ch","_p"];
if(isNil"_p")then{_p=allPlayers-[r_p]select{side _x==playerSide}};
switch(_ch)do{
case 1:{{r_p remoteExecCall["r_out",_x]}forEach _p};
case 2:{{r_p remoteExecCall["r_out",_x]}forEach _p};
case 3:{{r_p remoteExecCall["r_out",_x]}forEach _p};
case 4:{{"outB2"remoteExecCall["playSound",_x]}forEach _p};
case(ch6+5):{{r_p remoteExecCall["r_out",_x]}forEach _p};
case(ch7+5):{{r_p remoteExecCall["r_out",_x]}forEach _p};
case(ch8+5):{{r_p remoteExecCall["r_out",_x]}forEach _p}};