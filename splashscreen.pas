unit SplashScreen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls;

type

  { TSplashScreenForm }

  TSplashScreenForm = class(TForm)
    SplashScreenText: TLabel;
    Logo: TImage;
    Panel1: TPanel;
    Status: TStatusBar;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  SplashScreenForm: TSplashScreenForm;


implementation

uses
  Main;

{$R *.lfm}

{ TSplashScreenForm }

procedure TSplashScreenForm.FormCreate(Sender: TObject);
//Show logo
begin
  MainForm.DeviceBigImageList.GetBitmap(0,Logo.Picture.Bitmap);
end;

end.

