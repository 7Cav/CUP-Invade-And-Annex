params["_p"];private _nAI=_p nearEntities["Man",9]select{!isPlayer _x};
if(count _nAI>0)then{{if(_x knowsAbout _p<=1.5)then{[_x,[_p,1.5]]remoteExecCall["reveal",2]}}forEach _nAI}