program ConexusGUI;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,cmem,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Main, SplashScreen, PIN, Name
  { you can add units after this };

{$R *.res}

begin
  Application.Scaled:=True;
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSplashScreenForm, SplashScreenForm);
  Application.CreateForm(TPINForm, PINForm);
  Application.CreateForm(TNameForm, NameForm);
  Application.Run;
end.

