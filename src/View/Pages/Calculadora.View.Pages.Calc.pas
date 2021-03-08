unit Calculadora.View.Pages.Calc;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  System.Actions,
  System.StrUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.ActnList,
  Calculador.Services.Interfaces;

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
    Memo1: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FCalculadora: iCalculadora;
  public
    procedure MostraResultado(Value: Integer);
    procedure AddLog(ALog: String);
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  FCalculadora := TCalculadora.
    New.
    Display(MostraResultado).
    Log(AddLog);
end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
var
  ATexto: string;
begin
  // SOMA
  if Key = #43 then
  begin
    FCalculadora.Somar;
    lbl1.Caption := lbl2.Caption + ' + ';
  end;

  // SUBTRACAO
  if Key = #45 then
  begin
    lbl1.Caption := lbl2.Caption + ' - ';
    lbl2.Caption := '';
  end;

  // MULTIPLICACAO
  if Key = #42 then
  begin
    lbl1.Caption := lbl2.Caption + ' × ';
    lbl2.Caption := '';
  end;

  // DIVISAO
  if Key = #47 then
  begin
    lbl1.Caption := lbl2.Caption + ' ÷ ';
    lbl2.Caption := '';
  end;

  if Key = #48 then
  begin
    lbl2.Caption := lbl2.Caption + '0';
    FCalculadora.Adicionar(0);
  end;
  if Key = #49 then
  begin
    lbl2.Caption := lbl2.Caption + '1';
    FCalculadora.Adicionar(1);
  end;
  if Key = #50 then
  begin
    lbl2.Caption := lbl2.Caption + '2';
    FCalculadora.Adicionar(2);
  end;
  if Key = #51 then
  begin
    lbl2.Caption := lbl2.Caption + '3';
    FCalculadora.Adicionar(3);
  end;
  if Key = #52 then
  begin
    lbl2.Caption := lbl2.Caption + '4';
    FCalculadora.Adicionar(4);
  end;
  if Key = #53 then
  begin
    lbl2.Caption := lbl2.Caption + '5';
    FCalculadora.Adicionar(5);
  end;
  if Key = #54 then
  begin
    lbl2.Caption := lbl2.Caption + '6';
    FCalculadora.Adicionar(6);
  end;
  if Key = #55 then
  begin
    lbl2.Caption := lbl2.Caption + '7';
    FCalculadora.Adicionar(7);
  end;
  if Key = #56 then
  begin
    lbl2.Caption := lbl2.Caption + '8';
    FCalculadora.Adicionar(8);
  end;
  if Key = #57 then
  begin
    lbl2.Caption := lbl2.Caption + '9';
    FCalculadora.Adicionar(9);
  end;

    //
  if Key = #13 then
    lbl2.Caption := lbl2.Caption;

  // APAGAR
  if Key = #8 then
  begin
    ATexto := lbl2.Caption;
    Delete(ATexto, length(ATexto), 1);
    lbl2.Caption := ATexto;
  end;

end;

procedure TForm2.MostraResultado(Value: Integer);
begin
  lbl2.Caption := IntToStr(Value);
end;

procedure TForm2.AddLog(ALog: String);
begin
  Memo1.Lines.Add(ALog);
end;





end.
