unit Calculador.Services.Interfaces;

interface

uses
  Vcl.StdCtrls,
  System.SysUtils,
  System.Classes,
  System.Generics.Collections;

type
  TEventoDisplayCalculadora = procedure(Value: Integer) of Object;
  TEventoLogCalculadora = procedure(Value: String) of object;

  iCalculadora = interface
    ['{8C1EFEDC-9F06-4C9D-BFBA-68B4584EF607}']

    function Adicionar(Value: Integer): iCalculadora;
    function Somar: iCalculadora;
    function Subtrair: iCalculadora;
    function Display(Evento: TEventoDisplayCalculadora): iCalculadora;
    function Log(Log: TEventoLogCalculadora): iCalculadora;
  end;

  TCalculadora = class(TInterfacedObject, iCalculadora) 
  private
    FValores: TList<Integer>;
    FTotal: Integer;
    FEvento: TEventoDisplayCalculadora;
    FLog: TEventoLogCalculadora;
  
  public
    constructor Create;
    destructor Destroy; override;

    class function New: iCalculadora;

    function Adicionar(Value: Integer): iCalculadora;
    function Somar: iCalculadora;
    function Subtrair: iCalculadora;
    function Display(Evento: TEventoDisplayCalculadora): iCalculadora;
    function Log(Log: TEventoLogCalculadora): iCalculadora;   
  end;

implementation

{ TCalculadora }

function TCalculadora.Adicionar(Value: Integer): iCalculadora;
begin
  Result := Self;
  FValores.Add(Value);

  if Assigned(FLog) then
    FLog('Adicionou ' + IntToStr(Value));
end;

constructor TCalculadora.Create;
begin
  FValores := TList<Integer>.Create;
end;

destructor TCalculadora.Destroy;
begin
  FValores.Free;
  inherited;
end;

function TCalculadora.Display(Evento: TEventoDisplayCalculadora): iCalculadora;
begin
  Result := Self;
  FEvento := Evento;
end;

function TCalculadora.Log(Log: TEventoLogCalculadora): iCalculadora;
begin
  Result := Self;
  FLog := Log;
end;

class function TCalculadora.New: iCalculadora;
begin
  Result := Self.Create;
end;

function TCalculadora.Somar: iCalculadora;
var
  i: Integer;
begin
  Result := Self;

  for i in FValores do
    FTotal := FTotal + i;
    
  if Assigned(FEvento) then
    FEvento(FTotal);

  if Assigned(FLog) then    
    FLog('Somou');
end;

function TCalculadora.Subtrair: iCalculadora;
begin
  Result := Self;
end;

end.
