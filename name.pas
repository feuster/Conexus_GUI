unit Name;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, MaskEdit;

type

  { TNameForm }

  TNameForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    NameEdit: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  NameForm: TNameForm;

implementation

{$R *.lfm}

{ TNameForm }

procedure TNameForm.OKButtonClick(Sender: TObject);
//close the Name form
begin
  NameForm.ModalResult:=mrOK;
end;

procedure TNameForm.CancelButtonClick(Sender: TObject);
//close the Name form
begin
  NameForm.ModalResult:=mrCancel;
end;

procedure TNameForm.NameEditKeyPress(Sender: TObject; var Key: char);
//restrict allowed key codes
begin
  //accept input
  if Key=#13 then
    OKButtonClick(nil);

  //decline input
  if Key=#27 then
    begin
      NameEdit.Text:='';
      CancelButtonClick(nil);
    end;

  //allow only basic ASCII and some CTRL+[C/V/X/Z] control codes
  if not (Key in [#3, #8, #22, #24, #26, #31..#127]) then
    Key:=#0;
end;

end.

