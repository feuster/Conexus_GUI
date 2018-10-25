unit PIN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, MaskEdit,
  StdCtrls, ExtCtrls;

type

  { TPINForm }

  TPINForm = class(TForm)
    OKButton: TButton;
    Label1: TLabel;
    PINEdit: TMaskEdit;
    Panel1: TPanel;
    procedure OKButtonClick(Sender: TObject);
    procedure PINEditClick(Sender: TObject);
    procedure PINEditEnter(Sender: TObject);
    procedure PINEditKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  PINForm: TPINForm;

implementation

{$R *.lfm}

{ TPINForm }

procedure TPINForm.OKButtonClick(Sender: TObject);
//close the PIN form
begin
  PINForm.ModalResult:=mrOK;
end;

procedure TPINForm.PINEditClick(Sender: TObject);
//start with a defined selection position
begin
  PINEditEnter(nil);
end;

procedure TPINForm.PINEditEnter(Sender: TObject);
//start with a defined selection position
begin
  PINEdit.SelStart:=0;
  PINEdit.SelLength:=1;
end;

procedure TPINForm.PINEditKeyPress(Sender: TObject; var Key: char);
//use key control
begin
  //accept input
  if Key=#13 then
    OKButtonClick(nil);

  //decline input
  if Key=#27 then
    begin
      PINEdit.EditText:='';
      OKButtonClick(nil);
    end;
end;

end.

