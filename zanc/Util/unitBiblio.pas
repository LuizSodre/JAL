unit unitBiblio;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ComCtrls, StdCtrls, ExtCtrls, Mask, DBCtrls, dbtables;

procedure chamafrm(tipo: TFormClass; dono: TComponent; prParent : TPanel);
procedure buscacab0(cab0: string);
function enviacab():string;
function viradata(text: string):string;

implementation

var
   cabx: string;

procedure chamafrm(tipo: TFormClass; dono: TComponent; prParent : TPanel);
begin
  with tipo.Create(dono) do
   try
     ShowModal;
     Parent := prParent;
   finally
     Free;
   end;
end;

procedure buscacab0(cab0: string);
begin
cabx:= cab0;
end;

function enviacab():string;
begin
if cabx <> '' then
   Result:= cabx
else
    Result:= 'cab0000';
end;

function viradata(text: string):string;
var
   aux: string;
   i: integer;
   Present: TDateTime;
   ano, mes, dia: word;
begin
try
   aux:= '';
   for i:= 1 to Length(text) do
       begin
       if (copy(text,i,1)<>'.') and
          (copy(text,i,1)<>'-') and
          (copy(text,i,1)<>'/') and
          (copy(text,i,1)<>'\') then
          aux:= aux+copy(text, i, 1);
       end;
   aux:= copy(aux,1,2)+'/'+copy(aux,3,2)+'/'+copy(aux,5,4);
   Present:= StrToDate(aux);
   DecodeDate(Present, ano, mes, dia);
   aux:= IntToStr(dia)+'/'+IntToStr(mes)+'/'+IntToStr(ano);
   result:= aux;
except on E:EDBEngineError do
          MessageDlg('ERRO NO SISTEMA !!! Código do erro '+IntToStr(E.Errors[0].ErrorCode)+' = '+E.Errors[0].Message
          ,mtError,[mbOK],0);
       end;
end;
end.
