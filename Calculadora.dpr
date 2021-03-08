program Calculadora;

uses
  Vcl.Forms,
  Calculadora.View.Pages.Calc in 'src\View\Pages\Calculadora.View.Pages.Calc.pas' {Form2},
  Calculadora.View.Main in 'src\View\Calculadora.View.Main.pas' {Form1},
  Calculadora.View.Styles.Colors in 'src\View\Styles\Calculadora.View.Styles.Colors.pas' {$R *.res},
  Calculador.Services.Interfaces in 'src\Services\Calculador.Services.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  { Application.CreateForm(TForm1, Form1); }
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
