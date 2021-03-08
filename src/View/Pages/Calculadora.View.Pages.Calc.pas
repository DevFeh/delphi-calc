unit Calculadora.View.Pages.Calc;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons, System.Actions, Vcl.ActnList;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;

    lbl1: TLabel;
    lbl2: TLabel;
    
    btnDivisao: TSpeedButton;
    btnSoma: TSpeedButton;
    btnSubtrai: TSpeedButton;
    btnMultiplica: TSpeedButton;

    btnLimpaTudo: TSpeedButton;
    btnApaga: TSpeedButton;
    btnLimpa: TSpeedButton;
    btnIgual: TSpeedButton;

    Button1: TSpeedButton;
    Button2: TSpeedButton;
    Button3: TSpeedButton;    
    Button8: TSpeedButton;
    Button9: TSpeedButton;
    Button10: TSpeedButton;
    Button11: TSpeedButton;
    Button12: TSpeedButton;
    Button13: TSpeedButton;
    Button14: TSpeedButton;
    Button15: TSpeedButton;
    Button16: TSpeedButton;
    

    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    // Soma
    function somar(Value1, Value2 : Integer) : Integer;

    // Subtração
    function subtrair(Value1, Value2 : Integer) : Integer;

    // Mutiplicação
    function multiplicar(Value1, Value2 : Integer) : Integer;

    // Dividir
    function dividir(Value1, Value2 : Integer) : Integer;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
var
  x : String;

  IntValue1 : Integer;
  IntValue2 : Integer;

  CurrValue1 : Currency;
  CurrValue2 : Currency;

begin

  if Key = #43 then
  begin
    try
      tryStrToInt(lbl1.Caption, IntValue1);
    except
      IntValue1 := 0;
    end;

    IntValue2 := StrToInt(lbl2.Caption);

    try
      somar(IntValue1, IntValue2);
    except
      lbl2.Caption := '0';
    end;

    lbl1.Caption := lbl2.Caption + ' + ';
  end;
  if Key = #45 then
  begin
    lbl1.Caption := lbl2.Caption + ' - ';
    lbl2.Caption := '';
  end;
  if Key = #42 then
  begin
    lbl1.Caption := lbl2.Caption + ' × ';
    lbl2.Caption := '';
  end;
  if Key = #47 then
  begin
    lbl1.Caption := lbl2.Caption + ' ÷ ';
    lbl2.Caption := '';
  end;

  if Key = #48 then
    lbl2.Caption := lbl2.Caption + '0';
  if Key = #49 then
    lbl2.Caption := lbl2.Caption + '1';
  if Key = #50 then
    lbl2.Caption := lbl2.Caption + '2';
  if Key = #51 then
    lbl2.Caption := lbl2.Caption + '3';
  if Key = #52 then
    lbl2.Caption := lbl2.Caption + '4';
  if Key = #53 then
    lbl2.Caption := lbl2.Caption + '5';
  if Key = #54 then
    lbl2.Caption := lbl2.Caption + '6';
  if Key = #55 then
    lbl2.Caption := lbl2.Caption + '7';
  if Key = #56 then
    lbl2.Caption := lbl2.Caption + '8';
  if Key = #57 then
    lbl2.Caption := lbl2.Caption + '9';

  if Key = #13 then
    lbl2.Caption := lbl2.Caption;

  if Key = #8 then
  begin
    x := lbl2.Caption;
    Delete(x, length(x), 1);
    lbl2.Caption := x;
  end;

end;

function TForm2.somar(Value1, Value2: Integer): Integer;
var
  Resultado : Integer;
begin
  Resultado := Value1 + Value2;
  lbl2.Caption := IntToStr(Resultado);
end;

function TForm2.subtrair(Value1, Value2: Integer): Integer;
var
  Resultado : Integer;
begin
  Resultado := Value1 - Value2;
  lbl1.Caption := IntToStr(Resultado);
end;

function TForm2.dividir(Value1, Value2: Integer): Integer;
var
  Resultado : Integer;
begin
  Resultado := Value1 div Value2;
  lbl1.Caption := IntToStr(Resultado);
end;

function TForm2.multiplicar(Value1, Value2: Integer): Integer;
var
  Resultado : Integer;
begin
  Resultado := Value1 * Value2;
  lbl1.Caption := IntToStr(Resultado);
end;

end.
